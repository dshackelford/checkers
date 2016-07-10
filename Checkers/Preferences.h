//
//  Preferences.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/9/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextInputCell.h"
#import "TextFieldElement.h"

@interface Preferences : UITableViewController <UITextFieldDelegate>
{
    NSMutableArray* tableData;
}
@end