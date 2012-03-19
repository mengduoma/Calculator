//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Mengduo Ma on 3/18/12.
//  Copyright (c) 2012 Iowa State University. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject)[self.operandStack removeLastObject];
    return [operandObject doubleValue];

}


- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
    
}


- (double)performOperation: (NSString *)operation
{
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    }else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand]*[self popOperand];
    }
    else if ([operation isEqualToString:@"-"]) {
        double subtranhend = [self popOperand];
        result = [self popOperand]- subtranhend;
    }else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand]/divisor;
    }else if ([operation isEqualToString:@"Sin"]) {
        result = sin([self popOperand]);
    }else if ([operation isEqualToString:@"Cos"]) {
        result = cos([self popOperand]);
    }else if ([operation isEqualToString:@"Sqrt"]) {
        result = sqrt([self popOperand]);
    }else if([operation isEqualToString:@"pi"]){
        NSNumber *operandObject = [self.operandStack lastObject];
        if ([self.operandStack lastObject]) {
            result = [operandObject doubleValue]*3.14;
        }                
        else {
           result = 3.14;
        }
    }else if ([operation isEqualToString:@"C"]) {
        result = 0;
    }
    
    
    [self pushOperand:result];
    
    return result;

}

@end
