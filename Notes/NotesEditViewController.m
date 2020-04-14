//
//  NotesEditViewController.m
//  Notes
//
//  Created by Qian on 4/14/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "NotesEditViewController.h"
#import "NotesDetailViewController.h"

@interface NotesEditViewController ()

@end

@implementation NotesEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleTextField.text = self.note.title;
    self.contentTextView.text = self.note.content;
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    self.note.title = self.titleTextField.text;
//    self.note.content = self.contentTextView.text;
//    NSLog(@"In EditViewController, %@, %@", self.note.title, self.note.content);
//}

@end
