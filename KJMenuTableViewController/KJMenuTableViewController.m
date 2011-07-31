//
//  KJMenuTableViewController.m
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

#import "KJMenuTableViewController.h"
#import "KJMenuSection.h"
#import "KJMenuItem.h"

@implementation KJMenuTableViewController

- (void)dealloc {
    [_sections release];
    [super dealloc];
}

#pragma mark - Section management

- (void)addSection:(KJMenuSection *)section {
    if (_sections == nil) {
        _sections = [[NSMutableArray array] retain];
    }
    [_sections addObject:section];
}

- (KJMenuSection *)sectionAtIndex:(NSUInteger)index {
    return [_sections objectAtIndex:index];
}

- (NSUInteger)sectionCount {
    return [_sections count];
}

- (KJMenuItem *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger sectionIndex = [indexPath section];
    NSUInteger itemIndex = [indexPath row];
    
    KJMenuSection *section = [self sectionAtIndex:sectionIndex];
    return [section itemAtIndex:itemIndex];
}

- (void)removeAllSections {
    [_sections removeAllObjects];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionCount;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self sectionAtIndex:section] headerTitle];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [[self sectionAtIndex:section] footerTitle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self sectionAtIndex:section] itemCount];
}

- (UITableViewCellStyle)cellStyle {
    return UITableViewCellStyleDefault;
}

- (void)configureCell:(UITableViewCell*)cell
              forItem:(KJMenuItem *)item
          atIndexPath:(NSIndexPath *)indexPath {
    [item configureCell:cell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:[self cellStyle] reuseIdentifier:CellIdentifier] autorelease];
    }
    
    KJMenuItem *item = [self itemAtIndexPath:indexPath];
    [self configureCell:cell forItem:item atIndexPath:indexPath];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KJMenuItem *item = [self itemAtIndexPath:indexPath];
    [item menuTableViewController:self didSelectItemAtIndexPath:indexPath];
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    KJMenuItem *item = [self itemAtIndexPath:indexPath];
    NSLog(@"Indentation level = %ld", (long)item.indentationLevel);
    return item.indentationLevel;
}

@end
