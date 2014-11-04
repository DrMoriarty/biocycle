//
//  FirstViewController.h
//  BioCycle
//
//  Created by Vasiliy Makarov on 02.11.14.
//  Copyright (c) 2014 Vasiliy Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIProgressView *physics;
@property (nonatomic, strong) IBOutlet UIProgressView *emotions;
@property (nonatomic, strong) IBOutlet UIProgressView *intelligence;
@property (nonatomic, strong) IBOutlet UIProgressView *mystical;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) IBOutlet UILabel *today;

@end

