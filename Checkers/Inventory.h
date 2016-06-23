//
//  Inventory.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/23/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Board.h"
#import "Tile.h"
#import "Grid.h"

@interface Inventory : Board
{
    NSMutableArray* inventoryArray;

    double numOfCircles;
    double numOfTriangles;
    double numOfHexagons;
    double numOfCrosses;
    
    Tile* circleTile;
    Tile* triangleTile;
    Tile* hexagonTile;
    Tile* crossTile;
}

-(id)initUserInventoryWithGrid:(Grid*)gridInit inView:(UIView*)viewInit;
-(id)initCompInventoryWithGrid:(Grid*)gridInit inView:(UIView*)viewInit;

@end
