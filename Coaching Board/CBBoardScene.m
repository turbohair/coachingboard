//
//  CBBoardScene.m
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/30/15.
//  Copyright © 2015 Oleksii Myronenko. All rights reserved.
//

#import "CBBoardScene.h"
#import "CBChipNode.h"

@interface CBBoardScene ()
@property BOOL contentCreated;

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic) CGFloat deltaX;
@property (nonatomic) CGFloat deltaY;

@end

@implementation CBBoardScene

- (instancetype)initWithSize:(CGSize)size backgroundImage:(UIImage *)image
{
    self = [super initWithSize:size];
    if (self) {
        _backgroundImage = image;
    }
    return self;
}

- (void)didMoveToView:(SKView *)view
{
    //add gesture recognizer
//    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:[self view] action: @selector(panGestureRecognizerReceived:)];
    [[self view] addGestureRecognizer:panGesture];
//    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
//    recognizer.direction = UISwipeGestureRecognizerDirectionUp;
//    [[self view] addGestureRecognizer:recognizer];
    
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    /* Show the background */
    [self _showBackground];
    
    /* Show player chips */
    NSSet *addedChips = [self _showChipsOnBoard];
    _chips = addedChips;
}

- (void)touchesMoved:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
}

#pragma mark - Chips Creation

- (void)_showBackground
{
    SKTexture *texture = [SKTexture textureWithImage:self.backgroundImage];
    SKSpriteNode *backgroundSprite = [SKSpriteNode spriteNodeWithTexture:texture];
    backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:backgroundSprite];

}

- (NSSet *)_showChipsOnBoard
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"futsalChips" ofType:@"plist"];
    NSArray *chips = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableSet *set = [NSMutableSet new];
    for (NSUInteger i = 0; i < chips.count; i++) {
        NSDictionary *chip = chips[i];
        
        NSString *positionString = chip[@"position"];
        CGRect frame = CGRectFromString(positionString);
        
        NSString *imageName = chip[@"image"];
        
        //add Chips to Scene as nodes
        CBChipNode *chipNode = [CBChipNode spriteNodeWithImageNamed:imageName];
        chipNode.size = frame.size;
        chipNode.position = CGPointMake(frame.origin.x + frame.size.width / 2.0f,
                                        frame.origin.y + frame.size.height / 2.0f);
        [self addChild:chipNode];
        
        [set addObject:chipNode];
    }
    
    return [set copy];
}

- (void)panGestureRecognizerReceived:(UIPanGestureRecognizer *)panGesture
{
    if ([panGesture state] == UIGestureRecognizerStateBegan) {
        _deltaX = [[panGesture view] center].x;
        _deltaY = [[panGesture view] center].y;
//        [self.parent bringSubviewToFront:self];
//
//        //Here need to add login which will limit chips draggable zone by Board view
    }
    CGPoint translatedPoint = [panGesture translationInView:panGesture.view];
    translatedPoint = CGPointMake(_deltaX + translatedPoint.x, _deltaY + translatedPoint.y);
    self.position = translatedPoint;
}

//- (void)handleSwipe:(UISwipeGestureRecognizer *)sender
//{
//    if (sender.state == UIGestureRecognizerStateEnded)
//    {
//        CGPoint touchLocation = [sender locationInView:sender.view];
//        touchLocation = [self convertPointFromView:touchLocation];
//        SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
//        
//        NSLog(@"%@", touchedNode);
//    }
//}

@end
