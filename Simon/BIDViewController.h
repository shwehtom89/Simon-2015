//
//  BIDViewController.h
//  Simon
//
//  Created by Thomas Shweh on 5/27/15.
//  Copyright (c) 2015 Thomas Shweh Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController

- (IBAction)redButton:(id)sender;
- (IBAction)blueButton:(id)sender;
- (IBAction)yellowButton:(id)sender;
- (IBAction)greenButton:(id)sender;
- (IBAction)Start:(id)sender;
// declares action methods for all five buttons used in this application

- (IBAction)instructions:(id)sender; //declares action method for displaying the information

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
//declares properties for the four input buttons so that they can be referenced

@property (weak, nonatomic) IBOutlet UIButton *instructions;
//declares property for the instruction button to referenced

@property (weak, nonatomic) IBOutlet UILabel *scoreDisplay;
//declares label for score

@property (weak, nonatomic) IBOutlet UIImageView *greenButtonImage;
@property (weak, nonatomic) IBOutlet UIImageView *redButtonImage;
@property (weak, nonatomic) IBOutlet UIImageView *blueButtonImage;
@property (weak, nonatomic) IBOutlet UIImageView *yellowButtonImage;
//declares four image views to display the highlighted sequence of buttons

- (void)displaySequence; //declares method for displaying the sequence of buttons
- (void)buttonColorOn; //declares method for highlighting the button
- (void)buttonColorOff; //declares method for changing the button from its highlighted state to normal
- (void)reactivateButtons; //declares method for reactivating the buttons so that they can be used
- (void)deactivateButtons; //declares method for deactivating the buttons so the user cannot interfere when the sequence is being played
@end
