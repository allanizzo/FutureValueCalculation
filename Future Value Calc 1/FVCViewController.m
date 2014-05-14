//
//  FVCViewController.m
//  Future Value Calc 1
//
//  Created by mac book on 5/4/14.
//  Copyright (c) 2014 mac book. All rights reserved.
//

#import "FVCViewController.h"
#import "FVCCalculatorBrain.h"

@interface FVCViewController ()

@end
@implementation FVCViewController

@synthesize pvTextField;
@synthesize yrsTextField;
@synthesize irTextField;
@synthesize pvContents;
@synthesize keyBoardIsShown;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize the brain here!!!
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    keyBoardIsShown = NO;
    CGSize scrollContentSize = CGSizeMake(1024, 768);// CGSizeMake(1024, 850);// CGSizeMake(1024, 768);
    self.scrollView.contentSize = scrollContentSize;
}

- (void)keyboardWillHide:(NSNotification *)n
{
    
    NSDictionary *userInfo2 = [n userInfo];
    
    CGSize keyboardSize = [[userInfo2 objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect viewFrame = self.scrollView.frame;
    
    viewFrame.size.height += (keyboardSize.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [self.scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    keyBoardIsShown = NO;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    if(keyBoardIsShown){
        return;
    }
    NSDictionary *userInfo2 = [n userInfo];
    
    CGSize keyboardSize = [[userInfo2 objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect viewFrame = self.scrollView.frame;
    
    viewFrame.size.height -= (keyboardSize.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [self.scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    keyBoardIsShown = YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == self.pvTextField) {
        [self.pvTextField resignFirstResponder];
        return YES;
    }else if( textField == self.irTextField) {
        [self.irTextField resignFirstResponder];
        return YES;
    }else if(textField == self.yrsTextField){
        [self.yrsTextField resignFirstResponder];
        return YES;
    }

    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takeValueFromField:(id)sender {
    
    NSString *senderName;
    
    if(sender == self.pvTextField) {
        senderName = @"Present Value Text Field";
        self.pvContents = [self.pvTextField.text doubleValue];
        NSLog(@"The %@ has the contents (%f)", senderName, self.pvContents);
    } else if (sender == self.irTextField){
        senderName = @"Interest Rate Text Field";
        self.irContents = [self.irTextField.text doubleValue];
        NSLog(@"The %@ has the contents (%f)", senderName, self.irContents);
    } else if (sender == self.yrsTextField){
        senderName = @"Years Text Field";
        self.yrsContents = [self.yrsTextField.text doubleValue];
        NSLog(@"The %@ has the contents (%f)", senderName, self.yrsContents);
    }
        
}

- (IBAction)calculatorButton:(id)sender {
    
//    NSLog(@"hey i pressed the button");
    
    FVCCalculatorBrain *brain = [[FVCCalculatorBrain alloc] init];
                                 
    double pushToFutureValueField;

    pushToFutureValueField = [brain sumOfAllFields:self.pvContents :self.irContents :self.yrsContents];
    
//    self.futureValueLabel.text = @"%f",pushToFutureValueField;
    
    NSString *futureValueAmountThanksALOTDanny = [NSString stringWithFormat:@"$ %.2f",pushToFutureValueField];
    
    self.futureValueLabel.text = futureValueAmountThanksALOTDanny;
    
    // so the calculate button access (maybe creates) the dictionary and retrives the
    // results
    //
    // then it calls the calculator brain function (not created yet)
    // and spits the resulting answer out to the future value text field
    
    // ** I THINK, the dictionary gets updated everytime the cell value gets updated, something the check on for sure.
}


@end
