//
//  PersonListTableViewDataSource.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonListTableViewDataSource.h"
#import "PersonController.h"
#import "PersonTableViewCell.h"

@implementation PersonListTableViewDataSource

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [PersonController sharedInstance].personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // *Ensure cell prototype in storyboard contains same cellIdentifier as the one used for dequeue
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personTableViewCell" forIndexPath:indexPath];
    Person *person = [PersonController sharedInstance].personList[indexPath.row];

    [cell updateWithPerson:person];
    
    return cell;
}

@end
