//
//  ViewController.m
//  MCMS
//
//  Created by Kyle Magnesen on 1/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (strong, nonatomic) IBOutlet UITableView *creatureTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *randySavage = [[MagicalCreature alloc]initWithFullname:@"Randy Savage" creatureDescription:@"The Macho Man"];
    MagicalCreature *hulkHogan   = [[MagicalCreature alloc]initWithFullname:@"Hulk Hogan" creatureDescription:@"Mr. America"];
    MagicalCreature *fredSavage  = [[MagicalCreature alloc]initWithFullname:@"Fred Savage" creatureDescription:@"From The Wonder Years"];

    self.creatureArray = [NSMutableArray arrayWithObjects:randySavage, hulkHogan, fredSavage, nil];

    for (MagicalCreature *magicalCreature in self.creatureArray) {
        NSLog(@"%@", magicalCreature);
    }
}

- (IBAction)onAddButtonTapped:(UIButton *)sender {
    
    NSString *descriptionEntry = self.descriptionTextField.text;
    NSString *nameEntry = self.fullnameTextField.text;
    MagicalCreature *creature = [[MagicalCreature alloc] initWithFullname:nameEntry creatureDescription:descriptionEntry];
    [self.creatureArray addObject:creature];


    self.fullnameTextField.text = @"";
    self.descriptionTextField.text = @"";
    [self.fullnameTextField resignFirstResponder];
    [self.creatureTableView reloadData];
}

#pragma mark UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatureArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MagicalCreature *creature = [self.creatureArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];

    cell.textLabel.text = creature.fullname;
    cell.detailTextLabel.text = creature.creatureDescription;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *selectedIndexPath = self.creatureTableView.indexPathForSelectedRow;
    CreatureViewController *vc = segue.destinationViewController;
    MagicalCreature *creatureTapped = [self.creatureArray objectAtIndex:selectedIndexPath.row];
    vc.magicalCreature = creatureTapped;
}

@end
