//
//  PlayViewController+Setup.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/7/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController (Setup)
{
    
}

-(void)setUpView;
-(void)addAPieceOfSize:(CGSize)squareSizeInit AtIndex:(int)i andLineWidth:(int)lineWidth andAffiliation:(int)affiliationInit;
@end