//
//  TheGridView.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/28/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TheGridView.h"


@implementation TheGridView

-(void)drawGridOfSize:(CGSize)sizeInit
{
    gridSize = sizeInit;
    
    arrayOfTiles = [[NSMutableArray alloc] init];
    
    CGSize squareSize = [self findSizeOfEachSquare];
    
    //GRAB THE START OF A ROW
    for (int j = 0; j < sizeInit.height; j++)
    {
        for (int i = 0; i < sizeInit.width; i++)
        {
            CGPoint aPoint = CGPointMake(i*squareSize.width, j*squareSize.height);
            
            Tile* aTile = [[Tile alloc] initWithSize:squareSize atPoint:aPoint inView:self];
            
            [arrayOfTiles addObject:aTile];
        }
    }
//    
//    CGPoint aPoint = CGPointMake(self.frame.origin.x, self.frame.origin.y);
//    
//    Tile* aTile = [[Tile alloc] initWithSize:squareSize atPoint:aPoint inView:self];
}

-(CGSize)findSizeOfEachSquare
{

    double width = self.frame.size.width/gridSize.width;
    double height = self.frame.size.height/gridSize.height;
    
    double length = fmin(width,height);
    
    return CGSizeMake(length, length);
}

-(NSMutableArray*)getTileArray
{
    return arrayOfTiles;
}


@end