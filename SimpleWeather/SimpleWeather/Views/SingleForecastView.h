//
//  CityForecastViewModel.h
//  SimpleWeather
//
//  Created by Arek on 21.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleForecastViewModel.h"
#import "Colors.h"
#import "AsyncImageView.h"

@interface SingleForecastView : UICollectionViewCell<DataChangedObserver>

@property (nonatomic, strong) UILabel* time;
@property (nonatomic, strong) UILabel* temperature;
@property (nonatomic, strong) UILabel* weatherDescription;
@property (nonatomic, strong) AsyncImageView* icon;


- (void) setViewModel: (SingleForecastViewModel*) vm;

@end
