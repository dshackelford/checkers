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
    origin = CGPointMake([gridInit getRect].origin.x + [gridInit getSize].width, [gridInit getRect].origin.y + [gridInit getSize].height - size.height);
    
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    
    return self;
}

-(id)initCompInventoryWithGrid:(Grid*)gridInit inView:(UIView*)viewInit
{
    self = [super init];
    
    size = CGSizeMake(50, 4*50);
    origin = CGPointMake([gridInit getRect].origin.x - size.width, [gridInit getRect].origin.y);
    
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    
    return self;
}

@end