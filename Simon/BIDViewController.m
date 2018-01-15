//
//  BIDViewController.m
//  Simon
//
//  Created by Thomas Shweh on 5/27/15.
//  Copyright (c) 2015 Thomas Shweh Inc. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController
{
    NSInteger userInput[100000];
    NSInteger series[100000];
    // declares two global  of type int that allow us to add and remomve values easily. The numbers in the array are arbitrarily high numbers
    
    NSTimer *onTimer;
    NSTimer *offTimer;
    //declares two timers to turn the highlight on or off
    
    NSTimer *buttonActivation;
    //declares timer to activate buttons after sequence is over
    
    int i, j, k, l, score, round, inputTerm;
    //declares global variables to be used throughout the program
    
    double seconds, delay;
    //declares timer intervals to be used, seconds being the number of seconds the button is highlihgted and delay being the amount of delay between each iteration
    
    UIAlertView *lose;
    //declares alert for when the user presses the wrong button
    
    NSString *scoreOutput;
    //declares string to print out the score of the user
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lose = [[UIAlertView alloc] initWithTitle:@"You Lose" message:@"You picked the wrong button" delegate:nil cancelButtonTitle:@"Start a new game" otherButtonTitles:nil, nil];
    //declares alert statement and text when the program loads
    
    [self deactivateButtons];
    //calls method to deactivate buttons when program loads
    
    _instructions.enabled = YES;
    // activates insctructions buttons as the program loads
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)redButton:(id)sender //method for red button
{
    if (inputTerm < round)
        //a condition put in place to tell the program to keep accepting inputs or not
    
    {
        userInput[i] = 0;
        //assigns a value to the input given by the user
        
        if (userInput[i] == series[i])
            //checks to see if the user input matches the randomly generated number in the series
        
        {
            i++;
            //incriments i for the next number in the series
            
            inputTerm++;
            //increments the inputTerm to progress in finishing a round
        }
        else //condition when user input is incorrect
        {
            [lose show];//displays alredt
            
            [self deactivateButtons];
            //calls method to deativate buttons
        }
    }
    if (inputTerm == round)
        //condition for when the round has ended
    {
        score ++; //increments the score
        round ++; //increments the number of rounds
        _scoreDisplay.text = [NSString stringWithFormat:@"%i", score];
        [self displaySequence];
        //calls method to play the sequence with the next term
    }
}

- (IBAction)blueButton:(id)sender
{
    if (inputTerm < round)
    {
        userInput[i] = 1;
        if (userInput[i] == series[i])
        {
            i++;
            inputTerm++;
        }
        else
        {
            [lose show];
            [self deactivateButtons];
        }
    }
    if (inputTerm == round)
        {
        score ++;
        round ++;
        _scoreDisplay.text = [NSString stringWithFormat:@"%i", score];
        [self displaySequence];
       
    }}
- (IBAction)yellowButton:(id)sender
{
    if (inputTerm < round)
    {
        userInput[i] = 2;
        if (userInput[i] == series[i])
        {
            i++;
            inputTerm++;
        }
        else
        {
            [lose show];
            [self deactivateButtons];
        }
    }
    if (inputTerm ==round)
    {
        score ++;
        round ++;
        _scoreDisplay.text = [NSString stringWithFormat:@"%i", score];
        [self displaySequence];
    }}

