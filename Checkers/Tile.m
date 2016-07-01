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

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    gridView = viewInit;
    affiliation = 0;
    linewidth = lineWidthInit;
    [self drawTileToView];
    
    return self;
}

-(void)drawTileToView
{
    //start the rect at 0,0 to draw all of it within the current context rect
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(linewidth , linewidth, size.width, size.height)];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*linewidth, size.height + 3*linewidth), NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    tilePath.lineWidth = linewidth;
    
    [tilePath stroke];
    [tilePath fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //make the image view from the path drawn on the context
     bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width/2 + linewidth,origin.y + size.height/2 + linewidth);
    
    [gridView addSubview:bezierImageView];
}

-(void)fillTile
{
    [bezierImageView removeFromSuperview];
    //start the rect at 0,0 to draw all of it within the current context rect
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(linewidth , linewidth, size.width, size.height)];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*linewidth, size.height + 3*linewidth), NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    if (affiliation == 1)
    {
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    }
    else if(affiliation == 2)
    {
        CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    }
    
    tilePath.lineWidth = linewidth;
    
    [tilePath stroke];
    [tilePath fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //make the image view from the path drawn on the context
    bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width/2 + linewidth,origin.y + size.height/2 + linewidth);
    
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
    
    circleImageView.center = CGPointMake(origin.x + size.width, origin.y + size.height);
    
    [gridView addSubview:circleImageView];
}

-(double)getAffiliation
{
    return affiliation;
}

-(double)getLineWidth
{
    return linewidth;
}

-(void)setAffiliation:(double)affiliationInit
{
    affiliation = affiliationInit;
}

@end