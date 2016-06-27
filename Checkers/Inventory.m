//
//  Inventory.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/23/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inventory.h"

@implementation Inventory

-(id)initUserInventoryWithGrid:(Grid*)gridInit inView:(UIView*)viewInit
{
    self = [super init];
    
    size = CGSizeMake(50, 4*50);
    origin = CGPointMake([gridInit getRect].origin.x + [gridInit getRect].size.width, [gridInit getRect].origin.y + [gridInit getRect].size.height - size.height);
    
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    
    
    circleTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y) inView:viewInit];
    triangleTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + size.height/4) inView:viewInit];
    hexagonTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + 2*size.height/4) inView:viewInit];
    crossTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + 3*size.height/4) inView:viewInit];
    
    return self;
}

-(id)initCompInventoryWithGrid:(Grid*)gridInit inView:(UIView*)viewInit
{
    self = [super init];
    
    size = CGSizeMake(50, 4*50);
    origin = CGPointMake([gridInit getRect].origin.x - size.width - 10, [gridInit getRect].origin.y -  10);
    
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    
    circleTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y) inView:viewInit];
    triangleTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + size.height/4) inView:viewInit];
    hexagonTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + 2*size.height/4) inView:viewInit];
    crossTile = [[Tile alloc] initWithSize:CGSizeMake(size.width, size.height/4) atPoint:CGPointMake(origin.x, origin.y + 3*size.height/4) inView:viewInit];
    
    return self;
}

@end