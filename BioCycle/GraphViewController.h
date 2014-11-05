//
//  SecondViewController.h
//  BioCycle
//
//  Created by Vasiliy Makarov on 02.11.14.
//  Copyright (c) 2014 Vasiliy Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KorePlot/KorePlot.h>

@interface GraphViewController : UIViewController <KPPlotDelegate, KPAxisDelegate>

@property (nonatomic, strong) IBOutlet KPPlotView* plot;
@property (nonatomic, strong) IBOutlet KPPlotView* plot2;

@end

