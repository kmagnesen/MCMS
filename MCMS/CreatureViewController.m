//
//  CreatureViewController.m
//  MCMS
//
//  Created by Kyle Magnesen on 1/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *inputName;
@property (strong, nonatomic) IBOutlet UITextField *inputDescription;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *skillsTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navButtonEdit;
@property (strong, nonatomic) IBOutlet UIButton *addSkillButton;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.inputName.text = self.magicalCreature.fullname;
    self.inputDescription.text = self.magicalCreature.description;

    [self disableEditing:self.inputName];
    [self disableEditing:self.inputDescription];
}

- (void) disableEditing:(UITextField *)field {

    field.enabled = FALSE;
    field.borderStyle = UITextBorderStyleNone;
}

- (void) enableEditing:(UITextField *)field {

    field.enabled = TRUE;
    field.borderStyle = UITextBorderStyleRoundedRect;
}
- (IBAction)editButtonTapped:(UIBarButtonItem *)sender {
    if([self.navButtonEdit.title isEqualToString:@"Edit"]) {
        self.navButtonEdit.title = @"Done";
        [self enableEditing:self.inputName];
        [self enableEditing:self.inputDescription];
        self.addSkillButton.hidden = FALSE;
    } else {
        self.navButtonEdit.title = @"Edit";
        [self disableEditing:self.inputName];
        [self disableEditing:self.inputDescription];
        self.addSkillButton.hidden = TRUE;
    }


    self.magicalCreature.fullname = self.inputName.text;
    self.magicalCreature.creatureDescription = self.inputDescription.text;
}

#pragma mark UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.magicalCreature.skills.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCellID" forIndexPath:indexPath];
    cell.textLabel.text = [self.magicalCreature.skills objectAtIndex:indexPath.row];

    return cell;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self.magicalCreature.skills addObject:[alertView textFieldAtIndex:0].text];
        [self.skillsTableView reloadData];
    }
}

- (IBAction)onAddSkillTapped:(UIButton *)sender {
    UIAlertView *addSkill = [[UIAlertView alloc] initWithTitle:@"Create New Skill" message:nil delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"ADD", nil];
    addSkill.alertViewStyle = UIAlertViewStylePlainTextInput;
    [addSkill show];
    
}


@end
