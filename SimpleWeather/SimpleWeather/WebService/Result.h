//
//  Result.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (strong, nonatomic) id resultObject;
@property (strong, nonatomic) NSError* error;

- (id) initWithResultObject: (id) resultObject;
- (id) initWithError: (NSError*) error;

@end
