//
//  SecondViewController.m
//  BioCycle
//
//  Created by Vasiliy Makarov on 02.11.14.
//  Copyright (c) 2014 Vasiliy Makarov. All rights reserved.
//

#import "GraphViewController.h"
#import "AppDelegate.h"

const CGFloat PhysInt = 22 * 24*60*60;
const CGFloat EmotInt = 27 * 24*60*60;
const CGFloat IntlInt = 32 * 24*60*60;
const CGFloat MystInt = 37 * 24*60*60;

@interface GraphViewController ()

@end

@implementation GraphViewController {
    CGFloat phOffset;
    CGFloat emOffset;
    CGFloat itOffset;
    CGFloat msOffset;
}

@synthesize plot;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self processDate:AppDelegate.instance.currentDate];
    [plot removeAllPlots];
    KPLinePlot *ph = [[KPLinePlot alloc] initWithIdentifier:@"ph" andDelegate:self];
    [ph setPlotColor:[UIColor orangeColor]];
    [ph setLineWidth:1.5f];
    [plot addPlot:ph animated:YES];
    
    KPLinePlot *em = [[KPLinePlot alloc] initWithIdentifier:@"em" andDelegate:self];
    [em setPlotColor:[UIColor purpleColor]];
    [em setLineWidth:2.f];
    [plot addPlot:em animated:YES];
    
    KPLinePlot *it = [[KPLinePlot alloc] initWithIdentifier:@"it" andDelegate:self];
    [it setPlotColor:[UIColor greenColor]];
    [it setLineWidth:2.5f];
    [plot addPlot:it animated:YES];
    
    KPLinePlot *ms = [[KPLinePlot alloc] initWithIdentifier:@"ms" andDelegate:self];
    [ms setPlotColor:[UIColor blueColor]];
    [ms setLineWidth:3.f];
    [plot addPlot:ms animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KPPlotDelegate

-(CGFloat)plot:(id<KPPlot>)_plot value:(KPPlotPoint)value forPoint:(NSInteger)point
{
    if([_plot.identifier isEqualToString:@"ph"]) {
        return [self physForDay:point];
    } else if([_plot.identifier isEqualToString:@"em"]) {
        return [self emotForDay:point];
    } else if([_plot.identifier isEqualToString:@"it"]) {
        return [self intelForDay:point];
    } else if([_plot.identifier isEqualToString:@"ms"]) {
        return [self mystForDay:point];
    } else {
        return 0.f;
    }
}

-(NSInteger)numberOfPointsForPlot:(id<KPPlot>)plot
{
    return 7;
}

-(void)processDate:(NSDate*)date
{
    if(!date) return;
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:date];
    phOffset = (interval - (int)(interval/PhysInt)*PhysInt);
    emOffset = (interval - (int)(interval/EmotInt)*EmotInt);
    itOffset = (interval - (int)(interval/IntlInt)*IntlInt);
    msOffset = (interval - (int)(interval/MystInt)*MystInt);
}

-(CGFloat)physForDay:(NSInteger)day
{
    CGFloat ph = (phOffset + day*24*60*60) / PhysInt;
    return sin(ph * M_PI * 2.f);
}

-(CGFloat)emotForDay:(NSInteger)day
{
    CGFloat em = (emOffset + day*24*60*60) / EmotInt;
    return sin(em * M_PI * 2.f);
}

-(CGFloat)intelForDay:(NSInteger)day
{
    CGFloat it = (itOffset + day*24*60*60) / IntlInt;
    return sin(it * M_PI * 2.f);
}

-(CGFloat)mystForDay:(NSInteger)day
{
    CGFloat ms = (msOffset + day*24*60*60) / MystInt;
    return sin(ms * M_PI * 2.f);
}

@end
