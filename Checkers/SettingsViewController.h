//
//  SettingsViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "TextInputCell.h"
#import "PickerInputCell.h"
#import "AppUtilities.h"

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UILabel* titleLabel;
    UITableView* theTableView;
    
    NSArray* tableData;
    
    int rowHeight;
}


@end
