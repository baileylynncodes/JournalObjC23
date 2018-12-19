//
//  BMEntryTableViewController.m
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMEntryTableViewController.h"
#import "BMEntryController.h"
#import "BMEntryViewController.h"


@interface BMEntryTableViewController ()

@end

@implementation BMEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return BMEntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"entryCell" forIndexPath:indexPath];
    
    BMEntry *entry = [[BMEntryController sharedInstance] entries][indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BMEntry *entry = [[BMEntryController sharedInstance] entries][indexPath.row];
        [[BMEntryController sharedInstance] removeEntry: entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString: @"toAdd"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BMEntryViewController *destinationVC = [segue destinationViewController];
        BMEntry *entry = [[BMEntryController sharedInstance] entries][indexPath.row];
        destinationVC.entry = entry;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

