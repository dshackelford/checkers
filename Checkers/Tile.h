//
//  Tile.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

//#import "Board.h"
#import "UIKit/UIKit.h"

@interface Tile : NSObject
{
    UIView* gridView;
    UIImageView* bezierImageView;
    
    CGSize size;
    CGPoint origin;
    CGRect bounds;
    
    int lineWidth;
    int affiliation;
}

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit Affiliation:(int)affiliationInit inView:(UIView*)viewInit;
-(void)drawTileToView;
-(void)fillTile;
-(void)drawCircle;
-(double)getAffiliation;
-(void)setAffiliation:(double)affiliationInit;

-(void)highlight;


-(CGSize)getSize;
-(CGPoint)getOrigin;
-(CGRect)getRect;
-(int)getLineWidth;

-(void)setSize:(CGSize)sizeInit;
-(void)setOrigin:(CGPoint)pointInit;
@end
