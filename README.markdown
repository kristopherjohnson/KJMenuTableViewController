# KJMenuTableViewController

## Overview

KJMenuTableViewController is a set of classes that simplifies the creation of "menus" in
iOS application using `UITableViewController`.

The `UITableViewController` class is a generic mechanism for presenting a scrollable list of
rows of items.  It is powerful and extensible, but it can be a chore to present a simple
list of button-like rows that react when tapped.  One must provide implementations of several
methods of the `UITableViewDataSource` and `UITableViewDelegate` classes, each of which will
probably have a `case` statement to handle each of the individual items.

The KJMenuTableViewController simplifies this usage case.  One simply defines a subclass of
KJMenuTableViewController and overrides the `viewDidLoad` method to create sections and row items.
The actions to be executed when an item is tapped are defined as blocks, so there is no need
to define extra methods in the controller class or in other classes.

## Example

In this example, the controller is a subclass of `KJMenuTableViewController`, which is itself
a subclass of `UITableViewController`.  In the `viewDidLoad` method, we add a first section with
two items, each of which displays itself in an alert box, and a second section that has
an item that pushes a new controller onto the navigation stack.

    - (void)viewDidLoad {
        [super viewDidLoad];
        
        // Add first section
        
        KJMenuSection *section = [KJMenuSection sectionWithHeaderTitle:@"First Section"];
        section.footerTitle = @"Select item above to display alert";
        [self addSection:section];    
        
        KJMenuItem *item;
        
        item = [KJMenuItem itemWithTitle:@"First"];
        item.detailText = @"This is the first item";
        item.block = ^(KJMenuItemInvocation inv) {
            RootViewController *controller = (RootViewController *)inv.controller;
            NSString *title = inv.item.titleText;
            NSString *message = inv.item.detailText;
            [controller displayAlertWithTitle:title message:message];
        };
        [section addItem:item];
        
        item = [KJMenuItem itemWithTitle:@"Second"];
        item.detailText = @"This is the second item";
        item.block = ^(KJMenuItemInvocation inv) {
            RootViewController *controller = (RootViewController *)inv.controller;
            NSString *title = inv.item.titleText;
            NSString *message = inv.item.detailText;
            [controller displayAlertWithTitle:title message:message];
        };
        [section addItem:item];
        
        // Add second section
        
        section = [KJMenuSection sectionWithHeaderTitle:@"Second Section"];
        [self addSection:section];
        
        item = [KJMenuItem itemWithTitle:@"Push view"
                           accessoryType:UITableViewCellAccessoryDisclosureIndicator];
        item.autoDeselectAfterSelect = NO;
        item.block = ^(KJMenuItemInvocation inv) {
            RootViewController *subcontroller = [[RootViewController alloc]
                                                 initWithNibName:@"RootViewController" bundle:nil];
            [inv.controller.navigationController pushViewController:subcontroller animated:YES];
        };
        [section addItem:item];
    }


## Future Directions

The following features are planned:

* Add convenience methods to reduce the verbosity of setting up a menu.
* Provide a mechanism so that only one item within a section has a checkmark, and when user selects another item the originally checked item is unchecked.
* Provide the ability to define a menu hierarchy that is handled by a single view controller.

## License

Copyright (C) 2011 Kristopher Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.