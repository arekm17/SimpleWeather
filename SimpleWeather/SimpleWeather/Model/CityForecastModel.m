//
//  CityForecastModel.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "CityForecastModel.h"

#define FORECAST_COUT 8

@implementation CityForecastModel

+ (Resource*) forecastResourceForCityId: (NSString*) cityId {
    id urlParams = [NSString stringWithFormat:FORECAST_URL_PARAMS, cityId];
    
    return [[Resource alloc] initWithUrlParams:urlParams parseMethod:^id(NSArray *data) {
        return [CityForecastModel parse: data];
    }];
}

+ (CityForecastModel*) parse: (id) data {
    CityForecastModel* result = [[CityForecastModel alloc] initEmpty];
    result.cityId = [[[data objectForKey:@"city"] objectForKey:@"id"] stringValue];
    result.cityName = [[data objectForKey:@"city"] objectForKey:@"name"];
    
    for (id forecast in [data objectForKey:@"list"]) {
        if (result.forecastData.count >= FORECAST_COUT) {
            break;
        }
        [result addSingleForecast:[SingleForecastModel parse:forecast]];
    }
    return result;
}

- (id) initEmpty {
    self = [super init];
    if (self) {
        self.forecastData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        self.forecastData = [[NSMutableArray alloc] init];
        for (int i = 0; i < FORECAST_COUT; i++) {
            [self.forecastData addObject:[SingleForecastModel empty]];
        }
    }
    return self;
}

- (id) initWithId: (NSString*) cityId name: (NSString*) cityName {
    self = [super init];
    if (self) {
        self.cityId = cityId;
        self.cityName = cityName;
        
        self.forecastData = [[NSMutableArray alloc] init];
        for (int i = 0; i < FORECAST_COUT; i++) {
            [self.forecastData addObject:[SingleForecastModel empty]];
        }
    }
    return self;
}

- (void) addSingleForecast: (SingleForecastModel*) forecast {
    [self.forecastData addObject: forecast];
}

@end



