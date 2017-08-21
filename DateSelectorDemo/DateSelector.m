//
//  DateSelector.m
//  DateSelectorDemo
//
//  Created by Ethan on 2017/8/22.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "DateSelector.h"

@interface DateSelector ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, assign) CGRect initialFrame;

@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation DateSelector

-(instancetype)initWithFrame:(CGRect)frame date:(NSString *)date minDate:(NSString *)minDate selectedDate:(void (^)(NSString *))selectedDate{
    self.date = date;
    self.minimumDate = minDate;
    self.selectedDate = selectedDate;
    return [self initWithFrame:frame];
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    _initialFrame = CGRectMake(frame.origin.x, kSCREEN_HEIGHT, frame.size.width, frame.size.height);
    self = [super initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    if (self) {
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [self addGestureRecognizer:singleTap];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [self customView:frame];
    }
    return self;
}

-(void)customView:(CGRect)frame {

    self.view.frame = CGRectMake(frame.origin.x, kSCREEN_HEIGHT, frame.size.width, frame.size.height);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = frame;
    }];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 40)];
    //        view.alpha = 1.f;
    view.backgroundColor = [UIColor redColor];
    UIButton *tureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tureButton.frame = CGRectMake(kSCREEN_WIDTH - 70, 10, 50, 20);
    //        tureButton.layer.cornerRadius = 5.0;
    //        tureButton.clipsToBounds = YES;
    [tureButton setTitle:@"完成" forState:UIControlStateNormal];
    [tureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tureButton addTarget:self action:@selector(tureBtClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:tureButton];
    
    UIButton *cancelBt = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBt.frame = CGRectMake(20, 10, 50, 20);
    //        cancelBt.layer.cornerRadius = 5.0;
    //        cancelBt.clipsToBounds = YES;
    [cancelBt setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBt addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cancelBt];
    
    [self.view addSubview:view];

    self.datePicker.frame = CGRectMake(0, 40, frame.size.width, frame.size.height-40);
   
    [self.view addSubview:self.datePicker];
}

-(void)singleTap:(UITapGestureRecognizer *)tgr {
    [self remove];
}

- (void)tureBtClick:(UIButton *)button {
    if (self.selectedDate) {
        self.selectedDate([self.formatter stringFromDate:self.datePicker.date]);
    }
    [self remove];
}

- (void)cancelClick:(UIButton *)button {
    [self remove];
}

-(void)remove {
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = self.initialFrame;
    }completion:^(BOOL finished) {
        self.selectedDate = nil;
        [self removeFromSuperview];
    }];
}

- (void)dateChange:(id)datePicker {
    
}

#pragma mark - setter、getter
- (void)setSelectDate:(NSString *)selectDate {
    [_datePicker setDate:[self.formatter dateFromString:selectDate] animated:YES];
}

-(UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor whiteColor];
        [self addSubview:_view];
    }
    return _view;
}
-(UIDatePicker *)datePicker {
    
    if (!_datePicker) {
        _datePicker =  [[UIDatePicker alloc] init];
        _datePicker.backgroundColor = [UIColor whiteColor];
        [_datePicker setDate:[NSDate date] animated:YES];
        [_datePicker setMaximumDate:[NSDate date]];
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        [_datePicker setMinimumDate:[self.formatter dateFromString:@"1900-01-01"]];
        [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}
-(void)setDate:(NSString *)date {
    if (date.length == 10) {
        _date = date;
        [self.datePicker setDate:[self.formatter dateFromString:_date]];
    }
}


-(void)setMinimumDate:(NSString *)minimumDate {
    
    if (minimumDate.length == 10) {
        _minimumDate = minimumDate;
        [self.datePicker setMinimumDate:[self.formatter dateFromString:_minimumDate]];
    }
}

-(void)setMaximumDate:(NSString *)maximumDate {
    if (maximumDate.length == 10) {
        _maximumDate = maximumDate;
        [self.datePicker setMaximumDate:[self.formatter dateFromString:maximumDate]];
    }
}

- (NSDateFormatter *)formatter {
    
    if (!_formatter) {
        _formatter =[[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"yyyy-MM-dd"];
    }
    return _formatter;
}


@end