- (IBAction)greenButton:(id)sender
{
    if (inputTerm < round)
    {
        userInput[i] = 3;
        if (userInput[i] == series[i])
        {
            i++;
            inputTerm++;
        }
        else
        {
            [lose show];
            [self deactivateButtons];
        }
    }
    if (inputTerm ==round)
    {
        score ++;
        round ++;
        _scoreDisplay.text = [NSString stringWithFormat:@"%i", score];
        [self displaySequence];
    }
}
- (void) buttonColorOn
{
    j++;
    //incriments j by one everytime the method is called, this ensures that the next number in the sequence is being looked at
    if (series[j - 1]== 0) //condition for when the randomly generated number is 0
    {
        _redButtonImage.highlighted = YES;
        //highlights image of buton
        offTimer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(buttonColorOff) userInfo:nil repeats:NO];
        //sets timer to fire off and call the method to turn the highlight off in 0.5 seconds later
        
    }
    else if (series[j-1]== 1)
        //condition for when the randomly generated number is 1
    {
        _blueButtonImage.highlighted = YES;
        offTimer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(buttonColorOff) userInfo:nil repeats:NO];
        //sets timer to fire off and call the method to turn the highlight off in 0.5 seconds later
       
       
    }
    else if (series[j-1]==2)
        //condition for when the randomly generated number is 2
    {
        _yellowButtonImage.highlighted = YES;
        offTimer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(buttonColorOff) userInfo:nil repeats:NO];
        //sets timer to fire off and call the method to turn the highlight off in 0.5 seconds later
       
   
    }
    else if (series[j-1] ==3)
        //condition for when the randomly generated number is 3
    {
        _greenButtonImage.highlighted = YES;
        offTimer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(buttonColorOff) userInfo:nil repeats:NO];
        //sets timer to fire off and call the method to turn the highlight off in 0.5 seconds later
      
        
    }
    

}
- (void) buttonColorOff
{
    if (series[j-1]== 0)
        //condition for when the randomly generated number is 0
    {
        _redButtonImage.highlighted = NO;
        //turns off highlight

    }
    else if (series[j-1]== 1)
        //condition for when the randomly generated number is 1
    {
        _blueButtonImage.highlighted = NO;
        //turns off highlight


    }
    else if (series[j-1]== 2)
        //condition for when the randomly generated number is 2
    {
        _yellowButtonImage.highlighted = NO;
        //turns off highlight

    
    }
    else if (series[j-1] ==3)
        //condition for when the randomly generated number is 3
    {
        _greenButtonImage.highlighted = NO;
        //turns off highlight

    }
    i=0;
    //initializes i to 0.

}
- (void) reactivateButtons
{
    _redButton.enabled = YES;
    _blueButton.enabled = YES;
    _yellowButton.enabled = YES;
    _greenButton.enabled = YES;
    _instructions.enabled = YES;
    //enables buttons, or allows user to interact with them
    
    _redButtonImage.alpha = 0.0;
    _blueButtonImage.alpha = 0.0;
    _yellowButtonImage.alpha = 0.0;
    _greenButtonImage.alpha = 0.0;
    //makes the images transparent so the buttons can be viewed with ease
    
}
- (void) deactivateButtons
{
    _redButton.enabled = NO;
    _blueButton.enabled = NO;
    _yellowButton.enabled = NO;
    _greenButton.enabled = NO;
    _instructions.enabled = NO; 
    //disables buttons so the user cannot interact with them, this is helpful to make sure the user does not intefere when the sequence is being displayed
    
    _redButtonImage.alpha = 1.0;
    _blueButtonImage.alpha = 1.0;
    _yellowButtonImage.alpha = 1.0;
    _greenButtonImage.alpha = 1.0;
    //makes the images solid and viewable

}
- (void)displaySequence
{
    seconds= 0.5, delay = 1.0, j=0;
    //initializes times for seconds and delay, initializes j to zero so that the buttons are displayed starting from the first term everytime
    
    inputTerm = 0;
    // initializes the number of user input term to zero
    
    series[l] = arc4random_uniform(4);
    //generates a random number for value l.
    
    [self deactivateButtons];
    //deactibates buttons so user does not interfere
    
    buttonActivation = [NSTimer scheduledTimerWithTimeInterval:1.5 *(l+1) target:self selector:@selector(reactivateButtons) userInfo:nil repeats:NO];
    //sets up timer to call a method to reactivate the buttons after the sequence is played. It takes approximately 1.5 seconds for a sequence to be played so 1.5 is multiplied by the number of terms plus 1
    
    for (k=0; k<i+1; k++)
        //for loop for continuously highlighting buttons
    
    {
        [self performSelector:@selector(buttonColorOn) withObject:nil afterDelay:delay*(k+1)];
        //sets up a timer to call up a method to switch the highlight for each individual term. There is a delay that is raised by one second everyterm to prevent overlapping
    }
    l++;
    //increments l so the next term of the randomly generated series can be generated
    
}

- (IBAction)Start:(id)sender {
    memset(series, 0, 100000 * sizeof(*series));
    memset(userInput, 0, 100000 * sizeof(*userInput));
    //clears both arrays and sets all variables to zero
    
    i=0, score = 0, round = 1, inputTerm = 0, l=0;
    //resets and initializes all values to start a new game
    
    _scoreDisplay.text = [NSString stringWithFormat:@"%i", score];
    //prints string to label when the game starts
    
    [self displaySequence];
    //calls method to display the sequence
  
    
   }

- (IBAction)instructions:(id)sender {
    UIAlertView *rules = [[UIAlertView alloc] initWithTitle:@"Rules" message:@"1. Hit the “Start Game” Button. 2. Watch the sequence of buttons play. 3. After the sequence is done playing, the buttons should be activated. You may have to wait a second or two. Then, press the buttons in the order that you saw them. If you entered in the sequence correctly, you should see the sequence play again. 4. Repeat steps 2 and 3 until you mess up. 5. An alert should appear if you inputed in the sequence incorrectly. Click Start a new Game to continue. 6. Hit  the “New Game” button to play again. 7. You can hit the “New Game” button while you are still in a game. This will completely start over the game." delegate:nil cancelButtonTitle:@"got it" otherButtonTitles:nil, nil]; //declares an alert for the rules
        [rules show]; //displays the rules
}
@end
