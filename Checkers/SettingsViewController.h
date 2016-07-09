//
//  SettingsViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "TextInputCell.h"

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UILabel* titleLabel;
    
    NSArray* tableData;
    NSArray* tableDetailData;
}

@property (nonatomic,weak) IBOutlet UITableView* prefTableView;

@end
