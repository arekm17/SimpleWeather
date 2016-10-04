//
//  CityForecastViewModel.h
//  SimpleWeather
//
//  Created by Arek on 21.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
#import "CityForecastModel.h"
#import "SingleForecastViewModel.h"

@interface CityForecastViewModel : ViewModel

@property (strong, nonatomic, readonly) NSString* cityName;

//@property (strong, nonatomic, readonly) CityForecastModel* dataModel;
//@property (strong, nonatomic) NSString* temperature;
//@property (strong, nonatomic) NSString* time;


//- (id) initWithCity: (NSString*) city;
//- (id) initWithData: (NSDictionary*) data;
- (id) initWithModel: (CityForecastModel*) model;
- (void) updateForecast: (CityForecastModel*) forecast;
- (NSArray*) getForecasts;

- (SingleForecastViewModel*) getForecastVmForIndex: (NSInteger) index;

@end
