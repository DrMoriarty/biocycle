//
//  KPBarPlot.h
//  KorePlot
//
//  Created by Василий Макаров on 23.05.14.
//  Copyright (c) 2014 Trilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPPlot.h"

@interface KPBarPlot : NSObject <KPPlot>

@property (nonatomic, assign) CGFloat barWidth;

-(id)initWithIdentifier:(NSString*)identifier andDelegate:(id<KPPlotDelegate>)delegate;

@end
