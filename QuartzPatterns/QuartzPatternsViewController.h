//
//  QuartzPatternsViewController.h
//  QuartzPatterns
//
//  Created by Bharath Booshan on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBQuartzView.h"
@interface QuartzPatternsViewController : UIViewController {
    IBOutlet BBQuartzView *mPatterView;
}
-(IBAction)nextPattern:(id)sender;
-(IBAction)changeCellSize:(id)sender;
@end
