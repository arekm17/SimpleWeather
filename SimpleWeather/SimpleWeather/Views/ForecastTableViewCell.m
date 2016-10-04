//
//  ForecastTableViewCell.m
//  SimpleWeather
//
//  Created by Arek on 20.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "ForecastTableViewCell.h"

static NSString *CellIdentifier = @"SingleForecastCell";

@implementation ForecastTableViewCell {
    CityForecastViewModel* viewModel;
    ForecastCollectionViewDataSource* dataSource;
    ForecastCollectionViewDelegate* delegateLayout;
}


@synthesize cityLabel;
@synthesize forecastCollection;


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void) setViewModel: (CityForecastViewModel*) vm {
    viewModel = vm;
    viewModel.observer = self;
    [self update];
}

- (void) onDataChanged {
    [self update];
}

- (void) update {

    cityLabel.text = viewModel.cityName;

    dataSource = [[ForecastCollectionViewDataSource alloc] initWithCollectionView:forecastCollection viewModel:viewModel];
    forecastCollection.dataSource = dataSource;

}

- (void) setupView {
    [self initControls];
    [self initAutolayout];
}

- (void) initControls {
    self.contentView.backgroundColor = MAIN_BG_COLOR;
    
    cityLabel = [[UILabel alloc] init];
    cityLabel.textColor = MAIN_TEXT_COLOR;
    [self.contentView addSubview:cityLabel];

    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    forecastCollection = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:layout];
    [forecastCollection registerClass:[SingleForecastView class] forCellWithReuseIdentifier:CellIdentifier];
    forecastCollection.backgroundColor = MAIN_BG_COLOR;
    [self.contentView addSubview:forecastCollection];
    
    delegateLayout = [ForecastCollectionViewDelegate new];
    forecastCollection.delegate = delegateLayout;
}

- (void) initAutolayout {
    NSDictionary* views = @{@"cityLabel" : cityLabel,
                            @"forecastCollection" : forecastCollection
                            };
    
    cityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    forecastCollection.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray* constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[cityLabel]-|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:constraint];
    
    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[cityLabel]-[forecastCollection(70)]-0-|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:constraint];

    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[forecastCollection]-0-|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:constraint];

}

+(CGFloat) cellHeight {
    return 110.;
}

@end


@implementation ForecastCollectionViewDataSource {
    CityForecastViewModel* viewModel;
    UICollectionView* collectionView;
}

- (id) initWithCollectionView:(UICollectionView*) cv viewModel: (CityForecastViewModel*) vm {
    self = [super init];
    if (self != nil) {
        viewModel = vm;
        collectionView = cv;
        collectionView.dataSource = self;
        [collectionView reloadData];
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return viewModel.getForecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SingleForecastView* cell = [cv dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    id vm = [viewModel getForecastVmForIndex: indexPath.row];
    
    [cell setViewModel:vm];

    return cell;
}


@end

@implementation ForecastCollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(76, 64);

}
@end