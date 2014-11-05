//
//  KPXAxis.h
//  KorePlot
//
//  Created by Василий Макаров on 27.06.14.
//  Copyright (c) 2014 Trilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPLabel.h"

@class KPXAxis;

@protocol KPAxisDelegate <NSObject>

-(CGFloat)axisMinumumFor:(KPXAxis*)axis;
-(CGFloat)axisMaximumFor:(KPXAxis*)axis;

@optional
-(KPLabel*)labelForAxis:(KPXAxis*)axis point:(NSInteger)point;

@end

@interface KPXAxis : NSObject

@property (nonatomic, weak) id<KPAxisDelegate> axisDelegate;
@property (nonatomic, readonly) NSString* identifier;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, strong) UIColor *axisColor;
@property (nonatomic, assign) BOOL drawGrid;
@property (nonatomic, assign) CGFloat gridStep;

-(id)initWithIdentifier:(NSString*)identifier andDelegate:(id<KPAxisDelegate>)delegate;
-(void)drawInContext:(CGContextRef)ctx withXScale:(CGFloat)xscale andYScale:(CGFloat)yscale;
-(void)drawLabelsInContext:(CGContextRef)ctx withXScale:(CGFloat)xscale andYScale:(CGFloat)yscale;
-(void)drawGridInContext:(CGContextRef)ctx withXScale:(CGFloat)xscale andYScale:(CGFloat)yscale;
-(void)reloadData;

@end
