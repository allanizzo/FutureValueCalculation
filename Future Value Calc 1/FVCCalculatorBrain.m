//
//  FVCCalculatorBrain.m
//  Future Value Calc 1
//
//  Created by mac book on 5/4/14.
//  Copyright (c) 2014 mac book. All rights reserved.
//

#import "FVCCalculatorBrain.h"
#import "FVCViewController.h"

@implementation FVCCalculatorBrain


- (double)sumOfAllFields:(double)presentValue :(double)interestRate :(double)years {
    
    double onePlusInterestRate = (1+interestRate);
    double exponential = years;
    
    double futureValue = presentValue*(pow(onePlusInterestRate, exponential));
    
    NSLog(@"The sum of the three textfields is: %f", futureValue);
    
    return futureValue;
    

    
}


@end
