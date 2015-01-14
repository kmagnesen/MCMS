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

@property NSIndexPath *editIndexPath;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *randySavage = [[MagicalCreature alloc]initWithFullname:@"Randy Savage" creatureDescription:@"The Macho Man"];
    MagicalCreature *hulkHogan   = [[MagicalCreature alloc]initWithFullname:@"Hulk Hogan" creatureDescription:@"Mr. America"];
    MagicalCreature *fredSavage  = [[MagicalCreature alloc]initWithFullname:@"Fred Savage" creatureDescription:@"From The Wonder Years"];

    self.creatureArray = [NSMutableArray arrayWithObjects:randySavage, hulkHogan, fredSavage, nil];

//    for (int i = 0; i < 50 ; i++) {
//        [self.creatureArray addObject:[MagicalCreature initWithFullname:[NSString stringWithFormat:@"Creature %i", i] creatureDescription:[NSString stringWithFormat:@"Description %i", i]]];
//    }
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.creatureTableView beginUpdates];
    [self.creatureTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:self.editIndexPath, nil] withRowAnimation:UITableViewRowAnimationRight];
    [self.creatureTableView endUpdates];
}

- (void) resetComponents {
    self.fullnameTextField.text = @"";
    self.descriptionTextField.text = @"";
    
}

- (IBAction)onAddButtonTapped:(UIButton *)sender {

    MagicalCreature *creature = [[MagicalCreature alloc] initWithFullname:self.fullnameTextField.text creatureDescription:self.descriptionTextField.text];

    [self.creatureArray addObject:creature];

    [self.creatureTableView reloadData];

    [self resetComponents];

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
    CreatureViewController *vc = segue.destinationViewController;
    self.editIndexPath = self.creatureTableView.indexPathForSelectedRow;
    MagicalCreature *creatureTapped = [self.creatureArray objectAtIndex:self.editIndexPath.row];
    vc.magicalCreature = creatureTapped;
}

@end
