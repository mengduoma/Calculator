//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Mengduo Ma on 3/18/12.
//  Copyright (c) 2012 Iowa State University. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber; 
@property (nonatomic) BOOL decimalIsEntered;
//@property (nonatomic) BOOL firsthistory;
@property (nonatomic, strong)CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringNumber;
@synthesize decimalIsEntered;
//@synthesize firsthistory;
@synthesize history;
@synthesize brain = _brain;


- (CalculatorBrain *) brain 
{
    if(!_brain)_brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];

    

    if (self.userIsInTheMiddleOfEnteringNumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
        self.history.text = [self.history.text stringByAppendingString:digit];
       }
    else{
            self.display.text=digit;
            self.userIsInTheMiddleOfEnteringNumber = YES;
            self.history.text = [self.history.text stringByAppendingString:digit];
        }

}
- (IBAction)decimalPressed:(UIButton *)sender {
    NSString *decimal = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringNumber) {
        
        if (!decimalIsEntered) {
            self.display.text = [self.display.text stringByAppendingString:decimal];
            decimalIsEntered = YES;
        }else {
            ;
       }
        self.history.text = [self.history.text stringByAppendingString: self.display.text];
    }
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringNumber = NO;
    NSString *tmp = @" ";
    self.history.text = [self.history.text stringByAppendingString:tmp];
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    if (userIsInTheMiddleOfEnteringNumber) {
        [self enterPressed];
    }
    NSString *tmp = @" ";
    NSString *operation = [sender currentTitle];
    self.history.text = [self.history.text stringByAppendingString: [sender currentTitle]];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    self.history.text = [[self.history.text stringByAppendingString: self.display.text] stringByAppendingString:tmp];
}


@end
