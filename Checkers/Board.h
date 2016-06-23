//
//  Board.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Board : NSObject
{
    CGSize size;
    CGPoint origin;
    CGRect bounds;
}


-(CGSize)getSize;
-(CGPoint)getOrigin;
-(CGRect)getRect;

-(void)setSize:(CGSize)sizeInit;
-(void)setOrigin:(CGPoint)pointInit;

@end