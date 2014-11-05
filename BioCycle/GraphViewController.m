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
    NSDateFormatter *formatter;
}

@synthesize plot, plot2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd.MM"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self processDate:AppDelegate.instance.currentDate];
    [plot removeAllPlots];
    KPLinePlot *ph = [[KPLinePlot alloc] initWithIdentifier:@"ph" andDelegate:self];
    [ph setPlotColor:[UIColor orangeColor]];
    [ph setLineWidth:1.f];
    [ph setShowLabels:NO];
    [plot addPlot:ph animated:YES];
    
    KPLinePlot *em = [[KPLinePlot alloc] initWithIdentifier:@"em" andDelegate:self];
    [em setPlotColor:[UIColor magentaColor]];
    [em setLineWidth:2.f];
    [em setShowLabels:NO];
    [plot addPlot:em animated:YES];
    
    KPLinePlot *it = [[KPLinePlot alloc] initWithIdentifier:@"it" andDelegate:self];
    [it setPlotColor:[UIColor greenColor]];
    [it setLineWidth:3.f];
    [it setShowLabels:NO];
    [plot addPlot:it animated:YES];
    
    KPLinePlot *ms = [[KPLinePlot alloc] initWithIdentifier:@"ms" andDelegate:self];
    [ms setPlotColor:[UIColor blueColor]];
    [ms setLineWidth:4.f];
    [ms setShowLabels:NO];
    [plot addPlot:ms animated:YES];
    
    KPXAxis *xaxis = [[KPXAxis alloc] initWithIdentifier:@"x" andDelegate:self];
    xaxis.drawGrid = YES;
    xaxis.gridStep = 1.f;
    xaxis.axisColor = [UIColor whiteColor];
    [plot setXAxis:xaxis];

    [plot setPlotBounds:CGRectMake(-0.5f, -1.2, 7.f, 2.4f)];
    
    
    [plot2 removeAllPlots];
    KPLinePlot *ph2 = [[KPLinePlot alloc] initWithIdentifier:@"ph2" andDelegate:self];
    [ph2 setPlotColor:[UIColor orangeColor]];
    [ph2 setLineWidth:1.f];
    [ph2 setShowLabels:NO];
    [plot2 addPlot:ph2 animated:YES];
    
    KPLinePlot *em2 = [[KPLinePlot alloc] initWithIdentifier:@"em2" andDelegate:self];
    [em2 setPlotColor:[UIColor magentaColor]];
    [em2 setLineWidth:2.f];
    [em2 setShowLabels:NO];
    [plot2 addPlot:em2 animated:YES];
    
    KPLinePlot *it2 = [[KPLinePlot alloc] initWithIdentifier:@"it2" andDelegate:self];
    [it2 setPlotColor:[UIColor greenColor]];
    [it2 setLineWidth:3.f];
    [it2 setShowLabels:NO];
    [plot2 addPlot:it2 animated:YES];
    
    KPLinePlot *ms2 = [[KPLinePlot alloc] initWithIdentifier:@"ms2" andDelegate:self];
    [ms2 setPlotColor:[UIColor blueColor]];
    [ms2 setLineWidth:4.f];
    [ms2 setShowLabels:NO];
    [plot2 addPlot:ms2 animated:YES];
    
    KPXAxis *xaxis2 = [[KPXAxis alloc] initWithIdentifier:@"x2" andDelegate:self];
    xaxis2.drawGrid = YES;
    xaxis2.gridStep = 1.f;
    xaxis2.axisColor = [UIColor whiteColor];
    [plot2 setXAxis:xaxis2];
    
    [plot2 setPlotBounds:CGRectMake(-2.5f, -1.2, 34.f, 2.4f)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KPAxisDelegate

-(CGFloat)axisMaximumFor:(KPXAxis *)axis
{
    if([axis.identifier isEqualToString:@"x"])
        return 6.f;
    else
        return 29.f;
}

-(CGFloat)axisMinumumFor:(KPXAxis *)axis
{
    return 0.f;
}

-(KPLabel*)labelForAxis:(KPXAxis *)axis point:(NSInteger)point
{
    KPLabel *l = [KPLabel new];
    l.textColor = [UIColor whiteColor];
    l.textFont = [UIFont systemFontOfSize:10.f];
    if([axis.identifier isEqualToString:@"x"]) {
        NSDate *d = [[NSDate date] dateByAddingTimeInterval:point*24*60*60];
        l.text = [formatter stringFromDate:d];
        return l;
    } else {
        if(!(point % 4)) {
            NSDate *d = [[NSDate date] dateByAddingTimeInterval:point*24*60*60];
            l.text = [formatter stringFromDate:d];
        }
        return l;
    }
}

#pragma mark - KPPlotDelegate

-(CGFloat)plot:(id<KPPlot>)_plot value:(KPPlotPoint)value forPoint:(NSInteger)point
{
    if([_plot.identifier hasPrefix:@"ph"]) {
        return [self physForDay:point];
    } else if([_plot.identifier hasPrefix:@"em"]) {
        return [self emotForDay:point];
    } else if([_plot.identifier hasPrefix:@"it"]) {
        return [self intelForDay:point];
    } else if([_plot.identifier hasPrefix:@"ms"]) {
        return [self mystForDay:point];
    } else {
        return 0.f;
    }
}

-(NSInteger)numberOfPointsForPlot:(id<KPPlot>)_plot
{
    if([_plot.identifier hasSuffix:@"2"])
        return 30;
    else
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
