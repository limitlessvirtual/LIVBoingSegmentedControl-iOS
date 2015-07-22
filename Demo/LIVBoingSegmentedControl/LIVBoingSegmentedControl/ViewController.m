//
//  ViewController.m
//  LIVSegmentBoingMenu
//
//  Created by PD van Aarde on 2015/06/09.
//  Copyright (c) 2015 Limitless Virtual. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Segement labels
    NSArray *menuItems = @[@"Map",@"Favourites",@"Starred"];
    
    // Container Frame
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    float x = 0;
    float y = 0;
    float width = screenRect.size.width;
    float height = 55;
    
    CGRect menuFrame = CGRectMake(x, y, width, height);
    
    // Init
    _menu = [[LIVBoingSegmentedControl alloc] initMenuWithFrame:menuFrame menuItems:menuItems];
    
    // Change properties
    _menu.tapDelegate = self;
    _menu.selectedLabelColor = [UIColor whiteColor];
    
    // Add to view
    [_menu addMenuToView:self.view];
}

- (void) viewWillAppear:(BOOL)animated {
    [_menu moveSelectorToSegment:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma delegates

- (void)livBoingSegmentedControl:(LIVBoingSegmentedControl*)boingMenu tappedSegmentWithIndex:(NSUInteger)index {
    NSLog(@"Tapped: %lu", (unsigned long)index);
}

@end
