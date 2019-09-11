//
//  ScreenBlocker.h
//  ScreenBlocker
//
//  Created by Amit Apollo Barman on 9/10/19.
//  Copyright © 2019 Forcepoint, LLC. All rights reserved.
//

#ifndef ScreenBlocker_h
#define ScreenBlocker_h

/* Block Image to Display, Alpha Opacity to set,
 and Timer to Dismiss (second), if -1 or -1.0f then show indefinitely. */

#define kConstImageBlock        @"FP_Blocked_Action.png"
#define kConstAlphaDefault      0.95f
#define kConstIntervalSeconds   5

/* Different Command Options exposed externally */

#define kConstCmdBlock          0
#define kConstCmdBlockInterval  1
#define kConstCmdKill           2
#define kConstCmdKillInterval   3

#import <Cocoa/Cocoa.h>

/* External Obj-C Declarations */

@interface ScreenBlocker : NSObject <NSApplicationDelegate>
    /* Display ScreenBlocker for TIMER_SECONDS default value */
    + (void) displayBlockScreens;
    /* Display ScreenBlocker for float seconds */
    + (void) displayBlockScreensInterval:(float) seconds;
    /* Dismiss ScreenBlocker */
    + (void) killScreenBlocker;
    /* Dismiss ScreenBlocker after seconds */
    + (void) killScreenBlockerInterval:(float) seconds;
    /* ScreenBlocker command switch and decider */
    + (void) chooseCommandFunction:(int) cmd
                           seconds:(int) seconds;
@end


/* External C/C++ Static Declarations */

#ifdef __cplusplus
extern "C"
{
#endif
    
    /* Display ScreenBlocker for kConstIntervalSeconds default value */
    static void displayBlockScreens(void)
    {
        [ScreenBlocker displayBlockScreens];
    }
    
    /* Display ScreenBlocker for float seconds */
    static void displayBlockScreensInterval(float seconds)
    {
        [ScreenBlocker displayBlockScreensInterval:seconds];
    }
    
    /* Dismiss ScreenBlocker */
    static void killScreenBlocker(void)
    {
        [ScreenBlocker killScreenBlocker];
    }

    /* Dismiss ScreenBlocker after seconds */
    static void killScreenBlockerInterval(float seconds)
    {
        [ScreenBlocker killScreenBlockerInterval:seconds];
    }

    /* ScreenBlocker command switch and decider */
    static void chooseCommandFunction(int cmd, float seconds)
    {
        if (!seconds)
        {
            seconds = kConstIntervalSeconds;
        }

        switch (cmd)
        {
            case kConstCmdBlock:            displayBlockScreens();
                                            break;
            case kConstCmdBlockInterval:    displayBlockScreensInterval(seconds);
                                            break;
            case kConstCmdKill:             killScreenBlocker();
                                            break;
            case kConstCmdKillInterval:
            default:                        killScreenBlockerInterval(seconds);
                                            break;
        }
    }

#ifdef __cplusplus
}
#endif

#endif
