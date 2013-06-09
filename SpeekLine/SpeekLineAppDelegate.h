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
    NSTextField *_textline;
    NSTableView *_tv;
    NSSpeechSynthesizer * speech;
    NSArray * voices;
}
@property (strong) IBOutlet NSTextField *textline;
@property (strong) IBOutlet NSTableView *tv;

@property (strong) IBOutlet NSWindow *window;
- (IBAction)stop:(id)sender;
- (IBAction)speak:(id)sender;

@end
