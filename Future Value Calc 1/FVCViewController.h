//
//  FVCViewController.h
//  Future Value Calc 1
//
//  Created by mac book on 5/4/14.
//  Copyright (c) 2014 mac book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface FVCViewController : UIViewController <UITextFieldDelegate>



- (IBAction)takeValueFromField:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)keyboardWillHide:(NSNotification *)n;
- (void)keyboardWillShow:(NSNotification *)n;

@property (weak, nonatomic) IBOutlet UITextField *pvTextField;
@property (weak, nonatomic) IBOutlet UITextField *irTextField;
@property (weak, nonatomic) IBOutlet UITextField *yrsTextField;
@property (weak, nonatomic) IBOutlet UILabel *futureValueLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property BOOL keyBoardIsShown;

@property double pvContents;
@property NSString *pvContentsAsString;
@property double irContents;
@property double yrsContents;


- (IBAction)calculatorButton:(id)sender;

@end
