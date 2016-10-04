//
//  Result.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "Result.h"

@implementation Result

- (id) initWithResultObject:(id)resultObject {
    self = [super init];
    if (self) {
        self.resultObject = resultObject;
    }
    return self;
}

- (id) initWithError: (NSError*) error {
    self = [super init];
    if (self) {
        self.error = error;
    }
    return self;
}

@end
