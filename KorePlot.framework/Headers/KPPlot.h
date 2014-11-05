//
//  KPPlot.h
//  KorePlot
//
//  Created by Василий Макаров on 23.05.14.
//  Copyright (c) 2014 Trilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPLabel.h"

typedef enum {KPPlotPointX = 0, KPPlotPointY, KPPlotPointMin, KPPlotPointMax} KPPlotPoint;

@protocol KPPlot;

/*
 *   KPPlotDelegate
 */

@protocol KPPlotDelegate <NSObject>

-(NSInteger)numberOfPointsForPlot:(id<KPPlot>)plot;
-(CGFloat)plot:(id<KPPlot>)plot value:(KPPlotPoint)value forPoint:(NSInteger)point;

@optional
-(KPLabel*)labelForPlot:(id<KPPlot>)plot value:(KPPlotPoint)value point:(NSInteger)point;

@end

/*
 *   KPPlot
 */

@protocol KPPlot <NSObject>

@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, weak) id<KPPlotDelegate> plotDelegate;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, readonly) CGRect plotBounds;
@property (nonatomic, assign) BOOL showLabels;
@property (nonatomic, strong) UIColor *plotColor;

-(void)drawInContext:(CGContextRef)ctx withXScale:(CGFloat)xscale andYScale:(CGFloat)yscale;
-(void)drawLabelsInContext:(CGContextRef)ctx withXScale:(CGFloat)xscale andYScale:(CGFloat)yscale;

@optional
-(BOOL)update:(CGFloat)dt;
-(void)startAnimationWithDelay:(CGFloat)delay;
-(void)reloadData;

@end
