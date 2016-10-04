//
//  MainFlowController.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "MainFlowController.h"


@implementation MainFlowController

@synthesize rootNavigation;
@synthesize rootController;

- (id) init {
    
    self = [super init];
    if (self) {
        rootNavigation = [UINavigationController new];
        
        id citiesVm = [CitiesViewModel createFromSettings];
        rootController = [[CitiesViewController alloc] initWithViewModel:citiesVm];
        
        [rootNavigation addChildViewController:rootController];
    }
    
    return self;
}

@end