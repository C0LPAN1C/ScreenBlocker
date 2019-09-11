//
//  AppDelegate.m
//  ScreenBlocker
//
//  Created by Amit Apollo Barman on 9/9/19.
//  Copyright © 2019 Forcepoint, LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    /* calling method from Obj-C below: */
    
        /* with timed dismissal | kill */
        //[ScreenBlocker displayBlockScreensInterval:kConstIntervalSeconds];
        
        /* with kConstIntervalSeconds dismissal */
        //[ScreenBlocker displayBlockScreens];

        /* command selector for operation with cmd, seconds as 2 args */
        //[ScreenBlocker chooseCommandFunction:kConstCmdBlock seconds:kConstIntervalSeconds];
        
    
    /* calling static method from C/C++ below: */
        
        /* with timed dismissal | kill */
        //displayBlockScreensInterval(kConstIntervalSeconds);
        
        /* with kConstIntervalSeconds dismissal */
        //displayBlockScreens();
        
        /* command selector for operation with cmd, seconds as 2 args */
        chooseCommandFunction(kConstCmdBlock, kConstIntervalSeconds);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}


@end
