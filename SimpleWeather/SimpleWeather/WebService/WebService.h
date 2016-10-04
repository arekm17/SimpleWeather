//
//  WebService.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resource.h"
#import "Result.h"
#import "NetworkActivityIndicatorManager.h"

@interface WebService : NSObject

- (void) getResource: (Resource*) resource completion: (void (^)(Result* result)) completionBlock;

@end
