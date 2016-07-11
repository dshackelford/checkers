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
    NSLog(@"HomeDirectory: %@",NSHomeDirectory());
    
    if ([AppUtilities doesFileExistAtPath:[AppUtilities getPathToUserInfoFile]] == NO)
    {
        NSFileManager* appInfo = [NSFileManager defaultManager];
        
        [appInfo createFileAtPath:[AppUtilities getPathToUserInfoFile] contents:nil attributes:nil];
        
        //ADDING TO THE DICTIONARY SHOULD HAPPEN IN THE SETTINGS
        NSArray* keys=@[@"UserName",@"UserColor",@"ComputerColor",@"DifficultySetting",@"FieldSize"];
        
        NSArray* objects=@[@"",@"Blue",@"Red",@"Easy",@""];
        
        NSMutableDictionary* myDictionary =[[NSMutableDictionary alloc] initWithObjects:objects forKeys:keys];
        
        [myDictionary writeToFile:[AppUtilities getPathToUserInfoFile] atomically:YES ];
    }
    else //DIFFICULTY SETTING HAS TO BE ESTABLISHED IN HOMEVIEW BECUASE IT HAS TO BE READY FOR SETTINGS IF THE GAME IS NOT PLAYED IMMEDIATELY.
    {
        NSDictionary* myDictionary = [NSDictionary dictionaryWithContentsOfFile:[AppUtilities getPathToUserInfoFile]];
        NSLog(@"%@",myDictionary);
        
        if (!([myDictionary objectForKey:@"UserName"] == nil))
        {
            NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary objectForKey:@"UserName"]];
            [usernameLabel setText:aSTring];
        }
    }
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        NSLog(@"This is iPhone");
    }
    
    [self addBackGroundDesignInView:self.view];
    
    [helpButton setTitle:@"INSTRUCTIONS" forState:UIControlStateNormal];
    [titleButton setTitle:@"TERRITORY" forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:50];
    [titleButton.titleLabel setTextColor:[UIColor blackColor]];
    
}


//-(void)addButtonsInView:(UIView*)viewInit
//{
//    [playButton setTitle:@"Show View" forState:UIControlStateNormal];
//    playButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
//    playButton.frame = CGRectMake(10, 10.0, 200, 100);
//}


//-(void)addTitleInView:(UIView*)viewInit
//{
//    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, screenSize.height/2 - 50, screenSize.width, 100)];
//    label.backgroundColor = [UIColor whiteColor];
//    label.textAlignment = 1;
//    label.textColor=[UIColor blackColor];
//    UIFont *font = [UIFont boldSystemFontOfSize:70];
//    label.font = font;
//    label.text = @"DOMAIN";
//    [viewInit addSubview:label];
//}

-(void)addBackGroundDesignInView:(UIView*)viewInit
{
//    NSArray* color =
//    for (int i = 0; i < 3; i++)
//    {
//        [self drawSomeTilesAtPoint:CGPointMake(100 + i*50, screenSize.height/2 - 100) withColor:[UIColor redColor]];
//    }
}


-(void)drawSomeTilesAtPoint:(CGPoint)pointInit withColor:(UIColor*)colorInit
{
//    UIBezierPath* square = [UIBezierPath bezierPathWithRect:CGRectMake(pointInit.x, pointInit.y, 30, 30)];
//    
//    UIGraphicsBeginImageContext(CGSizeMake(275, 300));
//    
//    //this gets the graphic context
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //you can stroke and/or fill
//    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    [square fill];
//    [square stroke];
//    
//    //now get the image from the context
//    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    UIImageView *bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
//    
//    [self.view addSubview:bezierImageView];
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