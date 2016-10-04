//
//  CitiesViewController.h
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CitiesViewModel.h"
#import "WebService.h"
#import "CityForecastModel.h"
#import "ForecastTableViewCell.h"
#import "CitiesForecastModel.h"
#import "Colors.h"


@interface CitiesViewController : UITableViewController<UITableViewDelegate>

@property (strong, nonatomic) CitiesViewModel* citiesViewModel;

- (id) initWithViewModel: (CitiesViewModel*) citiesVM;

@end


@interface NetworkDataSurce : NSObject<UITableViewDataSource>

@property (retain, nonatomic) UITableView* tableView;

- (id) initWithTableView: (UITableView*) tv viewModel:(CitiesViewModel* ) vm;
- (void) fetchAll;

@end

