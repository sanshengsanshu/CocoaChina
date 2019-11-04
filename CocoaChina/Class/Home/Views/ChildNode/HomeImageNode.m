//
//  HomeImageNode.m
//  CocoaChina
//
//  Created by Apple on 2019/10/17.
//  Copyright © 2019 wt. All rights reserved.
//

#import "HomeImageNode.h"

@interface HomeImageNode ()

@property (nonatomic, strong) ASNetworkImageNode *imageNode;

@end

@implementation HomeImageNode

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setupUIWithData:dict];
    }
    return self;
}
- (void)setupUIWithData:(NSDictionary *)dict{
    _imageNode = [ASNetworkImageNode createWithURLStr:dict[@"cover"]];
    [self addSubnode:_imageNode];
    _imageNode.imageModificationBlock = [_imageNode imageModificationBlock];

}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASRatioLayoutSpec *imageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:0.5 child:_imageNode];
    _imageNode.style.preferredSize = CGSizeMake(100, 50);
    return imageRatioSpec;
}

@end
