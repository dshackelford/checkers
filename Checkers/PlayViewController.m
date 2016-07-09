//
//  PlayViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayViewController.h"
#import "PlayViewController+Setup.h"

@implementation PlayViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HalMoved:) name:@"HalMoved" object:nil];
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self establishGestures];
    
    theFieldDictionary = [[NSMutableDictionary alloc] init];
    userPieces = [[NSMutableArray alloc] init];
    halPieces = [[NSMutableArray alloc] init];
    userEndzone = [[NSMutableArray alloc] init];
    halEndzone = [[NSMutableArray alloc] init];
    
    [self setUpView]; //found in category
    
    theFieldDictionary = [self getCurrentFieldDictionary];
    
    highlighted = NO;
}


-(void)HalMoved:(NSNotification*)notification
{
    //allow user to touch screen
    [self.view addGestureRecognizer:singleTap];
    
    //update the score
    [scoreboardView setHalScore:[[hal getPieces] count]];
    
    int index = [notification.object integerValue];
    Tile* aTile = [[gridView getTileArray] objectAtIndex:index];
    [aTile setAffiliation:2];
    [halPieces addObject:[NSNumber numberWithInteger:index]];
}

#pragma mark - Interface
-(void)didSingleTap:(UITapGestureRecognizer *)aSingleTap
{
    CGPoint touchPoint = [aSingleTap locationInView:self.view];
    
    NSLog(@"%f,%f",touchPoint.x,touchPoint.y);
    
    //FIND WHERE THE TOUCH LOCATION IS IN THE GRID
    for (int i = 0; i < [[gridView getTileArray] count]; i++)
    {
        Tile* aTile = [[gridView getTileArray] objectAtIndex:i];
        
        //DETERMINING WHERE THE TOUCH IS IN THE GRID
        CGRect arect = [aTile getRect];
        CGRect gridRect = gridView.frame;
        
        arect.origin.x = arect.origin.x + gridRect.origin.x;
        arect.origin.y = arect.origin.y + gridRect.origin.y;
        
        if(CGRectContainsPoint(arect, touchPoint) )
        {
            NSLog(@"Touch Index: %d",i);
            
            //CHECK TO SEE IF THE INDEX MATCHES ONE OF THE USERS PIECES FOR HIGLIGHTING
            if (highlighted == NO && [[tileArray objectAtIndex:i] getAffiliation] == 1)
            {
                highlighted = YES;

                [aTile highlight];
                
                indexOfHighlighted = i;
            }
            //TILE HAS ALREADY BEEN HIGHLIGHTED
            else if(highlighted == YES && [[tileArray objectAtIndex:i] getAffiliation] == 1)
            {
                //REMOVE THE HIGHLIGHT JUST PLACED
                if (i == indexOfHighlighted)
                {
                    [aTile removeHighlight];
                    highlighted = NO;
                    
                    //RESET INDEX VALUE
                    indexOfHighlighted = -1;
                }
                //MOVE THE HIGHLIGHT TO ANOTHER PIECE
                else if([[tileArray objectAtIndex:i] getAffiliation] == 1)
                {
                    [[tileArray objectAtIndex:indexOfHighlighted] removeHighlight];
                    highlighted = YES;
                    indexOfHighlighted = i;
                    [aTile highlight];
                }
                
            }
            else if(highlighted == YES) //remove selected piece and put new piece to new tile
            {
                //IF THE MOVE IS LEGAL
                if ([self canUserMovePiece:indexOfHighlighted toThis:i])
                {
                    //REMOVE HIGHLIGHTED PIECE
                    [[tileArray objectAtIndex:indexOfHighlighted] setAffiliation:0];
                    userPieces = [self removeAnIndex:indexOfHighlighted fromArray:userPieces];
                    
                    //PLACE PIECE ON NEW INDEX
                    [aTile setAffiliation:1];
                    [userPieces addObject:[NSNumber numberWithInteger:i]];
                    
                    //DISABLE USER TOUCH INERACTIONS
                    [self.view removeGestureRecognizer:singleTap];
                    
                    //TELL HAL TO MOVE WITH CURRENT FIELD LAYOUT
                    [hal moveAgainstUser:[self getCurrentFieldDictionary]];
                    
                    userPieces = [theFieldDictionary objectForKey:@"userPieces"];
                    
                    highlighted = NO;
                    indexOfHighlighted = -1;
                    
                    //we'll also need to check the rules at some point!!
                }
                else
                {
                    
                }
                
            }
            break;
        }
    }
}


//if this does not pass, then we chill
-(BOOL)canUserMovePiece:(int)highlightedIndex toThis:(int)nextIndex
{
    BOOL ruling;
    
    //CAN'T MOVE INTO AN ENDZONE
    //I DON'T NEED TO WORRY ABOUT MOVING ON TOP OF EACHOTHER BECAUSE THAT GETS PICKED UP BY THE HIGHLIGHTING ACTION OF THE USER (ALSO IM ASSUMING THE USER IS NOT THAT MUCH OF AN IDIOT)
    if (!([[tileArray objectAtIndex:nextIndex] getAffiliation] == 11))
    {
        ruling = YES;
    }
    else
    {
        ruling = NO;
    }

    return ruling;
    
}

-(void)establishGestures
{
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:singleTap];
}

-(NSMutableArray*)getTileArrayOfAffiliation:(int)affiliationInit
{
    NSMutableArray* aTileArray=  [gridView getTileArray];
    NSMutableArray* aUserEndzone = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [aTileArray count]; i++)
    {
        if ([[aUserEndzone objectAtIndex:i] getAffiliation] == affiliationInit)
        {
            [aUserEndzone addObject:[NSNumber numberWithInteger:i]];
        }
    }
    
    return aUserEndzone;
}

-(NSMutableArray*)removeAnIndex:(int)indexInit fromArray:(NSMutableArray*)arrayInit
{
    int indexToRemove = -1;
    
    for (int i = 0; i < [arrayInit count] ; i++)
    {
        if ([[arrayInit objectAtIndex:i] integerValue] == indexInit)
        {
            indexToRemove = i;
            break;
        }
    }
    
    if (indexToRemove >= 0)
    {
        [arrayInit removeObjectAtIndex:indexToRemove];
    }
    
    return arrayInit;
}

-(NSMutableDictionary*)getCurrentFieldDictionary
{
    [theFieldDictionary setObject:userPieces forKey:@"userPieces"];
    [theFieldDictionary setObject:userEndzone forKey:@"userEndzone"];
    [theFieldDictionary setObject:halPieces forKey:@"halPieces"];
    [theFieldDictionary setObject:halEndzone forKey:@"halEndzone"];
    
    return theFieldDictionary;
}

@end
