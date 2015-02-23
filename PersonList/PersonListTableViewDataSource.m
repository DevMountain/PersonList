//
//  PersonListTableViewDataSource.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonListTableViewDataSource.h"
#import "PersonController.h"

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

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonListCell" forIndexPath:indexPath];
	
    Person *person = [PersonController sharedInstance].personList[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:person.imageName];
    cell.textLabel.text = person.name;
    
    return cell;
}

@end
