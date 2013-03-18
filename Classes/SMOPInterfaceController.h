//
//  SMOPInterfaceController.h
//  SM1Password Sync
//
//  Created by sam on 3/18/13.
//  Copyright 2013 Sam Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMOPDeviceManager.h"

@interface SMOPInterfaceController : NSObject <NSTableViewDataSource, NSTableViewDelegate> {
	IBOutlet NSTableView *deviceTable;
	IBOutlet NSButton *syncButton;
	IBOutlet NSButton *refreshButton;
	
	NSMutableArray *deviceList;
	
	SMOPDeviceManager *deviceAccess;
}

- (void)refreshWithData:(NSArray *)devices;

- (IBAction)syncData:(id)sender;
- (IBAction)refreshList:(id)sender;

#pragma mark -
#pragma mark NSTableView
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;
- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex;


@end
