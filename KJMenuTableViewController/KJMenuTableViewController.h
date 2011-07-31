//
//  KJMenuTableViewController.h
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

#import <UIKit/UIKit.h>
#import "KJMenuSection.h"

@interface KJMenuTableViewController : UITableViewController {
@private
    NSMutableArray *_sections;
}

// Number of sections
@property (nonatomic, readonly) NSUInteger sectionCount;

// Add a section
- (void)addSection:(KJMenuSection *)section;

// Return the section at the specified index
- (KJMenuSection *)sectionAtIndex:(NSUInteger)index;

// Remove all the sections
- (void)removeAllSections;

// This method is called by tableView:cellForRowAtIndexPath:. By default, it
// sets the properties of the cell to match those of the item.  It may be
// overridden to provide different cell customization.
- (void)configureCell:(UITableViewCell *)cell
              forItem:(KJMenuItem *)item
          atIndexPath:(NSIndexPath *)indexPath;

// This method is called by tableView:cellForRowAtIndexPath: when the controller
// needs to allocate and initialize a new cell.  By default, it returns
// UITableViewCellStyle default.  It may be overridden by subclasses that
// need to use a different cell style.
// 
// If multiple cell styles are needed, then override
// tableView:cellForRowAtIndexPath instead.
- (UITableViewCellStyle)cellStyle;

@end
