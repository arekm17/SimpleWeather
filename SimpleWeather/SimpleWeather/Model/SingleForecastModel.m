//
//  SingleForecastModel.m
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "SingleForecastModel.h"

@implementation SingleForecastModel

+ (SingleForecastModel*) parse: (id) data {
    SingleForecastModel* result = [SingleForecastModel new];
    result.dateTime = [[data objectForKey:@"dt"] intValue];
    result.temperatureF = [[[data objectForKey:@"main"] objectForKey:@"temp"] floatValue];
    result.weatherDescription = [[data objectForKey:@"weather"][0] objectForKey:@"main"];
    result.icon = [[data objectForKey:@"weather"][0] objectForKey:@"icon"];
    return result;
}

+ (SingleForecastModel*) empty {
    SingleForecastModel* result = [SingleForecastModel new];
    result.dateTime = 0;
    result.weatherDescription = nil;
    result.temperatureF = 0.0f;
    result.icon = nil;
    return result;
}

@end
