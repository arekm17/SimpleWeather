//
//  SingleForecastModelTest.m
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SingleForecastModel.h"

@interface SingleForecastModelTest : XCTestCase

@end

@implementation SingleForecastModelTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testParse {
    
    NSDictionary* json = @{
        @"dt": @1474329600,
        @"main": @{
            @"temp": @282.87f,
            @"temp_min": @282.322f,
            @"temp_max": @282.87f,
            @"pressure": @1022.02f,
            @"sea_level": @1031.23f,
            @"grnd_level": @1022.02f,
            @"humidity": @72,
            @"temp_kf": @0.55f
        },
        @"weather": @[
              @{
                  @"id": @802,
                  @"main": @"Clouds",
                  @"description": @"scattered clouds",
                  @"icon": @"03n"
              }
              ],
        @"clouds": @{
            @"all": @32
        },
        @"wind": @{
            @"speed": @3.46,
            @"deg": @38.5085
        },
        @"sys": @{
            @"pod": @"n"
        },
        @"dt_txt": @"2016-09-20 00:00:00"
    };
    SingleForecastModel* model = [SingleForecastModel parse:json];
    XCTAssertEqual(1474329600, model.dateTime);
    XCTAssertEqual(282.87f, model.temperatureF);
    XCTAssertTrue([@"Clouds" isEqualToString: model.weatherDescription]);
    XCTAssertTrue([@"03n" isEqualToString: model.icon]);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
