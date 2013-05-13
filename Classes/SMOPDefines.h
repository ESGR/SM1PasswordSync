/*
 *  SMOPDefines.h
 *  SM1Password Sync
 *
 *  Created by sam on 3/18/13.
 *  Copyright 2013 Sam Marshall. All rights reserved.
 *
 */

#define kDeviceConnectionEventPosted @"SMOPNotificationPostDeviceConnectedEvent"
#define kLogMessageEventPosted @"SMOPNotifivationPostLogMessageEvent"


#define kOnePasswordBundleId @"com.agilebits.onepassword-ios"
#define kOnePasswordRemotePath @"/Documents/1Password.agilekeychain"
#define kOnePasswordInternalContentsPath @"/data/default/contents.js"
#define kOnePasswordInternalKeysPath @"/data/default/1password.keys"
#define kOnePasswordInternalEncryptionKeysPath @"/data/default/encryptionKeys.js"

#define kOnePasswordPreferencesPath [@"~/Library/Preferences/ws.agile.1Password.plist" stringByExpandingTildeInPath]

#define kSMOPApplicationSupportPath [@"~/Library/Application Support/SM1PasswordSync/" stringByExpandingTildeInPath]
#define kSMOPSyncPath [@"~/Library/Application Support/SM1PasswordSync/sync/" stringByExpandingTildeInPath]
#define kSMOPSyncStatePath [@"~/Library/Application Support/SM1PasswordSync/status/" stringByExpandingTildeInPath]
#define kSMOPInstallPath [@"~/Library/Application Support/SM1PasswordSync/install/" stringByExpandingTildeInPath]

#define kCopyToLocal @"ItemFromDevice"
#define kCopyToDevice @"ItemFromLocal"
#define kMerge @"ItemMerge"
#define kContents @"UpdatedContents"

#define kSMOPDeviceBackupPath @"/Documents/SMOP/1Password.agilekeychain"
#define kSMOPDeviceSyncStatePath @"/Documents/SMOP/SyncState.plist"
#define kSMOPDeviceLastSyncStatePath @"/Documents/SMOP/SyncState.LastState.plist"