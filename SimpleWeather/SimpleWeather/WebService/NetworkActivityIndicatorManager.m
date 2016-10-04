//
//  NetworkActivityIndicatorManager.m
//  SimpleWeather
//
//  Created by Arek on 03.10.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "NetworkActivityIndicatorManager.h"

@interface NetworkActivityIndicatorManager()

@property (nonatomic) NSInteger tasks;
@property (strong, nonatomic) UIApplication* application;

@end

@implementation NetworkActivityIndicatorManager


+ (NetworkActivityIndicatorManager*) sharedManager {
    static NetworkActivityIndicatorManager* sharedInstance = nil;
    
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(NetworkActivityIndicatorManager*) init {
    self = [super init];
    if (self) {
        self.tasks = 0;
    }
    return self;
}

- (void) startActivity {
    @synchronized (self) {
        if (self.application.isStatusBarHidden) {
            return;
        }
        if (!self.application.isNetworkActivityIndicatorVisible) {
            self.application.networkActivityIndicatorVisible = YES;
            self.tasks = 0;
        }
        self.tasks++;
    }
}

- (void) endActivity {
    @synchronized (self) {
        if (self.application.isStatusBarHidden) {
            return;
        }
        self.tasks--;
        
        if (self.tasks <= 0) {
            self.application.networkActivityIndicatorVisible = NO;
            self.tasks = 0;
        }
    }
}

- (void) forceEndActivity {
    @synchronized (self) {
        if (self.application.isStatusBarHidden) {
            return;
        }
        
        self.application.networkActivityIndicatorVisible = NO;
        self.tasks = 0;
    }
}

-(UIApplication*) application {
    if (!_application) {
        _application = [UIApplication sharedApplication];
    }
    return _application;
}


@end
