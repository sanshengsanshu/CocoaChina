//
//  TabScrollView.h
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//默认标记高度
#define kTagLineHeight 2
//默认标记颜色
#define kTagLineSelectColor [UIColor blueColor]
//默认加载首页
#define kTagDEF 0
//默认开启选择自动居中
#define kIsAutoCorrection false

typedef void(^TabClickBlack)(NSInteger index);
//滑动方向
typedef NS_ENUM(NSInteger, DirectionStyle) {
    horizontal = 0,
    vertical = 1
};
@interface TabScrollView : UIScrollView<UIScrollViewDelegate>

//装载视图数组
@property (nonatomic, strong) NSArray<UIView *> *viewArray;
//tab宽度
@property (nonatomic, assign) NSInteger tabWidth;
//tab高度
@property (nonatomic, assign) NSInteger tabHeight;
//tab标记
@property (nonatomic, strong) UIView *tagLine;
//滑动方向
@property DirectionStyle directionStyle;        
//位置下标
@property (nonatomic, assign) NSInteger tagIndex;
//
@property (nonatomic, strong) TabClickBlack clickBlock;

- (void)updateTagLine:(NSInteger)index;
- (void)configParameter:(DirectionStyle)directionStyle
              viewArray:(NSArray<UIView*> *)viewArray
               tabWidth:(NSInteger)tabWidth
              tabHeight:(NSInteger)tabHeight
                  tagIndex:(NSInteger)tagIndex
                  block:(TabClickBlack)clickBlock;

@end

NS_ASSUME_NONNULL_END
