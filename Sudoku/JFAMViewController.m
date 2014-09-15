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
    
    // Create a black background for the borders of the grid
    
    CGFloat backgroundSize = 0.9 * size;
    CGRect backgroundFrame = CGRectMake(0, 0, backgroundSize, backgroundSize);
    
    UIView *background = [[UIView alloc] initWithFrame:backgroundFrame];
    CGPoint center = CGPointMake(self.view.center.x, backgroundSize/2+20);
    background.center = center;
    background.backgroundColor = [UIColor blackColor];
    [self.view addSubview:background];
    
    // Variables for button creation
    CGFloat buttonSize = 4*backgroundSize/50;
    CGRect buttonFrame;
    int colThick, colThin, rowThick, rowThin;
    CGFloat xPos, yPos;
    UIButton* currentButton;
    NSString* number;
    
    for (int row=0; row<9; row++) {
        for (int col=0; col<9; col++) {
            // Position and make the buttons
            colThick = 1+col/3;
            colThin = col+1 - colThick;
            rowThick = 1+row/3;
            rowThin = row+1 - rowThick;
            xPos = col*buttonSize + colThick*buttonSize/2 + colThin*buttonSize/4;
            yPos = row*buttonSize + rowThick*buttonSize/2 + rowThin*buttonSize/4;
            buttonFrame = CGRectMake(xPos, yPos, buttonSize, buttonSize);
            // Set attributes of each button
            currentButton = _buttonArray[row][col];
            currentButton = [[UIButton alloc] initWithFrame:buttonFrame];
            currentButton.tag = 10*(row+1)+col+1;
            currentButton.backgroundColor = [UIColor colorWithWhite:230/255.0 alpha:1.0];
            currentButton.showsTouchWhenHighlighted = YES;
            // Decide what to display on each button
            number = [NSString stringWithFormat:@"%d", initialGrid[row][col]];
            if ([number  isEqual: @"0"]) number = @"";
            [currentButton setTitle:number forState:UIControlStateNormal];
            [currentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            // Create button press event and add as a view
            [currentButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
    int row = ((UIButton*) sender).tag/10;
    int col = ((UIButton*) sender).tag%10;
    NSLog([NSString stringWithFormat:@"Button at row: %d and column: %d was pressed!", row, col]);
}

@end
