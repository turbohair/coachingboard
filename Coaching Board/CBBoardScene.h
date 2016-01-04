//
//  CBBoardScene.h
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/30/15.
//  Copyright © 2015 Oleksii Myronenko. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CBBoardScene : SKScene

- (instancetype)initWithSize:(CGSize)size backgroundImage:(UIImage *)image;

@property (nonatomic, strong, readonly) NSSet *chips;

@end
