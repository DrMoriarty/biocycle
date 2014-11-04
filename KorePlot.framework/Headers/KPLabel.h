//
//  KPLabelFormat.h
//  KorePlot
//
//  Created by Василий Макаров on 23.05.14.
//  Copyright (c) 2014 Trilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KPLabel : NSObject

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, assign) CGPoint offset;
@property (nonatomic, assign) CGFloat angle;

-(void)drawLabelInContext:(CGContextRef)ctx toPoint:(CGPoint)point;
-(CGRect)rectForPoint:(CGPoint)point;

@end
