//
//  SingleForecastViewModel.h
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "ViewModel.h"
#import "SingleForecastModel.h"

@interface SingleForecastViewModel : ViewModel

@property (nonatomic, strong, readonly) NSString* time;
@property (nonatomic, strong, readonly) NSString* temperature;
@property (nonatomic, strong, readonly) NSString* weatherDescription;
@property (nonatomic, strong, readonly) NSURL* iconUrl;

- (id) initWithModel: (SingleForecastModel*) model;
- (void) updateForecast: (SingleForecastModel*) forecast;


@end
