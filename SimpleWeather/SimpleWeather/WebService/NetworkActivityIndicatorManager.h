//
//  NetworkActivityIndicatorManager.h
//  SimpleWeather
//
//  Created by Arek on 03.10.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkActivityIndicatorManager : NSObject

+ (NetworkActivityIndicatorManager*) sharedManager;

- (void) startActivity;

- (void) endActivity;

- (void) forceEndActivity;

@end
