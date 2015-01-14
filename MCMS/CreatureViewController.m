//
//  CreatureViewController.m
//  MCMS
//
//  Created by Kyle Magnesen on 1/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CreatureViewController.h"
#import "RootViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatureArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    cell.textLabel.text = [self.creatureArray objectAtIndex:indexPath.row];
    return cell;
}
@end
