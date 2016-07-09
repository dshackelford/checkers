//
//  AppUtilities.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/9/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppUtilities : NSObject
{
    
}

+(NSString*)getPathToUserInfoFile;
+(NSString*)getPathToLevelObjectsFile;

+(BOOL)doesFileExistAtPath: (NSString*)path;

+(void)saveLevelForRestart;

+(void)getObjectsForLevelRestart:(UIView*)container :(UIButton*)placeHolderButton;

@end