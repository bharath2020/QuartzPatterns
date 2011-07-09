//
//  BBQuartzView.h
//  QuartzPatterns
//
//  Created by Bharath Booshan on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define  PATTERN_COUNT 3

@interface BBQuartzView : UIView {
    CGPatternRef _patterns[4];
    int _currentPattern;
    int patters_types[3];
}
@property(nonatomic,assign)int patternType;
+(void)setPatternCellSize:(float)patternSize;
-(void)reloadPatterns;
@end
