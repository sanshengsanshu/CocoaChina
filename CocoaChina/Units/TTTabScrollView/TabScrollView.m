//
//  TabScrollView.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import "TabScrollView.h"

@implementation TabScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}
//初始化参数
- (void)initView {
    self.tagLine = [[UIView alloc] init];
    self.tagLine.backgroundColor = kTagLineSelectColor;
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}
- (void)configParameter:(DirectionStyle)directionStyle viewArray:(NSArray<UIView *> *)viewArray tabWidth:(NSInteger)tabWidth tabHeight:(NSInteger)tabHeight tagIndex:(NSInteger)tagIndex block:(TabClickBlack)clickBlock {
    _viewArray = viewArray;
    _tabWidth = tabWidth;
    _tabHeight = tabHeight;
    _directionStyle = directionStyle;
    _clickBlock = clickBlock;
    _tagIndex = tagIndex;
    
    if (_directionStyle == horizontal) {
        [self updateTag:tagIndex];
        [_viewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.frame = CGRectMake(idx * _tabWidth, 0, _tabWidth, _tabHeight);
            [self addSubview:obj];
            [self setListener:obj index:idx];
        }];
        [self addSubview:_tagLine];
        self.contentSize = CGSizeMake(_tabWidth * _viewArray.count, 0);
    }else {
        [self updateTag:tagIndex];
        [_viewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.frame = CGRectMake(0, idx * _tabHeight, _tabWidth, _tabHeight);
            [self addSubview:obj];
            [self setListener:obj index:idx];
        }];
        [self addSubview:_tagLine];
        self.contentSize = CGSizeMake(0, _tabHeight * _viewArray.count);
    }
    
}
- (void)setListener:(UIView *)view index:(NSInteger)index {
    view.tag = index;
    UITapGestureRecognizer *viewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuAction:)];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:viewGesture];
}
- (void)menuAction:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    UIView *view = (UIView *)tap.view;
    NSInteger index = view.tag;
    [self updateTagLine:index];
    if (_clickBlock) {
        _clickBlock(index);
    }
}
- (void)updateTagLine:(NSInteger)index {
    if (_tagIndex == index) {
        return;
    }
    if (kIsAutoCorrection) {
        [self autoTabOffset:index];
    }else {
        [self defaultTabOffset:index];
    }
    if (_directionStyle == horizontal) {
        [UIView animateWithDuration:0.1 animations:^{
            self->_tagLine.frame = CGRectMake(index * self->_tabWidth, self->_tabHeight - kTagLineHeight - 1, self->_tabWidth, kTagLineHeight);
        } completion:^(BOOL finished) {
            self->_tagIndex = index;
        }];
    }else {
        [UIView animateWithDuration:0.1 animations:^{
            self->_tagLine.frame = CGRectMake(self->_tabWidth - kTagLineHeight - 1, self->_tabHeight * index, kTagLineHeight, self->_tabHeight);
        } completion:^(BOOL finished) {
            self->_tagIndex = index;
        }];
    }
}
- (void)defaultTabOffset:(NSInteger)index {
    if (_directionStyle == horizontal) {
        NSInteger maxWidth = self.frame.size.width;
        CGFloat currOffset = _tabWidth * index;
        //偏移距离
        CGFloat pointx = self.contentOffset.x;
        if (_tagIndex<index) {//向后
            NSInteger equal_value = maxWidth%_tabWidth;
            if (equal_value == 0) {
                if (currOffset >= maxWidth) {
                    [self setContentOffset:CGPointMake(pointx + _tabWidth, 0)];
                }
            }else {
                if ((currOffset + _tabWidth) >= maxWidth) {
                    [self setContentOffset:CGPointMake(pointx + _tabWidth, 0)];
                }
            }
        }else {
            if (currOffset == 0) {
                [self setContentOffset:CGPointMake(0, 0)];
                return;
            }
            if (currOffset < pointx) {
                [self setContentOffset:CGPointMake(pointx - _tabWidth, 0)];
            }
        }
    }else {
        NSInteger maxWidth=self.frame.size.height;
        CGFloat currOffset =_tabHeight * index;
        CGFloat pointy = self.contentOffset.y;
        if(_tagIndex < index){
            NSInteger equal_value = maxWidth%_tabHeight;
            if(equal_value == 0){
                if(currOffset >= maxWidth){
                    [self setContentOffset:CGPointMake(pointy + _tabHeight, 0)];
                }
            }else{
                if((currOffset + _tabHeight) >= maxWidth){
                    [self setContentOffset:CGPointMake(pointy + _tabHeight, 0)];
                }
            }
        }else{
            if(currOffset == 0){
                [self setContentOffset:CGPointMake(0, 0)];
                return;
            }
            if(currOffset < pointy){
                [self setContentOffset:CGPointMake((pointy - _tabHeight), 0)];
            }
        }
    }
}
- (void)autoTabOffset:(NSInteger)index {
    if (_directionStyle == horizontal) {
        NSInteger maxWidth = self.frame.size.width;
        CGFloat pointx = _tabWidth * index;
        CGFloat offset_halfmaxWidth = pointx - maxWidth / 2;
        CGFloat itemOffset = offset_halfmaxWidth + _tabWidth / 2;
        if (offset_halfmaxWidth > 0) {
            if (offset_halfmaxWidth < _tabWidth) {
                [self setContentOffset:CGPointMake(itemOffset, 0)];
                return;
            }
            NSInteger maxCountWidth = _tabWidth * _viewArray.count;
            NSInteger remainder_x = maxCountWidth / maxWidth - 1;
            NSInteger remainder_ = maxCountWidth % maxWidth;
            NSInteger maxOffset = remainder_x * maxWidth + remainder_;
            if (itemOffset <= maxOffset) {
                if (itemOffset <= _tabWidth) {
                    [self setContentOffset:CGPointMake(0, 0)];
                    return;
                }else {
                    [self setContentOffset:CGPointMake(itemOffset, 0)];
                }
            }else {
                [self setContentOffset:CGPointMake(maxOffset, 0)];
            }
        }else if (offset_halfmaxWidth < 0) {
            if (itemOffset > 0) {
                [self setContentOffset:CGPointMake(itemOffset, 0)];
                return;
            }
            [self setContentOffset:CGPointMake(0, 0)];
        }else {
            [self setContentOffset:CGPointMake(0, 0)];
        }
        
    }else {
        NSInteger maxWidth=self.frame.size.height;
        CGFloat pointx=_tabHeight * index;
        CGFloat offset_halfmaxWidth = pointx - maxWidth / 2;
        CGFloat itemOffset = offset_halfmaxWidth + _tabHeight / 2;
        if(offset_halfmaxWidth >= 0){
            if(offset_halfmaxWidth <= _tabHeight){
                [self setContentOffset:CGPointMake(0, itemOffset)];
                return;
            }
            NSInteger maxContWidth =_tabHeight * _viewArray.count;
            NSInteger remainder_x = maxContWidth / maxWidth - 1;
            NSInteger remainder_ = maxContWidth % maxWidth;
            NSInteger maxOffset = remainder_x * maxWidth + remainder_;
            if(itemOffset <= maxOffset){
                if(itemOffset <= _tabHeight){
                    [self setContentOffset:CGPointMake(0, 0)];
                    return;
                }else{
                    [self setContentOffset:CGPointMake(0, itemOffset)];
                }
            }else{
                [self setContentOffset:CGPointMake(0, maxOffset)];
            }
        }else if(offset_halfmaxWidth < 0){
            if(itemOffset > 0){
                [self setContentOffset:CGPointMake(0, itemOffset)];
                return;
            }
            [self setContentOffset:CGPointMake(0, 0)];
        }
        else{
            [self setContentOffset:CGPointMake(0, 0)];
        }
        
    }
}
- (void)updateTag:(NSInteger)index {
    [self autoTabOffset:index];
    _tagLine.frame = CGRectMake(index * _tabWidth, _tabHeight - kTagLineHeight - 1, _tabWidth, kTagLineHeight);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}
- (void)layoutSubviews {
    
}
@end
