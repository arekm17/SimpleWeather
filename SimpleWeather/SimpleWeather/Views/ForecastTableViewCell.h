//
//  ForecastTableViewCell.h
//  SimpleWeather
//
//  Created by Arek on 20.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityForecastViewModel.h"
#import "SingleForecastView.h"
#import "SingleForecastViewModel.h"
#import "Colors.h"

@interface ForecastTableViewCell : UITableViewCell<DataChangedObserver>

@property (strong, nonatomic) UILabel* cityLabel;
@property (strong, nonatomic) UICollectionView* forecastCollection;


+ (CGFloat) cellHeight;
- (void) setViewModel: (CityForecastViewModel*) vm;

@end


@interface ForecastCollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (id) initWithCollectionView:(UICollectionView*) cv viewModel: (CityForecastViewModel*) vm;

@end

@interface ForecastCollectionViewDelegate : NSObject<UICollectionViewDelegateFlowLayout>


@end
