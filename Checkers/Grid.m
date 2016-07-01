//
//  Grid.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"

@implementation Grid

-(id)initWithSize:(CGSize)sizeInit inScreenSized:(CGSize)screenSizeInit
{
    self = [super init];
    
    gridSize = sizeInit;
    
    bounds = [self determineBoundsOfGrid:screenSizeInit];
    
    return self;
}

-(CGRect)determineBoundsOfGrid:(CGSize)screenSizeInit
{
    double wideGap = 70;
    double tallGap = 90;

    double wide = screenSizeInit.width - 2*wideGap;
    double tall = screenSizeInit.height - 2*tallGap;
    
    CGRect aRect = CGRectMake(screenSizeInit.width/2 - wide/2, screenSizeInit.height/2 - tall/2, wide, tall);
    
    return aRect;
}

-(CGSize)findSizeOfEachSquare:(CGSize)sizeInit inView:(UIView*)viewInit
{
    double numOfBoxes = sizeInit.width*sizeInit.height;
    
    double viewArea = viewInit.bounds.size.width*viewInit.bounds.size.height;
    
    double boxArea  = viewArea/numOfBoxes;
    
    CGSize boxSize = CGSizeMake(sqrt(boxArea), sqrt(boxArea));
    
    return boxSize;
}

//-(void)drawGridInView:(UIView*)viewInit
//{
//    arrayOfTiles = [[NSMutableArray alloc] init];
//    
//    UIView* gridView = [[UIView alloc] initWithFrame:bounds];
//    
//    [viewInit addSubview:gridView];
//    
//    CGSize squareSize = [self findSizeOfEachSquare:gridSize inView:gridView];
//    
//    //GRAB THE START OF A ROW
//    for (int j = 0; j < gridSize.height; j++)
//    {
//        for (int i = 0; i < gridSize.width; i++)
//        {
//            CGPoint aPoint = CGPointMake(i*squareSize.width, j*squareSize.height);
//            
//            Tile* aTile = [[Tile alloc] initWithSize:squareSize atPoint:aPoint inView:gridView];
//            
//            [arrayOfTiles addObject:aTile];
//        }
//    }
//}


-(NSMutableArray*)getTileArray
{
    return arrayOfTiles;
}


@end