//
//  KJMenuItem.h
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

#import <Foundation/Foundation.h>

@class KJMenuItem;
@class KJMenuTableViewController;

// Structure passed to a menu item's block when it is invoked
typedef struct {
    KJMenuItem* item;
    KJMenuTableViewController *controller;
    NSIndexPath *indexPath;
} KJMenuItemInvocation;

// Type of menu item block
typedef void (^KJMenuItemBlock)(KJMenuItemInvocation invocation);

// Tappable menu item, for use with KJMenuTableViewController
@interface KJMenuItem : NSObject

// Main title text, displayed as the UITableViewCell's textLabel.text property
@property (nonatomic, copy) NSString *titleText;

// Detail text, displayed as the UITableViewCell's detailTextLabel.text property
@property (nonatomic, copy) NSString *detailText;

// Cell accessory type
@property (nonatomic) UITableViewCellAccessoryType accessoryType;

// Image displayed on left side of table cell
@property (nonatomic, copy) UIImage *image;

// Indentation level of cell (defaults to zero)
@property (nonatomic) NSInteger indentationLevel;

// Width of a level of indentation (defaults to 10.0)
@property (nonatomic) CGFloat indentationWidth;

// Block to be executed when item is tapped
@property (nonatomic, copy) KJMenuItemBlock block;

// If YES, selected cell will be deselected after the block is executed
@property (nonatomic) BOOL autoDeselectAfterSelect;

// Additional object that can be attached to a menu item
@property (nonatomic, retain) NSObject *context;

// Return autoreleased KJMenuItem instance with specified titleText
+ (KJMenuItem *)itemWithTitle:(NSString *)title;

+ (KJMenuItem *)itemWithTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)accessoryType;

+ (KJMenuItem *)itemWithTitle:(NSString *)title block:(KJMenuItemBlock)block;

+ (KJMenuItem *)itemWithTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)accessoryType block:(KJMenuItemBlock)block;

// Called by KJMenuTableViewController when the cell associated with this item is tapped.  By default,
// it invokes the block.  This method can be overridden.
- (void)menuTableViewController:(KJMenuTableViewController *)menuController didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

// Called by the KJMenuTableViewController when a cell is about to be displayed for an item.
// The default implementation sets the cell's attributes to match those of the menu item.
// This method can be overridden.
- (void)configureCell:(UITableViewCell *)cell;

@end
