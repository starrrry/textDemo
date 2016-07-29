    //
//  UILabel+flashWords.m
//  textdemo1
//
//  Created by lele on 16/7/27.
//  Copyright © 2016年 tianyu. All rights reserved.
//

#import "UILabel+flashWords.h"
#import <objc/runtime.h>
static const void *didBeganFlashNameKey = &didBeganFlashNameKey;
static const void *timerNameKey = &timerNameKey;

@implementation UILabel (flashWords)
@dynamic didBeganFlash;
@dynamic timer;

- (void)flashWithText:(NSString *)text sender:(id)sender {
    if (!self.timer) {
        //self.timer不存在则初始化
        self.didBeganFlash = YES;
        self.attributedText = nil;
        NSTimeInterval period = .005; //设置时间间隔
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= text.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.text.length < text.length) {
                    self.text = [text substringToIndex:self.text.length+1];
                }
            });
        });
        
        dispatch_resume(self.timer);
        return;
    }
    if (self.didBeganFlash) {
        //有timer正在运行并且没有结束，则cancel当前timer
        dispatch_source_cancel(self.timer);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        self.didBeganFlash = YES;
        self.attributedText = nil;
        
        NSTimeInterval period = .005; //设置时间间隔
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= text.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.text.length < text.length) {
                    self.text = [text substringToIndex:self.text.length+1];
                }
            });
            
        });
        
        dispatch_resume(self.timer);
    } else {
        self.didBeganFlash = YES;
        dispatch_source_cancel(self.timer);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        self.attributedText = nil;
        
        NSTimeInterval period = .005; //设置时间间隔
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= text.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.text.length < text.length) {
                    self.text = [text substringToIndex:self.text.length+1];
                }
            });
            
        });
        
        dispatch_resume(self.timer);
    }

}

- (void)flashWithAttributedText:(NSAttributedString *)attributedText sender:(id)sender {
    if (!self.timer) {
        //self.timer不存在则初始化
        self.didBeganFlash = YES;
        self.attributedText = nil;
        NSTimeInterval period = .01; //设置时间间隔
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= attributedText.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.attributedText.length < attributedText.length) {
                    self.attributedText = [attributedText attributedSubstringFromRange:NSMakeRange(0, self.attributedText.length+1)];
                }
            });
        });
        
        dispatch_resume(self.timer);
        return;
    }
    if (self.didBeganFlash) {
        //有timer正在运行并且没有结束，则cancel当前timer
        dispatch_source_cancel(self.timer);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        self.didBeganFlash = YES;
        self.attributedText = nil;
        
        NSTimeInterval period = .01; //设置时间间隔
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= attributedText.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.attributedText.length < attributedText.length) {
                    self.attributedText = [attributedText attributedSubstringFromRange:NSMakeRange(0, self.attributedText.length+1)];
                }
            });
            
        });
        
        dispatch_resume(self.timer);
    } else {
        self.didBeganFlash = YES;
        dispatch_source_cancel(self.timer);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        self.attributedText = nil;
        
        NSTimeInterval period = .01; //设置时间间隔
        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(self.timer, ^{
            NSUInteger length = self.text.length+1;
            if (length >= attributedText.length) {
                self.didBeganFlash=NO;
                dispatch_source_cancel(self.timer);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (self.attributedText.length < attributedText.length) {
                    self.attributedText = [attributedText attributedSubstringFromRange:NSMakeRange(0, self.attributedText.length+1)];
                }
            });
            
        });
        
        dispatch_resume(self.timer);
    }
}

- (void)setTimer:(dispatch_source_t)timer {
    objc_setAssociatedObject(self, timerNameKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)timer {
    return objc_getAssociatedObject(self, timerNameKey);
}

- (void)setDidBeganFlash:(BOOL)didBeganFlash {
    objc_setAssociatedObject(self, didBeganFlashNameKey, [NSNumber numberWithBool:didBeganFlash], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)didBeganFlash {
    return objc_getAssociatedObject(self, didBeganFlashNameKey);
}

@end
