# ScreenBlocker
 
**Full Screen Blocker** with Graphic Image Display for events in **MacOS | OS X**.

Dismiss after [nn] seconds. **Default == 5 [kConstIntervalSeconds].**


**Default constant values in ScreenBlocker.h:**
     
     #define kConstImageBlock        @"FP_Blocked_Action.png"
     
     #define kConstAlphaDefault      0.95f
     
     #define kConstIntervalSeconds   5

## Usage: ##
  
   ### Obj-C: ###
        
        // Default value from constant (no arguments)
        [ScreenBlocker displayBlockScreens]; 
        
        // Passing argument of kConstIntervalSeconds
        [ScreenBlocker displayBlockScreensInterval:kConstIntervalSeconds];
        
        // Passing argument of 7.5f (seven and a half seconds)
        [ScreenBlocker displayBlockScreensInterval:7.5f];
        
   ### C or C++: ###
        
        // Default value from constant (no arguments)
        displayBlockScreens();
        
        // Passing argument of kConstIntervalSeconds
        displayBlockScreensInterval(kConstIntervalSeconds);
        
        // Passing argument of 7.5f (seven and a half seconds)
        displayBlockScreensInterval(7.5f);
