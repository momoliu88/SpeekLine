//
//  SpeekLineAppDelegate.m
//  SpeekLine
//
//  Created by xiaoqinliu on 13-6-8.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "SpeekLineAppDelegate.h"

@implementation SpeekLineAppDelegate

@synthesize textline = _textline;
@synthesize tv = _tv;
@synthesize window = _window;

- (id)init {
    self = [super init];
    if (self) {
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        speech = [[NSSpeechSynthesizer alloc]
                        initWithVoice:nil];
        voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (IBAction)stop:(id)sender {
    [speech stopSpeaking];
}

- (IBAction)speak:(id)sender {
    NSString * str =[_textline stringValue];
    [speech startSpeakingString:str];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    NSString* voice = [voices objectAtIndex:rowIndex];
    NSDictionary * dict = [NSSpeechSynthesizer attributesForVoice:voice];
  //  NSLog(@"new voice = %@", voice);

    return [dict objectForKey:NSVoiceName];
}
- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    return NSMakeSize(frameSize.width, frameSize.width*1.5);    
}
- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    NSInteger row = [_tv selectedRow];
    NSLog(@"ROW = %ld",row);
    if(row == -1)
        return;
    NSString * voiceid = [voices objectAtIndex:row];
    [speech setVoice:voiceid];
}
-(void)awakeFromNib{
    NSString * defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger row = [voices indexOfObject:defaultVoice];
    NSIndexSet * indexSet = [[NSIndexSet alloc]initWithIndex:row];
    [_tv selectRowIndexes:indexSet byExtendingSelection:FALSE];
    [_tv scrollRowToVisible:row];

}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [voices count];
}
@end
