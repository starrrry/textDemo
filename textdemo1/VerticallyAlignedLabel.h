//
//  VerticallyAlignedLabel.h
//  YoLoBoo
//
//  Created by 丁娟 on 15/10/15.
//  Copyright © 2015年 zhengxingxia. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel
{
@private VerticalAlignment verticalAlignment_;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;
//- (id)initWithFrame:(CGRect)frame;

@end
