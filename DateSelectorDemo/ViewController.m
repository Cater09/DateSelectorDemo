//
//  ViewController.m
//  DateSelectorDemo
//
//  Created by Ethan on 2017/8/22.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "ViewController.h"
#import "DateSelector.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    
    [self.view.window addSubview:[[DateSelector alloc] initWithFrame:CGRectMake(0, kSCREEN_HEIGHT - 256, kSCREEN_WIDTH, 256) date:@"2017-08-22" minDate:@"2000-01-01" selectedDate:^(NSString *date) {
        self.dateLab.text = date;
        NSLog(@"%@",date);
    }]];
}

@end
