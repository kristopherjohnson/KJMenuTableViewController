//
//  KJMenuSection.m
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

#import "KJMenuSection.h"

@implementation KJMenuSection

@synthesize headerTitle;
@synthesize footerTitle;

+ (KJMenuSection *)sectionWithHeaderTitle:(NSString *)headerTitle {
    KJMenuSection *section = [[[KJMenuSection alloc] init] autorelease];
    section.headerTitle = headerTitle;
    return section;
}

- (id)init
{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray array] retain];
    }
    
    return self;
}

- (void)dealloc {
    self.headerTitle = nil;
    self.footerTitle = nil;
    [_items release];
    [super dealloc];
}

- (NSUInteger)itemCount {
    return [_items count];
}

- (KJMenuItem *)itemAtIndex:(NSUInteger)index {
    return [_items objectAtIndex:index];
}

- (void)addItem:(KJMenuItem *)item {
    [_items addObject:item];
}

- (void)insertItem:(KJMenuItem *)item atIndex:(NSUInteger)index {
    [_items insertObject:item atIndex:index];
}

- (void)removeItemAtIndex:(NSUInteger)index {
    [_items removeObjectAtIndex:index];
}

- (void)removeItem:(KJMenuItem *)item {
    [_items removeObject:item];
}

- (void)removeAllItems {
    [_items removeAllObjects];
}

@end
