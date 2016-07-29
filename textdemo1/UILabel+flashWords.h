//
//  UILabel+flashWords.h
//  textdemo1
//
//  Created by lele on 16/7/27.
//  Copyright © 2016年 tianyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (flashWords)

@property (nonatomic, assign) BOOL didBeganFlash;
@property (nonatomic, strong) dispatch_source_t timer;

- (void)flashWithText:(NSString *)text sender:(id)sender;

- (void)flashWithAttributedText:(NSAttributedString *)attributedText sender:(id)sender;

@end
