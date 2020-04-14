//
//  NotesListTableTableViewController.h
//  Notes
//
//  Created by Qian on 4/13/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 The UITableView is a very important component on the iOS platform, basically every scrollable list of items (e.g. messages, email) is implemented using UITableView. UITableView declares two protocols UITableViewDataSource and UITableViewDelegate. The data source protocol is used by the table view to determine the content it needs to display, the delegate protocol is used to inform another class about cells that have been selected and to provide an interface for modifying the table view behavior.
 */
// UITableViewDataSource
// UITableViewDelegate

@interface NotesListTableTableViewController : UITableViewController

-(instancetype)init NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
