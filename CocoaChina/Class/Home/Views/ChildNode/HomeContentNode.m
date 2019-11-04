//
//  HomeContentNode.m
//  CocoaChina
//
//  Created by Apple on 2019/10/17.
//  Copyright © 2019 wt. All rights reserved.
//

#import "HomeContentNode.h"

@interface HomeContentNode ()
@property (nonatomic, strong) ASTextNode *titleNode;
@property (nonatomic, strong) ASTextNode *contentNode;

@end


@implementation HomeContentNode

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setupUIWithData:dict];
    }
    return self;
}

- (void)setupUIWithData:(NSDictionary *)dict {
    _titleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:dict[@"title"] Font:[UIFont boldSystemFontOfSize:16] Color:[UIColor blackColor]] LineCount:0];
    [self addSubnode:_titleNode];
    _contentNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:dict[@"content"] Font:[UIFont systemFontOfSize:14] Color:[UIColor grayColor]] LineCount:0];
    [self addSubnode:_contentNode];
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASInsetLayoutSpec *titleInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 8, 0, 0) child:_titleNode];
    ASInsetLayoutSpec *contentInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 8, 0, 0) child:_contentNode];
    ASStackLayoutSpec *contentStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[titleInsetSpec, contentInsetSpec]];
    return contentStackSpec;
}

@end
