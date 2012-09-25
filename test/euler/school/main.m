//
//  main.m
//  school
//
//  Created by Paul Sideleau on 9/23/12.
//
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Calculator *calculator = [Calculator alloc];
        calculator.name = @"PAUL's calcualtor";
        int x = [calculator add:10 plus:15];
        NSLog([NSString stringWithFormat:@"%d", x]);
        // insert code here...
        NSLog(calculator.name);
        
    }
    return 0;
}

