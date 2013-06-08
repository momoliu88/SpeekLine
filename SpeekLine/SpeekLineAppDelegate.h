//
//  SpeekLineAppDelegate.h
//  SpeekLine
//
//  Created by xiaoqinliu on 13-6-8.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeekLineAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *_window;
}

@property (strong) IBOutlet NSWindow *window;

@end
