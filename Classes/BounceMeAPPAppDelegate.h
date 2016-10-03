//
//  BounceMeAPPAppDelegate.h
//  BounceMeAPP
//
//  Created by Keith Landry on 5/22/12.
//  Copyright 2012 UCLA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuVeiwController;

@interface BounceMeAPPAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainMenuVeiwController *MenuViewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainMenuVeiwController *MenuViewController;

@end

