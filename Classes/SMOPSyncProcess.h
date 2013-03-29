//
//  SMOPSyncProcess.h
//  SM1Password Sync
//
//  Created by sam on 3/18/13.
//  Copyright 2013 Sam Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMOPFunctions.h"

@protocol SMOPSyncProcessDelegate <NSObject>
-(void)syncItemNumber:(NSUInteger)item ofTotal:(NSUInteger)count;
@end

@interface SMOPSyncProcess : NSObject {
	NSString *localKeychainPath;
	NSString *mergeKeychainPath;
	
	AMDevice *device;
	
	NSMutableSet *localContents;
	NSMutableSet *deviceContents;
	
	BOOL deviceSyncError;
	
	id<SMOPSyncProcessDelegate> delegate;
}
@property (nonatomic, retain) id<SMOPSyncProcessDelegate> delegate;

- (AMDevice *)getSyncDevice;

- (void)setSyncDevice:(AMDevice *)syncDevice withSyncStatus:(BOOL)status;
- (void)loadContentsData;
- (void)synchronizePasswords;

- (BOOL)deviceSyncStateFileExistsLocally;

- (void)initiateSyncingProcess;
- (void)updateSyncingProcessToFile:(NSString *)name forSyncState:(NSString *)state;
- (void)finishSyncingProcess;

@end