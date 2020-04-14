//
//  NotesDetailViewController.m
//  Notes
//
//  Created by Qian on 4/14/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "NotesDetailViewController.h"
#import "NotesEditViewController.h"

@interface NotesDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation NotesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateNoteDisplay];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NotesEditViewController *editViewController = segue.destinationViewController;
    editViewController.note = self.note;
    
//    [self.navigationController pushViewController:editViewController animated:YES];
}


// MARK: - Unwind Segues, from NotesEditViewController

- (IBAction)cancel:(UIStoryboardSegue *)segue {
}

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    NotesEditViewController *sourceViewController = unwindSegue.sourceViewController;
    self.note.title = sourceViewController.titleTextField.text;
    self.note.content = sourceViewController.contentTextView.text;
    
    NSLog(@"In NotesDetailViewController, %@, %@", self.note.title, self.note.content);
    
    [self updateNoteDisplay];
    NSLog(@"In NotesDetailViewController, %@, %@", self.titleLabel.text, self.contentTextView.text);
}

- (void)updateNoteDisplay {
    self.titleLabel.text = self.note.title;
    self.contentTextView.text = self.note.content;
}

@end
