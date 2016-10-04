//
//  CityForecastViewModel.m
//  SimpleWeather
//
//  Created by Arek on 21.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "CityForecastViewModel.h"

@implementation CityForecastViewModel {
    CityForecastModel* dataModel;
    NSMutableArray* singleForecastViewModels;
}


- (id) initWithModel: (CityForecastModel*) model {
    self = [super init];
    if (self) {
        dataModel = model;
        singleForecastViewModels = [[NSMutableArray alloc] init];
        
        [self updateViewModels];
    }
    return self;
}

- (void) updateViewModels {
    BOOL cityVMUpdated = NO;
    for (int i = 0; i < dataModel.forecastData.count; i++) {
        id model = dataModel.forecastData[i];
        
        if (i < singleForecastViewModels.count) {
            [((SingleForecastViewModel*)singleForecastViewModels[i]) updateForecast: model];
        } else {
            SingleForecastViewModel* vm = [[SingleForecastViewModel alloc] initWithModel:model];
            [singleForecastViewModels addObject:vm];
            cityVMUpdated = YES;
        }
    }
    
    if (cityVMUpdated) {
        [self.observer onDataChanged];
    }
}

- (void) updateForecast: (CityForecastModel*) forecast {
    dataModel = forecast;
    [self updateViewModels];
}

- (NSString*) cityName {
    return [dataModel cityName];
}

- (NSArray*) getForecasts {
    return dataModel.forecastData;
}

- (SingleForecastViewModel*) getForecastVmForIndex: (NSInteger) index {
    if (index < [singleForecastViewModels count]) {
        return singleForecastViewModels[index];
    } else
        return nil;
}

@end
