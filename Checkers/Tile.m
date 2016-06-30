//
//  Tile.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@implementation Tile

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    gridView = viewInit;
    affiliation = 0;
    linewidth = 4;
    [self drawTileToView];
    
    return self;
}

-(void)drawTileToView
{
    
    //the inset by 5 and 5 is to account for the line width
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(origin.x, origin.y, size.width, size.height)];
    
    UIGraphicsBeginImageContextWithOptions(gridView.frame.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    tilePath.lineWidth = linewidth;
    
    [tilePath stroke];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
     bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
//    bezierImageView.center = CGPointMake(origin.x,origin.y);
    
    [gridView addSubview:bezierImageView];
}

-(void)fillTile
{
    
    [bezierImageView removeFromSuperview];
    
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(5, 5, size.width, size.height)];
    
//    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    tilePath.lineWidth = 5;
    
    [tilePath stroke];
    [tilePath fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width, origin.y + size.height);
    
    [gridView addSubview:bezierImageView];
    
    affiliation = 1;
    
}

-(void)drawCircle
{
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, size.width,size.height)];
    
//    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0.0);
    
    //this gets the graphic context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //you can stroke and/or fill
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    [circle fill];
    [circle stroke];
    
    //now get the image from the context
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *circleImageView = [[UIImageView alloc]initWithImage:circleImage];
    
    circleImageView.center = CGPointMake(origin.x + size.width, origin.y + size.height);
    
    [gridView addSubview:circleImageView];
}

-(double)getAffiliation
{
    return affiliation;
}


@end