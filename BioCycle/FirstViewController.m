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
    
    if(ph > 0) {
        [physics setTintColor:[UIColor greenColor]];
        [physics setProgress:ph];
    } else {
        [physics setTintColor:[UIColor redColor]];
        [physics setProgress:-ph];
    }
    if(em > 0) {
        [emotions setTintColor:[UIColor greenColor]];
        [emotions setProgress:em];
    } else {
        [emotions setTintColor:[UIColor redColor]];
        [emotions setProgress:-em];
    }
    if(it > 0) {
        [intelligence setTintColor:[UIColor greenColor]];
        [intelligence setProgress:it];
    } else {
        [intelligence setTintColor:[UIColor redColor]];
        [intelligence setProgress:-it];
    }
    if(ms > 0) {
        [mystical setTintColor:[UIColor greenColor]];
        [mystical setProgress:ms];
    } else {
        [mystical setTintColor:[UIColor redColor]];
        [mystical setProgress:-ms];
    }
}

@end
