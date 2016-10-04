//
//  Resource.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "Resource.h"

@implementation Resource


- (id) initWithUrlParams: (NSString*) urlParams parseMethod: (id (^)(NSArray* data)) parseMethod {
    self = [super init];
    if (self) {
        self.url = [NSURL URLWithString:[FORECAST_SERVICE_URL_BASE stringByAppendingString: urlParams]];
        self.parse = parseMethod;
    }
    return self;
}

@end
