//
//  Grid.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "Tile.h"

@interface Grid : Board
{
    NSMutableArray* arrayOfTiles;
    CGSize gridSize;
}

-(id)initWithSize:(CGSize)sizeInit inScreenSized:(CGSize)screenSizeInit;
-(void)drawGridInView:(UIView*)viewInit;
-(CGSize)findSizeOfEachSquare:(CGSize)sizeInit inView:(UIView*)viewInit;

-(NSMutableArray*)getTileArray;
@end
