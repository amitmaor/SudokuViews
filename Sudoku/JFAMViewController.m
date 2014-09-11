//
//  JFAMViewController.m
//  Sudoku
//
//  Created by Amit Maor on 9/11/14.
//  Copyright (c) 2014 Jonathan Finnell and Amit Maor. All rights reserved.
//

#import "JFAMViewController.h"

@interface JFAMViewController ()
{
    UIButton* _button;
}

@end

@implementation JFAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = self.view.frame;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.51;
    
    CGRect buttonFrame = CGRectMake(0, 0, size, size);
    
    _button = [[UIButton alloc] initWithFrame:buttonFrame];
    _button.tag = 1;
    _button.backgroundColor = [UIColor redColor];
    _button.showsTouchWhenHighlighted = YES;
    
    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
