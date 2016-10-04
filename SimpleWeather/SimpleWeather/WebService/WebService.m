//
//  WebService.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "WebService.h"

@implementation WebService

- (void) getResource: (Resource*) resource completion: (void (^)(Result* result)) completionBlock {
    id task = [[NSURLSession sharedSession] dataTaskWithURL:resource.url
                                          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                              
                                              [[NetworkActivityIndicatorManager sharedManager] endActivity];

                                              if (data) {
                                                  id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
                                                  if (!json) {
                                                      completionBlock([[Result alloc] initWithError:error]);
                                                  } else {
                                                      id resultData = resource.parse(json);
                                                      completionBlock([[Result alloc] initWithResultObject:resultData]);
                                                  }
                                              } else {
                                              completionBlock([[Result alloc] initWithError: error]);
                                            }
        
    }];
    
    [[NetworkActivityIndicatorManager sharedManager] startActivity];
    [task resume];

}


@end
