//
//  ScreenBlocker.mm
//  ScreenBlocker
//
//  Created by Amit Apollo Barman on 9/10/19.
//  Copyright © 2019 Forcepoint, LLC. All rights reserved.
//

#import "ScreenBlocker.h"

@interface ScreenBlocker ()

@end

@implementation ScreenBlocker

+ (NSImageView *) getImage:(NSString *) image
                     frame:(CGRect) frame
{
    NSImageView *imageView = [[NSImageView alloc] init];
    [imageView setFrame:frame];
    [imageView setImage:[NSImage imageNamed:image]];
    [imageView setBoundsOrigin: NSZeroPoint];
    return imageView;
}

+ (NSWindow *) modifyWindow:(NSWindow *) window
                      frame:(NSRect) frame
                     screen:(NSScreen *) screen
{
    [window setBackgroundColor:[NSColor blackColor]];
    [window setCollectionBehavior:  NSWindowCollectionBehaviorStationary |
                                    NSWindowCollectionBehaviorCanJoinAllSpaces |
                                    NSWindowCollectionBehaviorFullScreenAuxiliary |
                                    NSWindowCollectionBehaviorTransient ];
    [window makeKeyAndOrderFront:NSApp];
    [window setAlphaValue:kConstAlphaDefault];
    [window setLevel:kCGMainMenuWindowLevel-1];
    [window toggleFullScreen:nil];
    return window;
}

+ (void) displayBlockScreen:(NSScreen *) screen
                      index:(int) idx
{
    NSMutableArray* windows = [[NSMutableArray alloc] init];
    NSRect frame = NSMakeRect(0,
                              0,
                              [screen frame].size.width,
                              [screen frame].size.height);
    NSWindow *window  = [[NSWindow alloc] initWithContentRect: frame
                                                    styleMask: NSWindowStyleMaskBorderless
                                                      backing: NSBackingStoreBuffered
                                                        defer: NO
                                                       screen: screen];
    
    
    
    if (screen == [NSScreen mainScreen])
    {
        NSLog(@"\n\tScreen idx: \t\t\t[%d] \n\tDetected: \t\t\t\t[Primary]\n\tBlocked Image: \t\t\t[%@]\n\tOpacity: \t\t\t\t[%f] \n",
              idx, kConstImageBlock, kConstAlphaDefault);
        NSImageView *imageView = [self getImage:kConstImageBlock frame:frame];
        [window.contentView addSubview:imageView];
    } else {
        NSLog(@"\n\tScreen idx: \t\t\t[%d] \n\tDetected: \t\t\t\t[Auxiliary]\n\tOpacity: \t\t\t\t[%f] \n\n",
              idx, kConstAlphaDefault);
        
    }
    [windows addObject:[self modifyWindow:window
                                    frame:frame
                                   screen:screen]];
}

+ (void) displayEnum
{
    int idx = 0;
    NSArray *screens = [NSScreen screens];
    NSUInteger count = [screens count];
    
    NSLog(@"\n\tTotal Screens: [%lu]\n\n", count);
    
    do {
        NSScreen *screen = [screens objectAtIndex:idx];
        [self displayBlockScreen:screen
                           index:idx];
        idx++;
    } while (idx < count);
}

+ (void) killScreenBlocker
{
    NSLog(@"\n\tDismissing Now...\n\n");
    exit(0);
}

+ (void) killScreenBlockerInterval:(float) seconds
{
    NSLog(@"\n\tDismissing in [%f] second(s)...\n\n", seconds);
    [self killIntervalSeconds:seconds];
}

+ (void) killIntervalSeconds:(float) seconds
{
    if (seconds > -1)
    {
        NSLog(@"\n\tDismissing in [%f] second(s)...\n\n", seconds);
        [NSTimer scheduledTimerWithTimeInterval: seconds
                                         target: self
                                       selector: @selector(killScreenBlocker)
                                       userInfo: nil
                                        repeats: NO];
    } else {
        NSLog(@"\n\tRunning Perpetually...\n\n");
    }
}

+ (void) displayBlockScreensInterval:(float) seconds
{
    [self displayEnum];
    [self killIntervalSeconds:seconds];
}

+ (void) displayBlockScreens
{
    [self displayBlockScreensInterval:kConstIntervalSeconds];
}

+ (void) chooseCommandFunction:(int) cmd
                       seconds:(int) seconds
{
    chooseCommandFunction(cmd, seconds);
}

@end
