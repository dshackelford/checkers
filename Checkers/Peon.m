//
//  Peon.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/6/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Peon.h"

@implementation Peon

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit Affiliation:(int)affiliationInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    gridView = viewInit;
    lineWidth = lineWidthInit;
    affiliation = affiliationInit;
    
    [self drawCircle];
    
    return self;
}

-(void)drawCircle
{
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lineWidth, lineWidth, size.width, size.height)];
    
    //    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*lineWidth, size.height + 3*lineWidth), NO, 0.0);
    
    //this gets the graphic context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //you can stroke and/or fill
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    if (affiliation == 1)
    {
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    }
    else if(affiliation == 2)
    {
        CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    }
    
    [circle fill];
    [circle stroke];
    
    //now get the image from the context
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *circleImageView = [[UIImageView alloc]initWithImage:circleImage];
    
    circleImageView.center = CGPointMake(origin.x + size.width/2 + lineWidth,origin.y + size.height/2 + lineWidth);
    
    [gridView addSubview:circleImageView];
}


@end