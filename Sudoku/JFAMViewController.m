//
//  JFAMViewController.m
//  Sudoku
//
//  Created by Amit Maor on 9/11/14.
//  Copyright (c) 2014 Jonathan Finnell and Amit Maor. All rights reserved.
//

#import "JFAMViewController.h"

int initialGrid[9][9] = {
    {1,0,0,0,0,7,0,9,0},
    {0,3,0,0,2,0,0,0,8},
    {0,0,9,6,0,0,5,0,0},
    {0,0,5,3,0,0,9,0,0},
    {0,1,0,0,8,0,0,0,2},
    {6,0,0,0,0,4,0,0,0},
    {3,0,0,0,0,0,0,1,0},
    {0,4,0,0,0,0,0,0,7},
    {0,0,7,0,0,0,3,0,0}
};

@interface JFAMViewController ()
{
    UIButton* _button;
    UIButton* _buttonArray[9][9];
}
@end

@implementation JFAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = self.view.frame;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
    
//    CGRect buttonFrame = CGRectMake(0, 0, size*0.5, size*0.5);
//    
//    _button = [[UIButton alloc] initWithFrame:buttonFrame];
//    _button.tag = 1;
//    _button.backgroundColor = [UIColor redColor];
//    _button.showsTouchWhenHighlighted = YES;
//    
//    [self.view addSubview:_button];
//    
//    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Create a black background for the borders of the grid
    
    CGFloat backgroundSize = 0.9 * size;
    CGRect backgroundFrame = CGRectMake(0, 0, backgroundSize, backgroundSize);
    
    UIView *background = [[UIView alloc] initWithFrame:backgroundFrame];
    CGPoint center = CGPointMake(self.view.center.x, backgroundSize/2+20);
    background.center = center;
    background.backgroundColor = [UIColor blackColor];
    [self.view addSubview:background];
    
    // Create all the buttons
    CGFloat buttonSize = backgroundSize/9-18;
    CGRect buttonFrame;
//
//    buttonFrame = CGRectMake(0, 0, buttonSize, buttonSize);
//    
//    _button = [[UIButton alloc] initWithFrame:buttonFrame];
//    _button.tag = 1;
//    _button.backgroundColor = [UIColor redColor];
//    _button.showsTouchWhenHighlighted = YES;
    
    [background addSubview:_button];
    for (int row=0; row<9; row++) {
        for (int col=0; col<9; col++) {
            buttonFrame = CGRectMake(col*(buttonSize+2), row*(buttonSize+2), buttonSize, buttonSize);
            UIButton* currentButton = _buttonArray[row][col];
            currentButton = [[UIButton alloc] initWithFrame:buttonFrame];
            currentButton.tag = 10*row+col;
            currentButton.backgroundColor = [UIColor whiteColor];
            NSString* number = [NSString stringWithFormat:@"%d", initialGrid[row][col]];
            [currentButton setTitle:number forState:UIControlStateNormal];
            [currentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            currentButton.showsTouchWhenHighlighted = YES;
            [background addSubview:currentButton];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buttonPressed:(id)sender
{
    NSLog(@"Button 1 was pressed!!!!!!!!!!");
}

@end
