//
//  CBBoardViewController.m
//  Coaching Board
//
//  Created by Oleksii Myronenko on 6/6/15.
//  Copyright (c) 2015 Oleksii Myronenko. All rights reserved.
//

#import "CBBoardViewController.h"
#import "CBChipUIView.h"

@interface CBBoardViewController ()

@end

@implementation CBBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CGRect boardRect = CGRectMake(0, 64, 764, 960);
//    UIView *boardView = [[UIView alloc] initWithFrame:boardRect];
//    [boardView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"futsalPitch"]]];
//    [self.view addSubview:boardView];
    
    
    [self showChipsOnBoard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
