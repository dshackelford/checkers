//
//  SettingsViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsViewController.h"

@implementation SettingsViewController

-(void)viewDidLoad
{
    [titleLabel setFont:[UIFont systemFontOfSize:20]];
    [titleLabel setText:@"SETTINGS"];
    
    tableData = @[@"User Name", @"Difficulty", @"Team Color", @"Computer Color",@"Field Size"];
}

//REQUIRED PROTOCOL IMPLEMENTATIONS
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
    
    TextInputCell* textInputCell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (!textInputCell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"TextInputCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"myCell"];
        textInputCell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    
    textInputCell.cellLabel.text = [tableData objectAtIndex:indexPath.row];
    return textInputCell;
    
//    NSString* simpleTableIdentifier = @"SimpleTableItem";
//    
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if(cell == nil)
//    {
//        
//        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
//        
//    }
    
//    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [tableDetailData objectAtIndex:indexPath.row];
//    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    NSLog(@"touch on row %d", selectedRow);
}
@end