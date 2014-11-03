//
//  FirstViewController.m
//  BioCycle
//
//  Created by Vasiliy Makarov on 02.11.14.
//  Copyright (c) 2014 Vasiliy Makarov. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize physics, emotions, intelligence, mystical, datePicker, today;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDate *dd = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultDate"];
    if(dd) {
        [datePicker setDate:dd];
        [self processDate:dd];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)selectDate:(UIDatePicker*)sender
{
    [self processDate:sender.date];
    [[NSUserDefaults standardUserDefaults] setObject:sender.date forKey:@"defaultDate"];
}

-(void)processDate:(NSDate*)date
{
    NSDate *now = [NSDate date];
    today.text = [now description];
    NSTimeInterval interval = [now timeIntervalSinceDate:date];
    const CGFloat PhysInt = 22 * 24*60*60;
    const CGFloat EmotInt = 27 * 24*60*60;
    const CGFloat IntlInt = 32 * 24*60*60;
    const CGFloat MystInt = 37 * 24*60*60;
    CGFloat ph = (interval - (int)(interval/PhysInt)*PhysInt) / PhysInt;
    CGFloat em = (interval - (int)(interval/EmotInt)*EmotInt) / EmotInt;
    CGFloat it = (interval - (int)(interval/IntlInt)*IntlInt) / IntlInt;
    CGFloat ms = (interval - (int)(interval/MystInt)*MystInt) / MystInt;
    ph = sin(ph * M_PI * 2.f);
    em = sin(em * M_PI * 2.f);
    it = sin(it * M_PI * 2.f);
    ms = sin(ms * M_PI * 2.f);
    
    /*
    NSLog(@"Physical state: %f", ph);
    NSLog(@"Emotional state: %f", em);
    NSLog(@"Intelligent state: %f", it);
    NSLog(@"Mystical state: %f", ms);
     */

    [self updateProgress:physics toValue:ph];
    [self updateProgress:emotions toValue:em];
    [self updateProgress:intelligence toValue:it];
    [self updateProgress:mystical toValue:ms];
}

-(void)updateProgress:(UIProgressView*)progress toValue:(CGFloat)value
{
    if(value > 0) {
        if(NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
            [progress setTintColor:[UIColor greenColor]];
        } else {
            [progress setProgressTintColor:[UIColor greenColor]];
        }
        [progress setProgress:value];
    } else {
        if(NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
            [progress setTintColor:[UIColor redColor]];
        } else {
            [progress setProgressTintColor:[UIColor redColor]];
        }
        [progress setProgress:-value];
    }
}

@end
