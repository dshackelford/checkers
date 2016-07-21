//
//  HistoryViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/11/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HistoryViewController.h"

@implementation HistoryViewController

-(void)viewDidLoad
{
    _titleLabel.text = @"HISTORY";
    _titleLabel.font = [UIFont systemFontOfSize:20];
    
    tableData = @[@"User Name", @"Difficulty", @"Team Color", @"Computer Color",@"Field Size"];

    CGSize screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    int rowHeight =55;
    double tableHeight = [tableData count]*rowHeight;
    theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, screenSize.width, tableHeight) style:UITableViewStylePlain];
    [theTableView setRowHeight:rowHeight];

    [theTableView setDataSource:self];
    [theTableView setDelegate:self];

    [self.view addSubview:theTableView];

    [theTableView setBackgroundColor:[UIColor blueColor]];

[self.view setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];

}

#pragma mark - UITableViewProtocols
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0 || indexPath.row == 4)
    {
        TextInputCell* cell = nil;
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TextInputCell" owner:self options:nil]lastObject];
        
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        cell.cellLabel.text = [tableData objectAtIndex:indexPath.row];
        cell.cellTextField.delegate = self;
        cell.cellTextField.borderStyle = UITextBorderStyleNone;
        
        if ([AppUtilities doesFileExistAtPath:[AppUtilities getPathToUserInfoFile]] == YES)
        {
            NSDictionary* myDictionary = [NSDictionary dictionaryWithContentsOfFile:[AppUtilities getPathToUserInfoFile]];
            
            if (!([myDictionary objectForKey:@"UserName"] == nil) && indexPath.row == 0)
            {
                NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary   objectForKey:@"UserName"]];
                [cell.cellTextField setText:aSTring];
            }
            else if(!([myDictionary objectForKey:@"FieldSize"] == nil) && indexPath.row == 4)
            {
                NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary objectForKey:@"FieldSize"]];
                [cell.cellTextField setText:aSTring];
            }
        }
        
        return cell;
    }
    else
    {
        PickerInputCell* cell = nil;
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PickerInputCell" owner:self options:nil]lastObject];
        
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        cell.titleLabel.text = [tableData objectAtIndex:indexPath.row];
        cell.picker.delegate = self;
        cell.picker.dataSource = self;
        
        if ([AppUtilities doesFileExistAtPath:[AppUtilities getPathToUserInfoFile]] == YES)
        {
            NSDictionary* myDictionary = [NSDictionary dictionaryWithContentsOfFile:[AppUtilities getPathToUserInfoFile]];
            
            if(!([myDictionary objectForKey:@"DifficultySetting"] == nil) && indexPath.row == 1)
            {
                //                NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary objectForKey:@"DifficultySetting"]];
                //                [cell.cellTextField setText:aSTring];
            }
            else if(!([myDictionary objectForKey:@"UserColor"] == nil) && indexPath.row == 2)
            {
                //                NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary   objectForKey:@"UserColor"]];
                //                [cell.cellTextField setText:aSTring];
            }
            else if(!([myDictionary objectForKey:@"ComputerColor"] == nil) && indexPath.row == 3)
            {
                //                NSString* aSTring = [NSString stringWithFormat:@"%@",(NSString*)[myDictionary objectForKey:@"ComputerColor"]];
                //                [cell.cellTextField setText:aSTring];
            }
        }
        
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    
    NSLog(@"touch on row %d", selectedRow);
}

@end