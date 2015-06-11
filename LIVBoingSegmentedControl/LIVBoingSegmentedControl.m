//
//  LIVSegmentBoingMenu.m
//  LIVSegmentBoingMenu
//
//  Created by PD van Aarde on 2015/06/09.
//  Copyright (c) 2015 Limitless Virtual. All rights reserved.
//

#import "LIVBoingSegmentedControl.h"

@interface LIVBoingSegmentedControl ()

@property (strong, nonatomic) UIView* menuView;
@property (assign, nonatomic) int currentlySelected;
@property (assign, nonatomic) int lastSelected;
@property (assign, nonatomic) float lastXpos;

@property (assign, nonatomic) int numberOfItems;
@property (assign, nonatomic) float widthOfEach;


@property (strong, nonatomic) UIImageView *selectorView;

@end

@implementation LIVBoingSegmentedControl

- (id)initMenuWithFrame:(CGRect)menuFrame menuItems:(NSArray*)menuItems {
    
    // Defaults
    _barBackgroundColorSelected = [UIColor colorWithRed:0.176f green:0.800f blue:0.439f alpha:1.00f];
    _barBackgroundColorUnSelected = [UIColor colorWithRed:0.176f green:0.800f blue:0.439f alpha:1.00f];
    _selectedLabelColor = [UIColor whiteColor];
    _selectedLabelFont = [UIFont fontWithName:@"Helvetica-Neue" size:10.0];
    _unSelectedLabelColor = [UIColor darkGrayColor];
    _unSelectedLabelFont = [UIFont fontWithName:@"Helvetica-Neue" size:10.0];
    
    _labelYPosition = 6;
    
    _selectorTintColor = [UIColor colorWithRed:0.176f green:0.800f blue:0.439f alpha:1.00f];
    _selectorViewWidth = 20;
    _selectorViewHeight = 10;
    _selectorImage = [UIImage imageNamed:@"down_arrow"];;
    
    _boingActivated = true;
    _boinginess = 15;
    _boingVelocity = @(1000);
    _boingMass = 0.6;
    
    // Arrays
    _menuItems = [NSArray arrayWithArray:menuItems];
    
    // Frame
    _menuFrame = menuFrame;
    
    return self;
}

- (void)addMenuToView:(UIView*)view {
    
    // Create container
    _menuView = [[UIView alloc]initWithFrame:_menuFrame];
    _menuView.backgroundColor = [UIColor blackColor];
    
    // Divide menu items
    _numberOfItems = (int)[_menuItems count];
    float totalWidth = _menuView.frame.size.width;
    _widthOfEach = totalWidth / _numberOfItems;
    
    float incrementalWidth = 0;
    
    // Add sub views to container
    for (int i = 0; i < _numberOfItems; ++i) {
        
        // Create view
        CGRect itemFrame = CGRectMake(incrementalWidth, 0, _widthOfEach, _menuView.frame.size.height);
        UIView *item = [[UIView alloc]initWithFrame:itemFrame];
        item.tag = i;
        
        incrementalWidth += _widthOfEach;
        
        // Add label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _labelYPosition, _widthOfEach, _menuView.frame.size.height)];
        
        label.text = _menuItems[i];
        label.textAlignment = NSTextAlignmentCenter;
        
        // Set colors
        if (i == 0) {
            item.backgroundColor = _barBackgroundColorSelected;
            label.textColor = _selectedLabelColor;
            label.font = _selectedLabelFont;
            
            // Create selector view
            _selectorView = [[UIImageView alloc] initWithFrame:CGRectMake(_widthOfEach / 2 - _selectorViewWidth / 2, _menuView.frame.size.height, _selectorViewWidth, _selectorViewHeight)];
            
            UIImage *image = _selectorImage;
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [_selectorView setTintColor:_selectorTintColor];
            _selectorView.image = image;
            _selectorView.tag = 100;
            
            [_menuView addSubview:_selectorView];
        } else {
            item.backgroundColor = _barBackgroundColorUnSelected;
            label.textColor = _unSelectedLabelColor;
            label.font = _unSelectedLabelFont;
        }
        
        // Add to view
        [item addSubview:label];
        
        // Gesture recogniser
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedSegment:)];
        [item addGestureRecognizer:tapGesture];
        
        [_menuView addSubview:item];
    }
    
    // Add sub views to container
    [view addSubview:_menuView];
}

- (void)tappedSegment:(UITapGestureRecognizer*)sender {
    UIView *view = sender.view;
    _currentlySelected = (int)view.tag;
    
    [self setColors:_currentlySelected];
    
    if ([self.delegate respondsToSelector:@selector(livBoingSegmentedControl:tappedSegmentWithIndex:)]) {
        [self.delegate livBoingSegmentedControl:self tappedSegmentWithIndex:_currentlySelected];
    }
}

- (void)setColors:(int)currentlySelected {
    for (UIView *i in _menuView.subviews){
        if (i.tag != 100) {
            if (i.tag == currentlySelected) {
                i.backgroundColor = _barBackgroundColorSelected;
                UILabel *tmp = (UILabel*)i.subviews[0];
                tmp.textColor = _selectedLabelColor;
            } else {
                i.backgroundColor = _barBackgroundColorUnSelected;
                UILabel *tmp = (UILabel*)i.subviews[0];
                tmp.textColor = _unSelectedLabelColor;
            }
        } else {
            if(_boingActivated) {
                _lastXpos = _selectorView.frame.origin.x;
                [self moveSelectorToSegmentBoing:currentlySelected selectorView:i];
            } else {
                [self moveSelectorToSegmentNoBoing:currentlySelected selectorView:i];
            }
        }
    }
}

- (void)moveSelectorToSegmentBoing:(int)segment selectorView:(UIView*)selectorView {
    
    _lastSelected = segment;
    
    POPSpringAnimation *boing = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    
    float xPos = (_widthOfEach / 2) + ((segment) * (_widthOfEach));

    boing.fromValue = [NSNumber numberWithFloat:_lastXpos];
    boing.toValue = [NSNumber numberWithFloat:xPos];
    
    boing.springBounciness = _boinginess;
    boing.velocity = _boingVelocity;
    boing.dynamicsMass = _boingMass;
    
    [selectorView.layer pop_addAnimation:boing forKey:@"boing!"];
}

- (void)moveSelectorToSegmentNoBoing:(int)segment selectorView:(UIView*)selectorView {
    
    float xPos = (_widthOfEach / 2 - _selectorViewWidth / 2) + ((segment) * (_widthOfEach));
    
    [UIView animateWithDuration: 0.3
                          delay: 0.1
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         NSLog(@"%f", xPos);
                         
                         [selectorView setFrame:CGRectMake(xPos, selectorView.frame.origin.y, selectorView.frame.size.width, selectorView.frame.size.height)];
                     }
                     completion:^(BOOL finished) { }];
}

@end
