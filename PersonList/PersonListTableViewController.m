//
//  PersonListTableViewController.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonListTableViewController.h"
#import "PersonListTableViewDataSource.h"
#import "PersonDetailViewController.h"

#import "PersonController.h"

@interface PersonListTableViewController ()

@property (nonatomic, strong) IBOutlet PersonListTableViewDataSource *dataSource;

@end

@implementation PersonListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.dataSource = [PersonListTableViewDataSource new];
//    self.tableView.dataSource = self.dataSource;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    // Check to see if selection is UITableViewCell
    if([sender isKindOfClass:[UITableViewCell class]]) {

        // Obtain indexPath from sender
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

        // Instantiate viewController for segue destination
        PersonDetailViewController *destinationController = [segue destinationViewController];
		destinationController.person = [PersonController sharedInstance].personList[indexPath.row];
    }
}

- (IBAction)unwindToPersonList:(UIStoryboardSegue *)segue {
	
}

@end
