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
    
    double lineWidth = 3;
    
    CGSize squareSize = [self findSizeOfEachSquare:lineWidth];
    
    //GRAB THE START OF A ROW
    for (int j = 0; j < sizeInit.height; j++)
    {
        for (int i = 0; i < sizeInit.width; i++)
        {
            CGPoint aPoint = CGPointMake(i*(squareSize.width + lineWidth), j*(squareSize.height+lineWidth));
            
            Tile* aTile = [[Tile alloc] initWithSize:squareSize atPoint:aPoint LineWidth:lineWidth Affiliation:0 inView:self];
            
            [arrayOfTiles addObject:aTile];
        }
    }
}

-(CGSize)findSizeOfEachSquare:(double)lineWidthInit
{
    double width = self.frame.size.width/gridSize.width;
    double height = self.frame.size.height/gridSize.height;
    
    double length = fmin(width,height);
    
//    width is the limiting factor, need to worry about centering the height
    if (width < height)
    {
        double leftover = self.frame.size.height - length*gridSize.height;
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + leftover/2, self.frame.size.width, self.frame.size.height)];
    }
//    height is the limiting factor, need to worry about centering the width
    else if(height < width)
    {
                NSLog(@"view origin: %f",self.frame.origin.x);
        NSLog(@"view width: %f",self.frame.size.width);
        NSLog(@"grid width: %f",length*gridSize.width);
        double leftover = self.frame.size.width - length*gridSize.width;
        NSLog(@"%f",leftover);
        [self setFrame:CGRectMake(self.frame.origin.x + leftover/2, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
    }
    
    //i grab this data before because that is the real length that the other viewers need to no
//    tileSize = CGSizeMake(length, length);
    
    length = length - lineWidthInit;
    tileSize = CGSizeMake(length, length);
    return CGSizeMake(length, length);
}

-(NSMutableArray*)getTileArray
{
    return arrayOfTiles;
}

-(CGSize)getGridSize
{
    return gridSize;
}

-(CGSize)getGridTileSize
{
    return tileSize;
}

//THIS HELPS THE SCORE BOARD TO CENTER ITSELF
-(CGSize)getGridTileSizeWithLineWidth
{
    int lineWidth = [[arrayOfTiles objectAtIndex:0] getLineWidth];
    CGSize aSize = CGSizeMake(tileSize.width + lineWidth,tileSize.height + lineWidth);
    return aSize;
}

@end