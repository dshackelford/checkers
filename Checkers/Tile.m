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

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit Affiliation:(int)affiliationInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    gridView = viewInit;
    lineWidth = lineWidthInit;
    affiliation = affiliationInit;
    
    [self drawTile];
    
    return self;
}


-(void)drawTile
{

    //start the rect at 0,0 to draw all of it within the current context rect
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(lineWidth , lineWidth, size.width, size.height)];
    
    [self drawBezierToView:tilePath];
}

-(void)drawCircle
{
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lineWidth, lineWidth, size.width, size.height)];
    
    [self drawBezierToView:circle];
}


-(void)highlight
{
    lineWidth = 2;
    //start the rect at 0,0 to draw all of it within the current context rect
    UIBezierPath* tilePath = [UIBezierPath bezierPathWithRect:CGRectMake(lineWidth , lineWidth, size.width,size.height)];
        
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*lineWidth, size.height + 3*lineWidth), NO, 0.0);
        
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    tilePath.lineWidth = lineWidth;
        
        
    CGFloat dashes[] = {8, 4};
    [tilePath setLineDash:dashes count:2 phase:0];
    [tilePath stroke];
    
        
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
        
    UIGraphicsEndImageContext();
        
    //make the image view from the path drawn on the context
    bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
        
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width/2 + lineWidth,origin.y + size.height/2 +lineWidth);
        
    [gridView addSubview:bezierImageView];
}


-(void)drawBezierToView:(UIBezierPath*)aPath
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width + 3*lineWidth, size.height + 3*lineWidth), NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    
    if (affiliation == 11 || affiliation == 1)//USER'S COLOR
    {
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    }
    else if(affiliation == 22 || affiliation == 2) //HAL'S COLOR
    {
        CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    }
    else if (affiliation == 0) //NO PIECE IS THERE (BLANK TILE
    {
        CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    }
    
    aPath.lineWidth = lineWidth;
    
    [aPath stroke];
    [aPath fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //make the image view from the path drawn on the context
    bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    //the center is offset to accomodate the actual origin which will be used later for touch detection
    bezierImageView.center = CGPointMake(origin.x + size.width/2 + lineWidth,origin.y + size.height/2 + lineWidth);
    
    [gridView addSubview:bezierImageView];
}
    

#pragma Setters & Getters
-(void)removeHighlight
{
    [bezierImageView removeFromSuperview];
}
-(void)setAffiliation:(double)affiliationInit
{
    affiliation = affiliationInit;
    if (affiliation == 1 || affiliation == 2) //draw a circle
    {
        [self drawCircle];
    }
    else //draw a square
    {
        [bezierImageView removeFromSuperview];
        [self drawTile];
        
    }
}

-(CGSize)getSize
{
    return size;
}

-(CGPoint)getOrigin
{
    return origin;
}

-(CGRect)getRect
{
    return bounds;
}

-(int)getLineWidth
{
    return lineWidth;
}

-(int)getAffiliation
{
    return affiliation;
}

-(void)setSize:(CGSize)sizeInit
{
    size = sizeInit;
}

-(void)setOrigin:(CGPoint)pointInit
{
    origin = pointInit;
}


@end