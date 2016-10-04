//
//  CityForecastModel.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resource.h"
#import "SingleForecastModel.h"

#define FORECAST_URL_PARAMS @"data/2.5/forecast?id=%@&units=metric&mode=json&APPID=9a3bc3958d46acf6e882f7de1a408d23"

@interface CityForecastModel : NSObject

@property (strong, nonatomic) NSString* cityId;
@property (strong, nonatomic) NSString* cityName;
@property (strong, nonatomic) NSMutableArray* forecastData;



+ (Resource*) forecastResourceForCityId: (NSString*) cityId;

+ (CityForecastModel*) parse: (id) data;

- (id) initWithId: (NSString*) cityId name: (NSString*) cityName;

- (void) addSingleForecast: (SingleForecastModel*) forecast;

@end
