//
//  CheckersTests.m
//  CheckersTests
//
//  Created by Dylan Shackelford on 6/14/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CheckersTests : XCTestCase

@end

@implementation CheckersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//        NSMutableArray* array = [[NSMutableArray alloc] init];
//    
//        for (int i = 0; i < 4 ; i ++)
//        {
//            [array addObject:[NSNumber numberWithInteger:i]];
//        }
//    
//        int index = 0;
//        int count = [array count];
//    
//    
//        while(index < 30)
//        {
//            double ran = arc4random()%count;
//            printf("%f\n", ran);
//            
//            index = index + 1;
//        }
//    
    int a = 10;
    int b = 5;
    if ((a % b) == 0)
    {
        NSLog(@"A is divisible by B");
    } else
    {
       NSLog(@"A isnt divisible by B");
    }

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
