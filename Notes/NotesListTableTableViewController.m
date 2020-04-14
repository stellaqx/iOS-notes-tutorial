//
//  NotesListTableTableViewController.m
//  Notes
//
//  Created by Qian on 4/13/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "NotesListTableTableViewController.h"
#import "Note.h"
#import "NotesDetailViewController.h"
#import "NotesAddViewController.h"

@interface NotesListTableTableViewController ()

@property (nonatomic, strong) NSMutableArray *notes;

@end

@implementation NotesListTableTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        // use dummy data
        /*
        Note *note1 = [Note new];
        note1.title = @"Note 1 Title";
        note1.content = @"Note 1 Content";
        
        Note *note2 = [Note new];
        note2.title = @"Note 2 Title";
        note2.content = @"Note 2 Content";
        
        Note *note3 = [Note new];
        note3.title = @"Note 3 Title";
        note3.content = @"Note 3 Content";
        
        _notes = [@[note1, note2, note3] mutableCopy];
         */
        _notes = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// MARK: -

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // table view does not auto re-load data
    [self.tableView reloadData];
}

// MARK: -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"displayNote"]) {
        NotesDetailViewController *notesDetailViewController = [segue destinationViewController];
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        notesDetailViewController.note = self.notes[selectedIndexPath.row];
    } else if ([segue.identifier isEqualToString:@"addNote"]) {
    }
}

// MARK: - Unwind Segues, from NotesAddViewController

- (IBAction)cancelAdding:(UIStoryboardSegue *)segue {
    // does nothing
}

- (IBAction)doneAdding:(UIStoryboardSegue *)unwindSegue {
    NotesAddViewController *addViewController = unwindSegue.sourceViewController;
    Note *newNote = [Note new];
    newNote.title = addViewController.titleTextField.text;
    newNote.content = addViewController.contentTextView.text;
    [self.notes addObject:newNote];
    
    NSLog(@"In NotesListTableTableViewController, %@, %lu", self.notes, [self.notes count]);
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the amount of notes we have stored in the App.
    return [self.notes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // dynamically allocating cell as needed, and re-use the cell when it cannot be seen from the view
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesCell" forIndexPath:indexPath];
    
    NSInteger rowIndex = indexPath.row;
    cell.textLabel.text = [self.notes[rowIndex] title];
    
    return cell;
}

// MARK: - Deleting a note

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.notes removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
