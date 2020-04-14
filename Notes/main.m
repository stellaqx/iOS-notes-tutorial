//
//  main.m
//  Notes
//
//  Created by Qian on 4/13/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// https://github.com/MakeSchool/iOS8-Notes
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
