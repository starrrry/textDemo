//
//  ViewController.m
//  textdemo1
//
//  Created by lele on 16/7/27.
//  Copyright © 2016年 tianyu. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+flashWords.h"
#import "VerticallyAlignedLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VerticallyAlignedLabel *label = [VerticallyAlignedLabel new];
    label.verticalAlignment=0;
    label.frame = CGRectMake(0, 100, 300, 400);
    label.numberOfLines = 7;
    [self.view addSubview:label];
    label.font=[UIFont systemFontOfSize:10];
    
    VerticallyAlignedLabel *label1 = [VerticallyAlignedLabel new];
    label1.verticalAlignment=0;
    label1.frame = CGRectMake(0, 500, 300, 400);
    label1.numberOfLines = 7;
    [self.view addSubview:label1];
    label1.font=[UIFont systemFontOfSize:10];
    
    [label flashWithAttributedText:[[NSAttributedString alloc] initWithString:@"一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊"] sender:self];
    [label1 flashWithText:@"一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊一个两个啊" sender:self];
}


@end
