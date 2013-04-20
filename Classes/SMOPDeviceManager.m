//
//  SMOPDeviceManager.m
//  SM1Password Sync
//
//  Created by sam on 3/18/13.
//  Copyright 2013 Sam Marshall. All rights reserved.
//

#import "SMOPDeviceManager.h"
#import "SMOPDeviceDetector.h"

@implementation SMOPDeviceManager

@synthesize managerDevices;

- (id)init {
	self = [super init];
	if (self) {
		manager = [MobileDeviceAccess singleton];
		[manager setListener:self];
	}
	return self;
}

- (void)dealloc {
	[manager release];
	[super dealloc];
}

- (NSArray *)managerDevices {
	//NSMutableArray *allDevices = [NSMutableArray new];
	//[allDevices addObjectsFromArray:manager.devices];
	//NSArray *detectorResults = [SMOPDeviceDetector devicesSupportingIPhoneOS];
	return manager.devices;
}

- (BOOL)watchForConnection {
	return [manager waitForConnection];
}

- (NSArray *)devicesWithOnePassword4:(NSArray *)devices {
	NSMutableArray *deviceList = [[[NSMutableArray alloc] init] autorelease];
	NSArray *devicesCopy = [NSArray arrayWithArray:devices];
	for (AMDevice *device in devicesCopy) {
		if (![devices isEqualToArray:devicesCopy]) {
			break;
		}
		NSPredicate *findOnePassword = [NSPredicate predicateWithFormat:@"bundleid == %@",kOnePasswordBundleId];
		NSArray *results = [device.installedApplications filteredArrayUsingPredicate:findOnePassword];
		if (results.count) {
			NSString *lastSyncDate = @"Never";
			AFCApplicationDirectory *fileService = [device newAFCApplicationDirectory:kOnePasswordBundleId];
			if (fileService) {
				BOOL hasPasswordDatabase = [fileService fileExistsAtPath:kOnePasswordRemotePath];
				if (hasPasswordDatabase) {
					NSDictionary *fileInfo = [fileService getFileInfo:kOnePasswordRemotePath];
					NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
					[dateFormatter setDateFormat:@"MMM dd, yyyy HH:mm"];
					[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
					[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
					[dateFormatter setLocale:[NSLocale currentLocale]];
					[dateFormatter setDoesRelativeDateFormatting:YES];
					lastSyncDate = [dateFormatter stringFromDate:[fileInfo objectForKey:@"st_mtime"]];
					[dateFormatter release];
				}
				BOOL syncError = ([fileService fileExistsAtPath:@"/Documents/SMOP/SyncState.plist"] ? TRUE : ([[NSFileManager defaultManager] fileExistsAtPath:GetSyncStateFileForDevice([device udid])]? TRUE : FALSE));
				NSString *syncStatus = (syncError ? @"*!* " : @"");
				[fileService close];
				NSDictionary *deviceDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@%@",syncStatus,[device deviceName]], @"DeviceName", [device modelName], @"DeviceClass", lastSyncDate, @"SyncDate", [NSNumber numberWithBool:syncError], @"SyncError", nil];
				[deviceList addObject:deviceDict];
			}
			[fileService release];
		}
	}
	return [NSArray arrayWithArray:deviceList];
}

#pragma mark -
#pragma mark MobileDeviceAccessListener

- (void)deviceConnected:(AMDevice *)device {
	// post notification to refresh
	dispatch_async(dispatch_get_main_queue(), ^{
		[[NSNotificationCenter defaultCenter] postNotificationName:kDeviceConnectionEventPosted object:manager.devices userInfo:nil];
	});
}

- (void)deviceDisconnected:(AMDevice *)device {
	// post notification to refresh and cancel any syncs to this device
	dispatch_async(dispatch_get_main_queue(), ^{
		[[NSNotificationCenter defaultCenter] postNotificationName:kDeviceConnectionEventPosted object:manager.devices userInfo:nil];
	});
}

@end
