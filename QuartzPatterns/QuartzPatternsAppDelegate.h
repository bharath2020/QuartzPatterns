//
//  QuartzPatternsAppDelegate.h
//  QuartzPatterns
//
//  Created by Bharath Booshan on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuartzPatternsViewController;

@interface QuartzPatternsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet QuartzPatternsViewController *viewController;

@end
