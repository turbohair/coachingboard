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
    
    
    [self showChipsOnBoard];
    
    //drawing
    drawingView.strokeColor = [UIColor blackColor];
    drawingView.strokeWidth = 10.0f;
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

- (void)showChipsOnBoard
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"futsalChips" ofType:@"plist"];
    NSArray *chips = [NSArray arrayWithContentsOfFile:filePath];
    
    for (NSUInteger i = 0; i < chips.count; i++) {
        NSDictionary *chip = chips[i];
        
        NSString *positionString = chip[@"position"];
        CGRect frame = CGRectFromString(positionString);
        
        NSString *imageName = chip[@"image"];
        
        CBChipUIView *chipView = [[CBChipUIView alloc] initWithFrame:frame];
        chipView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:chipView];
    }
}

@end
