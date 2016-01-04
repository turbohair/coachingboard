//
//  CBChipNode.m
//  Coaching Board
//
//  Created by Oleksii Myronenko on 7/1/15.
//  Copyright © 2015 Oleksii Myronenko. All rights reserved.
//

#import "CBChipNode.h"

@implementation CBChipNode

//- (void)setupGestures
//{
//    self.userInteractionEnabled = YES;
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
//                                                                                 action:@selector(panGestureRecognizerReceived:)];
//    [self addGestureRecognizer:panGesture];
//}
//
//- (void)panGestureRecognizerReceived:(UIPanGestureRecognizer *)panGesture
//{
//    if ([panGesture state] == UIGestureRecognizerStateBegan) {
//        _deltaX = [[panGesture view] center].x;
//        _deltaY = [[panGesture view] center].y;
//        [self.parent bringSubviewToFront:self];
//        
//        //Here need to add login which will limit chips draggable zone by Board view
//    }
//    CGPoint translatedPoint = [panGesture translationInView:self.superview];
//    translatedPoint = CGPointMake(_deltaX + translatedPoint.x, _deltaY + translatedPoint.y);
//    self.position = translatedPoint;
//}


@end
