//
//  BBQuartzView.m
//  QuartzPatterns
//
//  Created by Bharath Booshan on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BBQuartzView.h"
#define  PATTERN_CELL_WIDTH sPatternCellSize 
#define PATTERN_CELL_HEIGHT sPatternCellSize

static float sPatternCellSize = 32.0;

static  void drawPatternCell(  void * info, CGContextRef context)
{        
    float cellWidth = PATTERN_CELL_WIDTH;
    float cellHeight = PATTERN_CELL_HEIGHT;
    
    int *patter_type = (int*)info;
    switch(*patter_type)
    {
            
                case 1:
        {
            
            
             //http://www.kitchenbeforeandafter.com/wp-content/uploads/2009/05/kitchen-backsplash-tile-patterns2-300x216.gif
             //\       /               
             // \     /                   
             //  \ _ /                         
             //   |_|                      
             //  /   \                    
             // /     \                     
             ///       \                       
             
             
            //stroke middle square 
            CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
             CGContextFillRect(context, CGRectMake(0.0, 0.0, cellWidth, cellHeight));
            
            
            //stroke diagonal
             CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
             CGPoint points [] = {{0.0,0.0}, {cellWidth,cellHeight }, {cellWidth,0.0}, {0.0,cellHeight}};
             CGContextStrokeLineSegments(context, points, 4);
             
             CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
             int num_of_parts = 8;
             float partWitdth = cellWidth / num_of_parts;
             CGRect middleSpot = CGRectMake(partWitdth * 3, partWitdth*3, 2* partWitdth, 2*partWitdth);
             
             CGContextFillRect(context, middleSpot);
             
             

        }
            break;
            
        case 2:
        {
            
            CGRect squareRect = CGRectMake(0.0, 0.0, cellWidth, cellHeight);
            
            //circle in a square
            CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
            CGContextStrokeEllipseInRect(context, squareRect);
            
            
            float half_width = cellWidth/2.0;
            float half_height = cellHeight/2.0;
            
            //Semi-Circle to  Left
            CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, -half_width, 0.0);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);
            
            
            //Semi Circle to Right
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, half_width, 0.0);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);
            
            //Semi Circle At top
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, 0.0, -half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);
            
            //Semi Circle at Bottom
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, 0.0, half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);

            CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);

            //Arc to Top Left
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, -half_width, -half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);

            
            //Arc to Top Right
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, half_width, -half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);

            //Arc at Bottom Left
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, -half_width, half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);

            //Arc at Bottom Right
            CGContextSaveGState(context);
            //let us translate te CTM
            CGContextTranslateCTM(context, half_width, half_height);
            CGContextStrokeEllipseInRect(context, squareRect);
            CGContextRestoreGState(context);

            
        }
            break;
            
        default:
        {
            
            //Chequered Flag
            //Fill the entire background with white color
            CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
            CGContextFillRect(context, CGRectMake(0.0, 0.0, cellWidth, cellHeight));
            
            CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
            //Fill the top left quarter of the cell with black
            CGContextFillRect(context, CGRectMake(0.0, 0.0, cellWidth/2.0, cellHeight/2.0));
            
            //Fill the bottom right quarter of the cell with black
            CGContextFillRect(context, CGRectMake(cellWidth/2.0, cellHeight/2.0, cellWidth/2.0, cellHeight/2.0));
            
            
            
        }
            break;

            
    }
      
    
    
}


static void PatternReleaseInfoCallback(void *info)
{
    
    
}


@implementation BBQuartzView
@synthesize patternType= _currentPattern;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
                
        [self reloadPatterns];
      
        
    }
    return  self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
       float alpha = 1;
    
    //choose the pattern to be filled based on the currentPattern selected
       CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef  patternSpace = CGColorSpaceCreatePattern (NULL);// 6
    CGContextSetFillColorSpace (context, patternSpace);// 7
    CGColorSpaceRelease (patternSpace);

    //set the pattern as the Current Context's fill pattern
    //we dont need to set any color, as the pattern cell itself has chosen its own color
    CGContextSetFillPattern(context, _patterns[_currentPattern],   &alpha);
    //CGContextFillRect(context, CGRectMake(0.0, 0.0, 16.0, 16.0));
    
    //We would be filling the entire portion of this view
    CGContextFillRect(context, [self bounds]);

}


- (void)dealloc
{
    
    for( int patternCount = 0; patternCount < PATTERN_COUNT; patternCount++)
    {
        if( _patterns[patternCount])
        {
            CGPatternRelease(_patterns[patternCount]);
        }
    }
    

    [super dealloc];
}

+(void)setPatternCellSize:(float)patternSize
{
    sPatternCellSize = patternSize;
}

-(void)reloadPatterns
{
    patters_types[0] = 0;
    patters_types[1]=1;
    patters_types[2]=2;
    
    //Pattern Callback methods
    // drawPatternCell - callback to draw a single cell
    //PatternReleaseInfoCallback - invoked when a pattern is released
    CGPatternCallbacks callBack;
    callBack.drawPattern = &drawPatternCell;
    callBack.releaseInfo = &PatternReleaseInfoCallback;
    callBack.version = 0;

    for( int patternCount = 0; patternCount < PATTERN_COUNT; patternCount++)
    {
        if( _patterns[patternCount])
        {
            CGPatternRelease(_patterns[patternCount]);
        }
        // param1 - a context info, here which defines which pattern to be drawn
        // param2 - rect of a single pattern cell
        // transformation matrix - 
        // offsetX - a offset or horizontal gap between each cell.. minimum should be width of the cell
        // offsetY - a offset of vertical gap between each cell. minimum should be heigh of the cell
        // Style of - how the pattern cell are to be placed where are drawn on a region bigger than the single pattern cell
        // shouldColor -   a pattern can also be used as a mask, where the color is applied during the actual context where the pattern is drawn. So, literally you have to say true, if the pattern cell can chose its color, or no if the color at its main context is to be chosen
        _patterns[patternCount] = CGPatternCreate(&patters_types[patternCount], CGRectMake(0.0, 0.0, PATTERN_CELL_WIDTH, PATTERN_CELL_HEIGHT), CGAffineTransformIdentity, PATTERN_CELL_WIDTH, PATTERN_CELL_HEIGHT, kCGPatternTilingConstantSpacing, true, &callBack);

    }
    
    
    
}

@end
