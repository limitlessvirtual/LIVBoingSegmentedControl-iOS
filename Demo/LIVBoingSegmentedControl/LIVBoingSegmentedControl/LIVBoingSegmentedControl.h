//
//  LIVSegmentBoingMenu.h
//  LIVSegmentBoingMenu
//
//  Created by PD van Aarde on 2015/06/09.
//  Copyright (c) 2015 Limitless Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pop/POP.h>

@protocol LIVBoingTapDelegate;

@interface LIVBoingSegmentedControl : UIView

// Delegate
@property (nonatomic, assign) id<LIVBoingTapDelegate> delegate;

// General
@property (nonatomic, strong) NSArray *menuItems;                       //The menu items
@property (nonatomic, assign) CGRect menuFrame;                         //The menu container frame


// Bar properties
@property (nonatomic, strong) UIColor *barBackgroundColorSelected;      //Background of bar when selected
@property (nonatomic, strong) UIColor *barBackgroundColorUnSelected;    //Background of bar when unselected
@property (nonatomic, strong) UIFont *selectedLabelFont;                //Font of label when selected
@property (nonatomic, strong) UIFont *unSelectedLabelFont;              //Font of label when unselected
@property (nonatomic, strong) UIColor *selectedLabelColor;              //Color of label when selected
@property (nonatomic, strong) UIColor *unSelectedLabelColor;            //Color of label when unselected

@property (nonatomic, assign) float labelYPosition;                     //Positon of labels

// Selector properties
@property (nonatomic, strong) UIImage *selectorImage;                   //Selector image
@property (nonatomic, strong) UIColor *selectorTintColor;               //Selector tint color
@property (nonatomic, assign) float selectorViewWidth;                  //Selector width
@property (nonatomic, assign) float selectorViewHeight;                 //Selector height

//boingness
@property (nonatomic, assign) Boolean boingActivated;                   //Boing when selector moves
@property (nonatomic, assign) float boinginess;                         //How much boing
@property (nonatomic, assign) id boingVelocity;                         //Boing throw velocity
@property (nonatomic, assign) float boingMass;                          //Mass of selector

// Init functions
-(id)initMenuWithFrame:(CGRect)frame menuItems:(NSArray*)menuItems;     //Set items and frame size

// Add functions
- (void)addMenuToView:(UIView*)view;                                    //Add menu to view

@end

@protocol LIVBoingTapDelegate<NSObject>

@optional

// On segment pressed
-(void)livBoingSegmentedControl:(LIVBoingSegmentedControl *)boingMenu tappedSegmentWithIndex:(NSUInteger)index;

@end