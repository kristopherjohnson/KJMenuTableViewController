//
//  KJMenuSection.h
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
#import "KJMenuItem.h"

// Section header and footer text and a collection of KJMenuItems
@interface KJMenuSection : NSObject {
    NSMutableArray *_items;
}

// Title text to be shown at the top of the section
@property (nonatomic, copy) NSString *headerTitle;

// Footer text to be shown at the bottom of the section
@property (nonatomic, copy) NSString *footerTitle;

// Number of items in section
@property (nonatomic, readonly) NSUInteger itemCount;

// Return an autoreleased KJMenuSection with specified title
+ (KJMenuSection *)sectionWithHeaderTitle:(NSString *)headerTitle;

// Return the item at the specfied index
- (KJMenuItem *)itemAtIndex:(NSUInteger)index;

// Add an item to the end of the collection
- (void)addItem:(KJMenuItem *)item;

// Insert an item at the specified index
- (void)insertItem:(KJMenuItem *)item atIndex:(NSUInteger)index;

// Remove the item at the specified index
- (void)removeItemAtIndex:(NSUInteger)index;

// Remove specified item from the collection
- (void)removeItem:(KJMenuItem *)item;

// Remove all items from the collection
- (void)removeAllItems;

@end
