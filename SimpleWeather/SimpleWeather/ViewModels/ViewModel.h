//
//  ViewModel.h
//  SimpleWeather
//
//  Created by Arek on 22.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataChangedObserver <NSObject>

- (void) onDataChanged;

@end


@interface ViewModel : NSObject

@property (strong, nonatomic) NSObject<DataChangedObserver>* observer;

@end
