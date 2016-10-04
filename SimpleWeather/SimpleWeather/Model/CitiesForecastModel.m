//
//  CitiesForecastModel.m
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "CitiesForecastModel.h"

@implementation CitiesForecastModel {
    NSMutableDictionary* citiesDict;
}

- (id) init {
    self = [super init];
    if (self) {
       citiesDict = [NSMutableDictionary new];
    }
    return self;
}

- (void) setCity: (CityForecastModel*) city {
    [citiesDict setObject:city forKey:city.cityId];
}

- (NSArray*) cities {
    return [citiesDict allValues];
}

@end
