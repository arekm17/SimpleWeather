//
//  CitiesForecastModel.h
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityForecastModel.h"

@interface CitiesForecastModel : NSObject

@property (strong, readonly, nonatomic) NSArray* cities;

- (void) setCity: (CityForecastModel*) city;


@end
