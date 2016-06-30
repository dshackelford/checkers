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

    CGSize buffer = CGSizeMake(50, 50);
    gridView = [[TheGridView alloc] initWithFrame:CGRectMake(buffer.width, buffer.height, screenSize.width - 2*buffer.width, screenSize.height - 2*buffer.height)];
    [self.view addSubview:gridView];

    [gridView drawGridOfSize:CGSizeMake(10,12)];
//
//    
//    CGRect aRect = gridView.frame;
//    NSLog(@"origin x:%f y:%f size width:%f height:%f",aRect.origin.x,aRect.origin.y,aRect.size.width,aRect.size.height);
//
//    theScoreBoard = [[ScoreBoard alloc] initWithGrid:theGrid inView:self.view];
//    
//    userInven = [[Inventory alloc] initUserInventoryWithGrid:theGrid inView:self.view];
//    compInven = [[Inventory alloc] initCompInventoryWithGrid:theGrid inView:self.view];
//    
//    [self establishButtons];
    
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
    
    for (int i = 0; i < [[gridView getTileArray] count]; i++)
    {
        Tile* aTile = [[gridView getTileArray] objectAtIndex:i];
        
        CGRect arect = [aTile getRect];
        CGRect gridRect = gridView.frame;
        
        arect.origin.x = arect.origin.x + gridRect.origin.x;
        arect.origin.y = arect.origin.y + gridRect.origin.y;
        
        if(CGRectContainsPoint(arect, touchPoint) )
        {
            NSLog(@"%d",i);
//            [aTile fillTile];
//            [self.view removeGestureRecognizer:singleTap];
//            [self computerMove];
        }
    }
}

-(void)computerMove
{
    for (int i = 0; i < [[theGrid getTileArray] count]; i++)
    {
        Tile* aTile = [[theGrid getTileArray] objectAtIndex:i];
        
        if ([aTile getAffiliation] == 1)
        {
            
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
