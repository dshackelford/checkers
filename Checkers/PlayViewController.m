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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HalMoved:) name:@"HalMoved" object:nil];
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self establishGestures];
    
    CGSize border = CGSizeMake(70, 70);
    gridView = [[TheGridView alloc] initWithFrame:CGRectMake(border.width, border.height, screenSize.width - 2*border.width, screenSize.height - 2*border.height)];
    [self.view addSubview:gridView];
    
    //MAKE GRID OF SOME SIZE (WIDTH X HEIGHT)
    [gridView drawGridOfSize:CGSizeMake(10,20)];
    
    tileArray = [[NSMutableArray alloc] initWithArray:[gridView getTileArray]];
    
    //SET HOME BASE FOR PLAYER
    [[tileArray objectAtIndex:[gridView getGridSize].width/2] setAffiliation:1];
    [[tileArray objectAtIndex:[gridView getGridSize].width/2] fillTile];
    
    //SET HOME BASE FOR HAL
    [[tileArray objectAtIndex:[tileArray count] - [gridView getGridSize].width/2] setAffiliation:2];
    [[tileArray objectAtIndex:[tileArray count] - [gridView getGridSize].width/2] fillTile];
    
    //load HAL into gameplay
    hal = [[Hal alloc] initWithGrid:gridView andFirstPieceIndex:[tileArray count] - [gridView getGridSize].width/2];
}



-(void)HalMoved:(NSNotification*)notification
{
    [self.view addGestureRecognizer:singleTap];
    
    //stop loading animation
    //notify player can move
}

#pragma mark - Interface
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
            [aTile setAffiliation:1];
            [aTile fillTile];
            [self.view removeGestureRecognizer:singleTap];
            [hal move];
            break;
        }
    }
}

-(void)establishGestures
{
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:singleTap];
}


@end
