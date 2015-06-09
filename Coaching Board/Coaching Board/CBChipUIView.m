//
//  CBChipUIView.m
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/6/15.
//  Copyright (c) 2015 Oleksii Myronenko. All rights reserved.
//

#import "CBChipUIView.h"
@interface CBChipUIView ()

@property (nonatomic) CGFloat deltaX;
@property (nonatomic) CGFloat deltaY;

@end

@implementation CBChipUIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupGestures];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGestures];
    }
    return self;
}

- (void)setupGestures
{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(panGestureRecognizerReceived:)];
    [self addGestureRecognizer:panGesture];
}

- (void)panGestureRecognizerReceived:(UIPanGestureRecognizer *)panGesture
{
    if ([panGesture state] == UIGestureRecognizerStateBegan) {
        _deltaX = [[panGesture view] center].x;
        _deltaY = [[panGesture view] center].y;
        [self.superview bringSubviewToFront:self];
        
        //Here need to add login which will limit chips draggable zone by Board view
    }
    CGPoint translatedPoint = [panGesture translationInView:self.superview];
    translatedPoint = CGPointMake(_deltaX + translatedPoint.x, _deltaY + translatedPoint.y);
    self.center = translatedPoint;
}

@end
