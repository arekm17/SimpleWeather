//
//  SingleForecastViewModel.m
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "SingleForecastViewModel.h"

static NSDateFormatter* dateFormatter = nil;

@implementation SingleForecastViewModel {
    SingleForecastModel* forecast;
    NSString* dateString;
}

+ (void) initialize {
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
    }
}

- (id) initWithModel: (SingleForecastModel*) model {
    self = [super init];
    if (self) {
        forecast = model;
        [self updateDate];
    }
    return self;
}
- (void) updateForecast: (SingleForecastModel*) model {
    forecast = model;
    [self updateDate];
    [self.observer onDataChanged];
}

- (void) updateDate {
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970: forecast.dateTime];
    dateString = [dateFormatter stringFromDate:date];
}

- (NSString*) time {
    if (forecast.dateTime > 0) {
        NSDate* date = [NSDate dateWithTimeIntervalSince1970: forecast.dateTime];
        dateString = [dateFormatter stringFromDate:date];
        return dateString;
    } else {
        return @"--:--";
    }
}

- (NSString *)temperature {
    if (forecast.temperatureF != 0.0f) {
        return [NSString stringWithFormat:@"%d°", (int)forecast.temperatureF];
    } else {
        return @"-°";
    }
}

-(NSString *)weatherDescription {
    if (forecast.weatherDescription.length > 0) {
        return forecast.weatherDescription;
    } else {
        return @"---";
    }
}

- (NSURL*) iconUrl {
    if (forecast.icon) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://openweathermap.org/img/w/%@.png", forecast.icon]];
        return url;
    } else {
        return nil;
    }
}
@end
