//
//  XZImageBorder.m
//  XZKit
//
//  Created by Xezun on 2021/2/17.
//

#import "XZImageBorder.h"
#import "XZImageBorder+Extension.h"
#import "XZImageBorders.h"

@implementation XZImageBorder

- (BOOL)isEffective {
    return super.isEffective || self.arrowIfLoaded.isEffective;
}

- (instancetype)initWithImageBorders:(XZImageBorders *)imageBorders {
    self = [super initWithSuperAttribute:imageBorders];
    if (self) {
        [self updateWithLineSilently:imageBorders];
        
        XZImageBorderArrow *arrow = imageBorders.arrowIfLoaded;
        if (arrow != nil) {
            _arrow = [[XZImageBorderArrow alloc] initWithBorder:self];
            [_arrow updateWithBorderArrowSilently:arrow];
        }
    }
    return self;
}

@synthesize arrow = _arrow;

- (XZImageBorderArrow *)arrow {
    if (_arrow == nil) {
        _arrow = [[XZImageBorderArrow alloc] initWithBorder:self];
    }
    return _arrow;
}

- (XZImageBorderArrow *)arrowIfLoaded {
    return _arrow;
}

@end


