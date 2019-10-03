//
//  main.m
//  FileGeneratorUsage
//
//  Created by Paul Taykalo on 10/3/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AwesomeClass0.h"
#import "AwesomeClass10.h"
#import "AwesomeClass20.h"
#import "AwesomeClass30.h"
#import "AwesomeClass40.h"
#import "AwesomeClass50.h"
#import "AwesomeClass60.h"
#import "AwesomeClass70.h"
#import "AwesomeClass80.h"
#import "AwesomeClass90.h"
#import "AwesomeClass100.h"
#import "AwesomeClass200.h"
#import "AwesomeClass300.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World! Dependencies for first one %@",
            @[@([AwesomeClass0.new complexLogic]),
            @([AwesomeClass10.new complexLogic]),
            @([AwesomeClass20.new complexLogic]),
            @([AwesomeClass30.new complexLogic]),
            @([AwesomeClass40.new complexLogic]),
            @([AwesomeClass50.new complexLogic]),
            @([AwesomeClass60.new complexLogic]),
            @([AwesomeClass70.new complexLogic]),
            @([AwesomeClass80.new complexLogic]),
            @([AwesomeClass90.new complexLogic]),
            @([AwesomeClass100.new complexLogic]),
            @([AwesomeClass200.new complexLogic]),
              @([AwesomeClass300.new complexLogic])]);

    }
    return 0;
}
