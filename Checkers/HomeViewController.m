//
//  HomeViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"

@implementation HomeViewController

-(void)viewDidLoad
{
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    
    [self addTitleInView:self.view];
    [self addBackGroundDesignInView:self.view];
    [self addButtonsInView:self.view];
    
}


-(void)addButtonsInView:(UIView*)viewInit
{
    [playButton setTitle:@"Show View" forState:UIControlStateNormal];
    playButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    playButton.frame = CGRectMake(10, 10.0, 200, 100);
}


-(void)addTitleInView:(UIView*)viewInit
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, screenSize.height/2 - 50, screenSize.width, 100)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.textColor=[UIColor blackColor];
    UIFont *font = [UIFont boldSystemFontOfSize:70];
    label.font = font;
    label.text = @"DOMAIN";
    [viewInit addSubview:label];
}

-(void)addBackGroundDesignInView:(UIView*)viewInit
{
//    NSArray* color =
    for (int i = 0; i < 3; i++)
    {
        [self drawSomeTilesAtPoint:CGPointMake(100 + i*50, screenSize.height/2 - 100) withColor:[UIColor redColor]];
    }
}


-(void)drawSomeTilesAtPoint:(CGPoint)pointInit withColor:(UIColor*)colorInit
{
    UIBezierPath* square = [UIBezierPath bezierPathWithRect:CGRectMake(pointInit.x, pointInit.y, 30, 30)];
    
    UIGraphicsBeginImageContext(CGSizeMake(275, 300));
    
    //this gets the graphic context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //you can stroke and/or fill
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    [square fill];
    [square stroke];
    
    //now get the image from the context
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    
    [self.view addSubview:bezierImageView];
}



//-(void)addBackGroundDesignInView:(UIView*)viewInit
//{
//    [self drawLeftHalfDesignInView:viewInit];
//    [self drawRightHalfDesignInView:viewInit];
//}

//-(void)drawRightHalfDesignInView:(UIView*)viewInit
//{
//    UIGraphicsBeginImageContext(screenSize);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    
//    CGPoint startPoint = CGPointMake(screenSize.width, 0);
//    
//    [aPath moveToPoint:startPoint];
//    
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 + 100,0)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 + 100,screenSize.height/2 + 50)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 - 100,screenSize.height/2 + 50)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 - 100,screenSize.height)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width,screenSize.height)];
//    
//    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8].CGColor);
//    
//    [aPath closePath];
//    
//    aPath.lineWidth = 5;
//    [aPath stroke];
//    [aPath fill];
//    
//    UIImage* myPlotImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    UIImageView* plotImageView = [[UIImageView alloc] initWithImage:myPlotImage];
//    
//    [viewInit addSubview:plotImageView];
//}
//
//-(void)drawLeftHalfDesignInView:(UIView*)viewInit
//{
//    UIGraphicsBeginImageContext(screenSize);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    
//    CGPoint startPoint = CGPointMake(0, 0);
//    
//    [aPath moveToPoint:startPoint];
//    
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 + 100,0)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 + 100,screenSize.height/2 - 50)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 - 100,screenSize.height/2 - 50)];
//    [aPath addLineToPoint:CGPointMake(screenSize.width/2 - 100,screenSize.height)];
//    [aPath addLineToPoint:CGPointMake(0,screenSize.height)];
//    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:1 alpha:0.75].CGColor);
//    
//    [aPath closePath];
//    
//    aPath.lineWidth = 10;
//    [aPath stroke];
//    [aPath fill];
//    
//    UIImage* myPlotImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    UIImageView* plotImageView = [[UIImageView alloc] initWithImage:myPlotImage];
//    
//    [viewInit addSubview:plotImageView];
//}


@end