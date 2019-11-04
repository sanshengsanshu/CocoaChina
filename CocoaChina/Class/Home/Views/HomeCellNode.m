//
//  HomeCellNode.m
//  CocoaChina
//
//  Created by Apple on 2019/10/17.
//  Copyright © 2019 wt. All rights reserved.
//

#import "HomeCellNode.h"
#import "HomeImageNode.h"
#import "HomeContentNode.h"
#import "HomeActionNode.h"

@interface HomeCellNode ()
@property (nonatomic, strong) HomeImageNode *imageNode;
@property (nonatomic, strong) HomeContentNode *contentNode;
@property (nonatomic, strong) HomeActionNode *actionNode;

@end

@implementation HomeCellNode

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        _imageNode = [[HomeImageNode alloc] initWithDict:dict];
        [self addSubnode:_imageNode];
        _contentNode = [[HomeContentNode alloc] initWithDict:dict];
        [self addSubnode:_contentNode];
        _actionNode = [[HomeActionNode alloc] init];
        [self addSubnode:_actionNode];
    }
    return self;
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *topStackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    topStackSpec.justifyContent = ASStackLayoutJustifyContentStart;
    topStackSpec.alignItems = ASStackLayoutAlignItemsStart;
    topStackSpec.children = @[_imageNode, _contentNode];
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    stackSpec.justifyContent = ASStackLayoutJustifyContentStart;
    stackSpec.alignItems = ASStackLayoutAlignItemsStretch;
    stackSpec.children = @[topStackSpec,_actionNode];
    ASInsetLayoutSpec *cellInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(5, 5, 5, 5) child:stackSpec];
    return cellInsetSpec;
}

@end
