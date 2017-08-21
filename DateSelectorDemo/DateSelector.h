//
//  DateSelector.h
//  DateSelectorDemo
//
//  Created by Ethan on 2017/8/22.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DateSelector : UIView

//@property (nonatomic, weak) UIViewController *delegate;

/**
 最小日期  格式：1990-05-01 默认：1900-01-01
 */
@property (nonatomic, copy) NSString *minimumDate;


/**
 最大日期  格式：1990-05-01 默认当前日期
 */
@property (nonatomic, copy) NSString *maximumDate;
/**
 自动显示日期  格式：1990-05-01 默认为当前日期
 */
@property (nonatomic, copy) NSString *date;

/**
 选中日期回调
 */
@property (nonatomic, copy) void(^selectedDate)(NSString *dateStr);

-(instancetype)initWithFrame:(CGRect)frame date:(NSString *)date minDate:(NSString *)minDate selectedDate:(void(^)(NSString *date))selectedDate;

@end
