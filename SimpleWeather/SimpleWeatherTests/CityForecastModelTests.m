//
//  SimpleWeatherTests.m
//  SimpleWeatherTests
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CityForecastModel.h"

@interface SimpleWeatherTests : XCTestCase

@end

@implementation SimpleWeatherTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testParse {
    NSDictionary* json = @{@"city" : @{@"id" : @4362750,
                                       @"name" : @"Poznań"}
                           };
    CityForecastModel* model = [CityForecastModel parse:json];
    XCTAssertTrue([@"4362750" isEqualToString: model.cityId]);
    XCTAssertTrue([@"Poznań" isEqualToString: model.cityName]);

    json = @{@"city" : @{@"id" : @4362750,
                         @"name" : @"Poznań"}
             };
    model = [CityForecastModel parse:json];
    XCTAssertTrue([@"4362750" isEqualToString: model.cityId]);
    XCTAssertTrue([@"Poznań" isEqualToString: model.cityName]);

}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
