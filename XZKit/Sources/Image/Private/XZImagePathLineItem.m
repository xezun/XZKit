//
//  XZImagePathLineItem.m
//  XZKit
//
//  Created by Xezun on 2021/2/19.
//

#import "XZImagePathLineItem.h"

@implementation XZImagePathLineItem

- (void)drawInContext:(CGContextRef)context {
    CGContextAddLineToPoint(context, _endPoint.x, _endPoint.y);
    
    // NSLog(@"addLine: (%.2f, %.2f)", _endPoint.x, _endPoint.y);
}

- (void)addToPath:(UIBezierPath *)path {
    [path addLineToPoint:_endPoint];
}

@end
