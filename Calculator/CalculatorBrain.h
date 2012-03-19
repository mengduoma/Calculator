//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Mengduo Ma on 3/18/12.
//  Copyright (c) 2012 Iowa State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation: (NSString *)operation;
@end
