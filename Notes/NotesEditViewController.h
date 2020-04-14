//
//  NotesEditViewController.h
//  Notes
//
//  Created by Qian on 4/14/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesEditViewController : UIViewController
@property (nonatomic, strong) Note *note;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@end

NS_ASSUME_NONNULL_END
