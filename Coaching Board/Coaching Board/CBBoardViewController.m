//
//  CBBoardViewController.m
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/6/15.
//  Copyright (c) 2015 Oleksii Myronenko. All rights reserved.
//

#import "CBBoardViewController.h"
#import "CBChipUIView.h"
#import "CBDrawingView.h"
#import <SpriteKit/SpriteKit.h>
#import "CBBoardScene.h"

@interface CBBoardViewController () {
    IBOutlet CBDrawingView *drawingView;
}
- (IBAction)loadArchived:(id)sender;
@end

@implementation CBBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CGRect boardRect = CGRectMake(0, 64, 764, 960);
//    UIView *boardView = [[UIView alloc] initWithFrame:boardRect];
//    [boardView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"FutsalPitch-1"]]];
//    [self.view insertSubview:boardView atIndex:2];
    
    //show all chips from plist
    //[self showChipsOnBoard];
    
    //scene presentation
    CBBoardScene *board = [[CBBoardScene alloc] initWithSize:CGSizeMake(768, 960) backgroundImage:[UIImage imageNamed:@"futsalPitch"]];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: board];
    
    //drawing
    drawingView.strokeColor = [UIColor blackColor];
    drawingView.strokeWidth = 7.0f;
    
    
    NSLog(@"%@", [board chips]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadArchived:(id)sender{
    // Load an archived array of bezier paths
    UIBezierPath *path = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"test-path" ofType:@"txt"]];
    // Display archived path.
    [drawingView drawBezier:path];
}



@end
