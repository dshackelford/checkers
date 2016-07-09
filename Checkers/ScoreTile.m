//
//  ScoreTile.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/9/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoreTile.h"

@implementation ScoreTile
-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    gridView = viewInit;
    lineWidth = lineWidthInit;
    
    [self drawTileToView];
    
    return self;
}

-(void)drawTileToView
{
    //start the rect at 0,0 to draw all of it within the current context rect
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(lineWidth , lineWidth, size.width, size.height)];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*lineWidth, size.height + 3*lineWidth), NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    [tilePath stroke];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //make the image view from the path drawn on the context
    bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width/2 + lineWidth/2,origin.y + size.height/2 + lineWidth);
    
    [gridView addSubview:bezierImageView];
}


@end