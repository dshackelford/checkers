//
//  PlayViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayViewController.h"

@implementation PlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self establishGestures];
    
    theGrid = [[Grid alloc] initWithSize:CGSizeMake(6,12) inScreenSized:screenSize];
    
    [theGrid drawGridInView:self.view];
    
    theScoreBoard = [[ScoreBoard alloc] initWithGrid:theGrid inView:self.view];
    
    userInven = [[Inventory alloc] initUserInventoryWithGrid:theGrid inView:self.view];
    compInven = [[Inventory alloc] initCompInventoryWithGrid:theGrid inView:self.view];
    
    [self establishButtons];
    
}


-(void)establishButtons
{
    [homeButton setTitle:@"Home" forState:UIControlStateNormal];
    homeButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    homeButton.frame = CGRectMake(10, 10.0, 200, 100);
    homeButton.center = CGPointMake(10, 10);//this doesn't do shit...
}

-(void)didSingleTap:(UITapGestureRecognizer *)aSingleTap
{
    CGPoint touchPoint = [aSingleTap locationInView:self.view];
    
    NSLog(@"%f,%f",touchPoint.x,touchPoint.y);
    
    for (int i = 0; i < [[theGrid getTileArray] count]; i++)
    {
        Tile* aTile = [[theGrid getTileArray] objectAtIndex:i];
        
        CGRect arect = [aTile getRect];
        CGRect gridRect = [theGrid getRect];
        arect.origin.x = arect.origin.x + gridRect.origin.x;
        arect.origin.y = arect.origin.y + gridRect.origin.y;
        
        if(CGRectContainsPoint(arect, touchPoint) )
        {
            NSLog(@"%d",i);
            [aTile fillTile];
//            [aTile drawCircle];
        }
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Touch Gestures
-(void)establishGestures
{
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:singleTap];
}


@end
