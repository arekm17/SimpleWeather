//
//  SingleForecastView.m
//  SimpleWeather
//
//  Created by Arek on 21.09.2016.
//  Copyright © 2016 Arkadiusz Macudziński. All rights reserved.
//

#import "SingleForecastView.h"

@implementation SingleForecastView {
    SingleForecastViewModel* viewModel;
}

@synthesize time;
@synthesize temperature;
@synthesize weatherDescription;
@synthesize icon;


- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void) setupView {
    [self initControls];
    [self initAutolayout];
}

- (void) initControls {
    UIColor* textColor = MAIN_TEXT_COLOR;

    time = [UILabel new];
    time.textColor = textColor;
    time.font = [UIFont systemFontOfSize: 12];
    //    time.backgroundColor = [UIColor blueColor];

    temperature = [UILabel new];
    temperature.textColor = textColor;
    temperature.font = [UIFont systemFontOfSize: 12];
//    temperature.backgroundColor = [UIColor redColor];
    
    weatherDescription = [UILabel new];
    weatherDescription.textColor = textColor;
    weatherDescription.font = [UIFont systemFontOfSize: 10];

    icon = [AsyncImageView new];
    
//    icon.backgroundColor = [UIColor yellowColor];
    
    [self.subviews[0] removeFromSuperview];
    [self addSubview:time];
    [self addSubview:temperature];
    [self addSubview:weatherDescription];
    [self addSubview:icon];
    
//    self.backgroundColor = [UIColor blackColor];
}

- (void) initAutolayout {
    

    
    
    NSDictionary* views = @{@"time" : time,
                            @"temperature" : temperature,
                            @"description" : weatherDescription,
                            @"icon" : icon
                            };
    
    NSDictionary* metrics = @{@"leftPadding" : @16.f
                            };
    
    time.translatesAutoresizingMaskIntoConstraints = NO;
    temperature.translatesAutoresizingMaskIntoConstraints = NO;
    weatherDescription.translatesAutoresizingMaskIntoConstraints = NO;
    icon.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSArray* constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[time]-|" options:0 metrics:metrics views:views];
    [self addConstraints:constraint];

    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[icon(26)]-4-[temperature]-|" options:0 metrics:metrics views:views];
    [self addConstraints:constraint];

    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[description]-|" options:0 metrics:metrics views:views];
    [self addConstraints:constraint];

    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[time(12)]-4-[temperature(12)]->=0-|" options:0 metrics:nil views:views];
    [self addConstraints:constraint];

    constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[time(12)]-4-[icon(26)]-2-[description(10)]->=0-|" options:0 metrics:nil views:views];
    [self addConstraints:constraint];

}

- (void) setViewModel: (SingleForecastViewModel*) vm {
    viewModel = vm;
    [self updateData];
    viewModel.observer = self;
}

- (void) updateData {
    time.text = viewModel.time;
    temperature.text = viewModel.temperature;
    weatherDescription.text = viewModel.weatherDescription;
    
    id url = viewModel.iconUrl;
    if (url) {        
        [icon setImageURL: url];
    }
}

- (void) onDataChanged {
    [self updateData];
}

@end
