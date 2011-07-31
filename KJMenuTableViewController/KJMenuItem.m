//
//  KJMenuItem.m
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

#import "KJMenuItem.h"
#import "KJMenuTableViewController.h"

@implementation KJMenuItem

@synthesize titleText;
@synthesize detailText;
@synthesize accessoryType;
@synthesize image;
@synthesize indentationLevel;
@synthesize indentationWidth;
@synthesize block;
@synthesize autoDeselectAfterSelect;
@synthesize context;

+ (KJMenuItem *)itemWithTitle:(NSString *)title {
    return [self itemWithTitle:title accessoryType:UITableViewCellAccessoryNone block:nil];
}

+ (KJMenuItem *)itemWithTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)accessoryType {
    return [self itemWithTitle:title accessoryType:accessoryType block:nil];
}

+ (KJMenuItem *)itemWithTitle:(NSString *)title block:(KJMenuItemBlock)block {
    return [self itemWithTitle:title accessoryType:UITableViewCellAccessoryNone block:block];
}

+ (KJMenuItem *)itemWithTitle:(NSString *)title accessoryType:(UITableViewCellAccessoryType)accessoryType block:(KJMenuItemBlock)block {
    KJMenuItem *item = [[KJMenuItem alloc] init];
    item.titleText = title;
    item.accessoryType = accessoryType;
    item.block = block;
    [item autorelease];
    return item;    
}

- (id)init
{
    self = [super init];
    if (self) {
        autoDeselectAfterSelect = TRUE;
        indentationWidth = 10.0;
    }
    
    return self;
}

- (void)dealloc {
    self.titleText = nil;
    self.detailText = nil;
    self.image = nil;
    self.block = nil;
    self.context = nil;
    [super dealloc];
}

- (void)menuTableViewController:(KJMenuTableViewController *)menuController didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (block != nil) {
        KJMenuItemInvocation invocation;
        invocation.item = self;
        invocation.controller = menuController;
        invocation.indexPath = indexPath;
        block(invocation);
    }
    
    if (autoDeselectAfterSelect) {
        [menuController.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)configureCell:(UITableViewCell *)cell {
    cell.textLabel.text = titleText;
    cell.detailTextLabel.text = detailText;
    cell.accessoryType = accessoryType;
    cell.imageView.image = image;
    cell.indentationLevel = indentationLevel;
    cell.indentationWidth = indentationWidth;
}

@end
