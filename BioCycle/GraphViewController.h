//
//  SecondViewController.h
//  BioCycle
//
//  Created by Vasiliy Makarov on 02.11.14.
//  Copyright (c) 2014 Vasiliy Makarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KorePlot/KorePlot.h>

@interface GraphViewController : UIViewController <KPPlotDelegate>

@property (nonatomic, strong) IBOutlet KPPlotView* plot;

@end

