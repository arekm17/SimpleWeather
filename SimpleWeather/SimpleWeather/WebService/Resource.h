//
//  Resource.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FORECAST_SERVICE_URL_BASE @"http://api.openweathermap.org/"

@interface Resource : NSObject

@property (strong, nonatomic) NSURL* url;
@property (copy, nonatomic) id (^parse)(NSArray*);

- (id) initWithUrlParams: (NSString*) urlParams parseMethod: (id (^)(NSArray* data)) parseMethod;


@end
