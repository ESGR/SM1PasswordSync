//
//  NSAlert+Additions.m
//  SM1Password Sync
//
//  Created by sam on 3/19/13.
//  Copyright 2013 Sam Marshall. All rights reserved.
//

#import "NSAlert+Additions.h"


@implementation NSAlert(Additions)

+ (NSInteger)communciationErrorWithDevice:(NSString *)name {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Connection Error"];
	[alert setInformativeText:[NSString stringWithFormat:@"Cannot connect with selected \"%@\", please try disconnecting and reconnecting this device. If problem persists, try quiting iTunes if it is running.",name]];
	[alert setAlertStyle:NSCriticalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)connectionErrorWithDevice:(NSString *)name {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Connection Error"];
	[alert setInformativeText:[NSString stringWithFormat:@"Cannot connect with \"%@\", halting sync.",name]];
	[alert setAlertStyle:NSCriticalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)emptyKeychainAlertAtPath:(NSString *)path {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"Cancel"];
	[alert addButtonWithTitle:@"Continue"];
	[alert setMessageText:@"Keychain Error"];
	[alert setInformativeText:[NSString stringWithFormat:@"There was a problem with reading your agilekeychain file (%@), do you wish to continue the sync?",path]];
	[alert setAlertStyle:NSWarningAlertStyle];
	return [alert runModal];
}

+ (NSInteger)cannotFindLocalKeychain {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Keychain Missing"];
	[alert setInformativeText:[NSString stringWithFormat:@"Could not locate the local 1Password keychain file."]];
	[alert setAlertStyle:NSWarningAlertStyle];
	return [alert runModal];
}

+ (NSInteger)cannotFindKeychainOnDevice:(NSString *)name {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert addButtonWithTitle:@"Cancel"];
	[alert setMessageText:@"Keychain Missing"];
	[alert setInformativeText:[NSString stringWithFormat:@"Could not locate a 1Password keychain on \"%@\". Do you want to copy the local keychain to this device?",name]];
	[alert setAlertStyle:NSInformationalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)previousSyncError {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"Cancel"];
	[alert addButtonWithTitle:@"Repair"];
	[alert setMessageText:@"Previous Sync Error"];
	[alert setInformativeText:@"A previous sync could not be completed. Do you want to attempt a repair?"];
	[alert setAlertStyle:NSCriticalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)syncInterruptError {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Sync Interrupted"];
	[alert setInformativeText:@"Syncing has been interrupted. Please reconnect the device and sync again."];
	[alert setAlertStyle:NSCriticalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)keychainMismatchError {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Keychain Mismatch"];
	[alert setInformativeText:@"Syncing has been aborted. The encryption keys do not match, please ensure you are syncing the correct 1Password keychain."];
	[alert setAlertStyle:NSWarningAlertStyle];
	return [alert runModal];
}

+ (NSInteger)appInstallationFailure {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Install Failed"];
	[alert setInformativeText:@"Installing the 1Password app has failed. Please check if the selected device supports installation of this app."];
	[alert setAlertStyle:NSWarningAlertStyle];
	return [alert runModal];
}

+ (NSInteger)ipaNotFound {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"OK"];
	[alert setMessageText:@"Cannot find 1Password 4 iOS App "];
	[alert setInformativeText:@"Please make sure it is properly downloaded from the store."];
	[alert setAlertStyle:NSInformationalAlertStyle];
	return [alert runModal];
}

+ (NSInteger)mobileApplicationsNotFound {
	NSAlert *alert = [[[NSAlert alloc] init] autorelease];
	[alert addButtonWithTitle:@"Locate..."];
	[alert addButtonWithTitle:@"Cancel"];
	[alert setMessageText:@"Cannot Find Mobile Applications Folder"];
	[alert setInformativeText:@"Cannot locate the \"Mobile Applications\" folder from your iTunes Library. Please specify where your iTunes Library is stored."];
	[alert setAlertStyle:NSInformationalAlertStyle];
	return [alert runModal];
}


@end
