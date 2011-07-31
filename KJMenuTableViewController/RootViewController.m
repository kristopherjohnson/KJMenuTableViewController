//
//  RootViewController.m
//  KJMenuTableViewController
//
// Copyright (C) 2011 Kristopher Johnson
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RootViewController.h"

@interface RootViewController ()
- (void)addFirstSectionMenuItems;
- (void)addSecondSectionMenuItems;
- (void)displayAlertWithTitle:(NSString *)title message:(NSString *)message;
@end

@implementation RootViewController

// Override cellStyle method to use subtitle style rather than default, so item's detailText will show up
- (UITableViewCellStyle)cellStyle {
    return UITableViewCellStyleSubtitle;
}

- (void)addFirstSectionMenuItems {
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
    
    item = [KJMenuItem itemWithTitle:@"Indented item"];
    item.indentationLevel = 1;
    item.detailText = @"This is the indented item";
    item.block = ^(KJMenuItemInvocation inv) {
        RootViewController *controller = (RootViewController *)inv.controller;
        NSString *title = inv.item.titleText;
        NSString *message = inv.item.detailText;
        [controller displayAlertWithTitle:title message:message];
    };
    [section addItem:item];
}

- (void)addSecondSectionMenuItems {
    KJMenuSection *section = [KJMenuSection sectionWithHeaderTitle:@"Second Section"];
    [self addSection:section];
    
    KJMenuItem *item = [KJMenuItem itemWithTitle:@"Push view"
                                   accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    item.autoDeselectAfterSelect = NO;
    item.block = ^(KJMenuItemInvocation inv) {
        RootViewController *subcontroller = [[RootViewController alloc]
                                             initWithNibName:@"RootViewController" bundle:nil];
        [inv.controller.navigationController pushViewController:subcontroller animated:YES];
    };
    [section addItem:item];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Menu Item Demo";
    
    [self addFirstSectionMenuItems];
    [self addSecondSectionMenuItems];
}

- (void)displayAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [alert show];
}

@end
