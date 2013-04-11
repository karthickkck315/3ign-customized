//
//  DrawPatternLockView.m
//  AndroidLock
//
//  Created by Purnama Santo on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawPatternLockView.h"

@implementation DrawPatternLockView

@synthesize colorImage;

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
    NSLog(@"drawr line..");
    NSLog(@"track point value -->%@", _trackPointValue);
    
    if (!_trackPointValue)
        return;
    NSLog(@"drawr line..1");
    CGContextRef context =UIGraphicsGetCurrentContext();
    NSLog(@"drawr line..2");
    CGContextSetLineWidth(context, 7.0);
    NSLog(@"drawr line..3");
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    // //NSLog(@"drawr line..4");
    // CGFloat components[] = {0.5, 0.5, 0.5, 0.8};
    // CGColorRef color = CGColorCreate(colorspace, components);
    // UIColor *mycolor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tab.png"]];
    CGColorRef color;
    if (colorImage) {
        color = CGColorRetain([UIColor colorWithPatternImage:[UIImage imageNamed:colorImage]].CGColor);
    }else {
        color = CGColorRetain([UIColor colorWithPatternImage:[UIImage imageNamed:@"green_stroke.png"]].CGColor);
    }
    
    // //NSLog(@"drawr line..5");
    CGContextSetStrokeColorWithColor(context, color);
    // //NSLog(@"drawr line..6");
    CGPoint from;
    NSLog(@"drawr line..7");
    UIView *lastDot;
    NSLog(@"drawr line..8");
    
    
    for (UIView *dotView in _dotViews) {
        NSLog(@"drawr line..9=%@",_dotViews);
        from = dotView.center;
        
        //NSLog(@"drwaing dotview: %@", dotView);
        //NSLog(@"\tdrawing from: %f, %f", from.x, from.y);
        
        if (!lastDot){
//            CGContextStrokePath(context);
            CGContextMoveToPoint(context, from.x, from.y);
//            CGContextShowTextAtPoint(context, from.x, from.y, nil, 7.0);
//            CGContextSetTextPosition(context, from.x, from.y);
//            CGContextAddLineToPoint(context, from.x, from.y);
//            CGContextAddPath(context, fropen(from.x, from.y));
//            CGContextTranslateCTM(context, from.x, from.y);
//            CGContextScaleCTM(context, from.x, from.y);
            NSLog(@"\tdrawing from: %f, %f", from.x, from.y);
        }else
            CGContextAddLineToPoint(context, from.x, from.y);
//            CGContextMoveToPoint(context, from.x, from.y);
//        CGContextShowText(context, X_OK, from.y);

        //NSLog(@"\tdrawing from: %f, %f", from.x, from.y);
        NSLog(@"drawr line..10");    
        lastDot = dotView;
    }
    
    CGPoint pt = [_trackPointValue CGPointValue];
    NSLog(@"drawr line..11");
    //NSLog(@"\t to: %f, %f", pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    //NSLog(@"drawr line..12");
    
    CGContextStrokePath(context);
    //NSLog(@"drawr line..15");
    CGColorSpaceRelease(colorspace);
    //NSLog(@"drawr line..14");
    CGColorRelease(color);
    //NSLog(@"drawr line..13");
    _trackPointValue = nil;
    
}


- (void)clearDotViews {
    //NSLog(@"clear dotview");
    //NSLog(@"dotviews -->%@", _dotViews);
    [_dotViews removeAllObjects];
}

- (void)addDotView:(UIView *)view{
    if (!_dotViews)
        _dotViews = [NSMutableArray array];
    
    [_dotViews addObject:view];
    NSLog(@"dotviews -->%@", _dotViews);
    
    
    
}


- (void)drawLineFromLastDotTo:(CGPoint)pt{
    NSLog(@"x -->%f  y -->%f", pt.x, pt.y);
    
    _trackPointValue = [NSValue valueWithCGPoint:pt];
    //  UIImageView *img = (UIImageView*)[_dotViews objectAtIndex:0];
    //  img.image = [UIImage imageNamed:@"green1.png"];
    [self setNeedsDisplay];
    //NSLog(@"drawLine--->");
    
}


@end
