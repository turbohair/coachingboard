//
//  CBChipUIView.h
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/6/15.
//  Copyright (c) 2015 Oleksii Myronenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBChipUIViewDelegate;
@interface CBChipUIView : UIImageView

@end

@protocol CBChipUIViewDelegate <NSObject>
//@interface CBChipUIView : UIView
//- (void)draggableViewWillStartDragging:(UIDraggableView *)view;
//- (void)draggableView:(UIDraggableView *)view  didMoveToPosition:(CGPoint)position;
//- (void)draggableViewDidEndDragging:(UIDraggableView *)view;
@end
