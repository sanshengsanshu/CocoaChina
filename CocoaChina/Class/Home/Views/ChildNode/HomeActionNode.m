//
//  HomeActionNode.m
//  CocoaChina
//
//  Created by Apple on 2019/10/17.
//  Copyright © 2019 wt. All rights reserved.
//

#import "HomeActionNode.h"

@interface HomeActionNode ()
@property (nonatomic, strong) ASTextNode *timeNode;
@property (nonatomic, strong) ASButtonNode *hotNode;
@property (nonatomic, strong) ASButtonNode *loveNode;

@end

@implementation HomeActionNode

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    _timeNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"2015.09.06" Font:[UIFont systemFontOfSize:12] Color:[UIColor blueColor]] LineCount:1];
    [self addSubnode:_timeNode];
    
    _loveNode = [ASButtonNode createWithText:@"喜欢" Font:[UIFont systemFontOfSize:12] Color:[UIColor blueColor] Image:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"收藏.png"]] Spacing:4];
    [self addSubnode:_loveNode];
    
    _hotNode = [ASButtonNode createWithText:@"最热" Font:[UIFont systemFontOfSize:12] Color:[UIColor blueColor] Image:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"hot.png"]] Spacing:4];
    [self addSubnode:_hotNode];
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *actionStackSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    actionStackSpec.spacing = 12.0;
    actionStackSpec.justifyContent = ASStackLayoutJustifyContentStart;
    actionStackSpec.alignItems = ASStackLayoutAlignItemsCenter;
    actionStackSpec.children = @[_loveNode, _hotNode];
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stackSpec.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
    stackSpec.alignItems = ASStackLayoutAlignItemsCenter;
    stackSpec.children = @[_timeNode, actionStackSpec];
    return stackSpec;
}

@end
