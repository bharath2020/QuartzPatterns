//
//  QuartzPatternsViewController.m
//  QuartzPatterns
//
//  Created by Bharath Booshan on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuartzPatternsViewController.h"

@implementation QuartzPatternsViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)nextPattern:(id)sender
{
    mPatterView.patternType = (mPatterView.patternType +1) %  PATTERN_COUNT ;
;
    [mPatterView setNeedsDisplay];
}

-(IBAction)changeCellSize:(id)sender
{
    [BBQuartzView setPatternCellSize:[(UISlider*)sender value]];
    [mPatterView reloadPatterns];
     [mPatterView setNeedsDisplay];
}

@end
