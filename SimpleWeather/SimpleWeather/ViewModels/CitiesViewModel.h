//
//  CitiesViewModel.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityForecastViewModel.h"
#import "CityForecastModel.h"
#import "ViewModel.h"

@interface CitiesViewModel : ViewModel

//@property (strong, nonatomic) NSArray* cities;
//@property (strong, nonatomic) NSDictionary* citiesDict;

+ (CitiesViewModel*) createFromSettings;

- (NSArray*) cityIds;
- (void) setForecast: (CityForecastModel*) forecast;

- (NSInteger) count;
- (CityForecastViewModel*) getCityForecastViewModelForIndex: (NSInteger) index;

@end
