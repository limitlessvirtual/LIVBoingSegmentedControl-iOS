//
//  ViewController.h
//  LIVSegmentBoingMenu
//
//  Created by PD van Aarde on 2015/06/09.
//  Copyright (c) 2015 Limitless Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LIVBoingSegmentedControl.h"

@interface ViewController : UIViewController <LIVBoingTapDelegate>

@property LIVBoingSegmentedControl *menu;

@end

