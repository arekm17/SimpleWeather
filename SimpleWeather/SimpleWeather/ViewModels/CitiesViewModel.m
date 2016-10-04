//
//  CitiesViewModel.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "CitiesViewModel.h"

@implementation CitiesViewModel {
    NSArray* cities;
    NSMutableDictionary* citiesViewModels;
}

+ (CitiesViewModel*) createFromSettings {
    
    //this should be readed from coredata/hsared preferences
    //zamienić w jakieś init with persistent Data
    id citiesData = @[ [[CityForecastModel alloc] initWithId: @"7530858" name:@"Poznań"],
                       [[CityForecastModel alloc] initWithId: @"6695624" name:@"Wrocław"],
                       [[CityForecastModel alloc] initWithId: @"2643743" name:@"Londyn"],
                       ];
    
    return [[CitiesViewModel alloc] initWithCities:citiesData];
    
}


- (id) initWithCities: (NSArray*) citiesModels {

    self = [super init];
    if (self) {
        cities = citiesModels;
        citiesViewModels = [[NSMutableDictionary alloc] init];
        
        for (CityForecastModel* city in citiesModels) {
            CityForecastViewModel* viewModel = [[CityForecastViewModel alloc] initWithModel: city];
            [citiesViewModels setValue:viewModel forKey:city.cityId];
        }
        
    }
    return self;
}

- (NSArray*) cityIds {
    return citiesViewModels.allKeys;
}

- (void) setForecast: (CityForecastModel*) forecast {
    [[citiesViewModels valueForKey:forecast.cityId] updateForecast: forecast];
//    [self.observer onDataChanged];
}

- (NSInteger) count {
    return [cities count];
}

- (CityForecastViewModel*) getCityForecastViewModelForIndex: (NSInteger) index {
    return [citiesViewModels valueForKey: ((CityForecastModel*) cities[index]).cityId];
}

@end
//
//@protocol CityForecastUpdateDelegate <NSObject>
//
//- (void) forecastUpdated;
//
//@end