//
//  SingleForecastModel.h
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleForecastModel : NSObject

@property (assign, nonatomic) int dateTime;
@property (assign, nonatomic) float temperatureF;
@property (strong, nonatomic) NSString* weatherDescription;
@property (strong, nonatomic) NSString* icon;

+ (SingleForecastModel*) parse: (id) data;
+ (SingleForecastModel*) empty;


@end
