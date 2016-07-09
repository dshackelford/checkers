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
            if (highlighted == NO)
            {
                highlighted = YES;
                
                //place a hilight on the the selected piece
                [aTile highlight];
                
                indexOfHighlighted = i;
                
                //check to see if that's within the rules!
                //what if user taps the same hilighted square to un-hilight it?
                
            }
            else if(highlighted == YES && i == indexOfHighlighted)//tile was already hilighted
            {
                //hilighted index == the current index
                [aTile setAffiliation:0];
                
                //reset the index;
            }
            else
            {
                highlighted = NO;
                
                //remove the hilight and the piece on the tile
                
                //place a piece on the newly selected index
                [aTile setAffiliation:1];
                
                //disable the users touch interaction
                [self.view removeGestureRecognizer:singleTap];
                
                //tell hal to move with current field layout
                [hal moveAgainstUser:[self getCurrentFieldDictionary]];
                
                userPieces = [theFieldDictionary objectForKey:@"userPieces"];
                
                //we'll also need to check the rules at some point!!
            }
            break;
        }
    }
}

//if this does not pass, then we chill
-(BOOL)checkrules:(int)i
{
    BOOL fair;
    
    if (((i + 1) % (int)[gridView getGridSize].width) == 0)
    {
        NSLog(@"right edge");
    }
    else if((i % (int)[gridView getGridSize].width ) == 0)
    {
        NSLog(@"Left Edge");
    }
    
    if(i < [gridView getGridSize].width)
    {
        NSLog(@"Top Edge");
    }
    else if(i >= [gridView getGridSize].width*([gridView getGridSize].height-1))
    {
        NSLog(@"Bootom Edge");
    }
    
    //for testing purposes, this will definitely change in the future
    return fair;
    
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

-(NSMutableDictionary*)getCurrentFieldDictionary
{
    [theFieldDictionary setObject:userPieces forKey:@"userPieces"];
    [theFieldDictionary setObject:userEndzone forKey:@"userEndzone"];
    [theFieldDictionary setObject:halPieces forKey:@"halPieces"];
    [theFieldDictionary setObject:halEndzone forKey:@"halEndzone"];
    
    return theFieldDictionary;
}

@end
