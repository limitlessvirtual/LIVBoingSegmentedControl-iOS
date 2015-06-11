#LIVBoingSegmentedControl


An animated segment menu using the pop animation library (https://github.com/facebook/pop). The menu is fully customizable in terms of number of segments, selected and unselected colors, selector image, selector velocity etc.

<img src="http://i.imgur.com/IxhgMBX.gif" width="200px;">

##Setup

You can either:

1. Copy the the **LIVBoingSegmentedControl** directly into your Project
2. Include the following cocoapod (preferred):

```
pod 'LIVBoingSegmentedControl'
```

##Usage

Import the required header file:

```objective-c
#import <LIVBoingSegmentedControl/LIVBoingSegmentedControl.h>

//or without pod

#import "LIVBoingSegmentedControl.h"
```

Create the LIVBoingSegmentedControl with an array of labels, a frame and set certain properties:

```objective-c

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
_menu.delegate = self;
_menu.boinginess = 15;
_menu.selectedLabelColor = [UIColor whiteColor];

// Add to view
[_menu addMenuToView:self.view];

```

###Initialisation

How to create the bubble menu:

**At a certain point in a view:**

```objective-c
[[LIVBoingSegmentedControl alloc] initMenuWithFrame:menuFrame menuItems:menuItems];
```

###Delegates

The following delegate is available:

```objective-c

//User selected a segment
-(void)livBoingSegmentedControl:(LIVBoingSegmentedControl *)boingMenu tappedSegmentWithIndex:(NSUInteger)index {
    NSLog(@"Tapped: %lu", (unsigned long)index);
}

```

##Customizable Properties

| Property                     | Type     | Description                                                   | Default Value |
|------------------------------|----------|---------------------------------------------------------------|---------------|
| menuItems                    | NSArray* | Title for each menu item.                                     | -             |
| menuFrame                    | CGRect   | The frame for the menu.                                       | -             |
| barBackgroundColorSelected   | UIColor  | Background of segment when it is selected.                    | Green         |
| barBackgroundColorUnSelected | UIColor  | Background of segment when it is not selected.                | Green         |
| selectedLabelFont            | UIFont   | Font of segment label when it is selected.                    | HelveticaNeue |
| unSelectedLabelFont          | UIFont   | Font of segment label when it is not selected.                | HelveticaNeue |
| selectedLabelColor           | UIColor  | Font color of segment label when it is selected.              | White         |
| unSelectedLabelColor         | UIColor  | Font color of segment label when it is not selected.          | Grey          |
| labelYPosition               | float    | Y position of label in bar.                                   | 6             |
| selectorImage                | UIImage  | Image for the selector which shows which tab is selected.     | -             |
| selectorTintColor            | UIColor  | Color of the image of the selector.                           | Green         |
| selectorViewWidth            | float    | Selector image width.                                         | 20            |
| selectorViewHeight           | float    | Selector image height.                                        | 10            |
| boingActivated               | Boolean  | True if the selector must boing.                              | TRUE          |
| boinginess                   | float    | How much boing the selector must have.                        | 15            |
| boingVelocity                | id       | How much velocity the selector must have.                     | @(1000)       |
| boingMass                    | float    | How much mass the selector must have.                         | 0.6           |

##Requirements

`ARC`, `iOS 8.0+`, `Xcode 6+`

##Upcoming Features

* Images as bar background.
* Landscape support.



