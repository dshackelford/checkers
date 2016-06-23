//
//  Board.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"


@implementation Board

-(CGSize)getSize
{
    return size;
}

-(CGPoint)getOrigin
{
    return origin;
}

-(CGRect)getRect
{
    return bounds;
}

-(void)setSize:(CGSize)sizeInit
{
    size = sizeInit;
}

-(void)setOrigin:(CGPoint)pointInit
{
    origin = pointInit;
}


@end