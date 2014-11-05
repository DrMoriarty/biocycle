//
//  KPPlotView.h
//  KorePlot
//
//  Created by Василий Макаров on 22.05.14.
//  Copyright (c) 2014 Trilan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPPlot.h"
#import "KPXAxis.h"

@interface KPPlotView : UIView

@property (nonatomic, assign) CGRect plotBounds;
@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, assign) CGPoint contentOffset;
@property (nonatomic, assign) BOOL scrollEnabled, centerPlot;
@property (nonatomic, retain) KPXAxis *xAxis;

-(void)addPlot:(id<KPPlot>)plot animated:(BOOL)animated;
-(void)removePlot:(id<KPPlot>)plot;
-(void)removeAllPlots;
-(void)redraw;

@end
