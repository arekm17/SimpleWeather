//
//  CitiesViewController.m
//  SimpleWeather
//
//  Created by Arek on 19.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "CitiesViewController.h"

static NSString *CellIdentifier = @"ForecastCell";

@implementation CitiesViewController {
    NetworkDataSurce* ds;
}

@synthesize citiesViewModel;

- (id) initWithViewModel: (CitiesViewModel*) citiesVM {
    self = [super init];

    if (self) {
        self.citiesViewModel = citiesVM;
        
        self.title = @"Miasta";
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MAIN_BG_COLOR;
    
    ds = [[NetworkDataSurce alloc] initWithTableView:self.tableView viewModel:self.citiesViewModel];
    self.tableView.dataSource = ds;
    self.tableView.delegate = self;
    [self.tableView setAllowsSelection:NO];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.f alpha:0.f];
    
    [ds fetchAll];
}

- (CGFloat) tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ForecastTableViewCell cellHeight];
}

@end


@implementation NetworkDataSurce {
    WebService* webService;
    CitiesViewModel* citiesViewModel;
}

- (id) initWithTableView: (UITableView*) tv viewModel:(CitiesViewModel* ) vm {
    self = [super init];
    if (self){
        webService = [WebService new];
        citiesViewModel = vm;
        
        self.tableView = tv;
        
        [self.tableView registerClass:[ForecastTableViewCell class] forCellReuseIdentifier:CellIdentifier];
        self.tableView.dataSource = self;
        [self update];
    }
    return self;
}

- (void) fetchAll {
    
    for (id cityId in citiesViewModel.cityIds) {
        [self fetchResource:[CityForecastModel forecastResourceForCityId:cityId]];
    }
    
}

- (void) fetchResource: (Resource*) resource {
    [webService getResource:resource completion:^(Result *result) {
        if (result.resultObject) {
            CityForecastModel* forecast = result.resultObject;
            
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [citiesViewModel setForecast:forecast];
                });
            });
            
        } else if (result.error) {
             NSLog(@"%@", result.error.localizedDescription);
        }
        
    }];

}

- (void) update {
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableViewtable {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [citiesViewModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForecastTableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setViewModel: [citiesViewModel getCityForecastViewModelForIndex: indexPath.row]];
    return cell;
}

@end