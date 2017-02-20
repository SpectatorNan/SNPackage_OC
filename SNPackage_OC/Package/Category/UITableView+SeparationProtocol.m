//
//  UITableView+SeparationProtocol.m
//  refactorEatHome
//
//  Created by Spectator on 2017/2/9.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import "UITableView+SeparationProtocol.h"
#import <objc/runtime.h>

@implementation UITableView (SeparationProtocol)

//NSInteger _method_sectionCount;
//NSInteger _method_rowNumber;

- (void)sn_lazyProtocol {
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark -- DataSource

- (rowNumberBlock)sn_rowNumberBlock {
    return objc_getAssociatedObject(self, @selector(sn_rowNumberBlock));
}

- (void)setSn_rowNumberBlock:(rowNumberBlock)sn_rowNumberBlock {
    objc_setAssociatedObject(self, @selector(sn_rowNumberBlock), sn_rowNumberBlock, OBJC_ASSOCIATION_COPY);
}

- (void)sn_setNumberOfRows:(NSInteger (^)())count {
    objc_setAssociatedObject(self, @selector(sn_setNumberOfRows:), count, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self analysisRowNumberOfSection:section];
}

- (NSInteger)analysisRowNumberOfSection:(NSInteger)section {
    
    if (self.sn_rowNumberBlock) {
        return self.sn_rowNumberBlock(section);
    } else if ([self respondsToSelector:@selector(sn_setNumberOfRows:)]) {
        intergerBlock block = objc_getAssociatedObject(self, @selector(sn_setNumberOfRows:));
        if (block) {
        return block(section);
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}




- (tableViewCellBlock)sn_cellBlock {
    return objc_getAssociatedObject(self, @selector(sn_cellBlock));
}

- (void)setSn_cellBlock:(tableViewCellBlock)sn_cellBlock {
    objc_setAssociatedObject(self, @selector(sn_cellBlock), sn_cellBlock, OBJC_ASSOCIATION_COPY);
}

- (void)sn_setCell:(UITableViewCell * (^)(UITableView *, NSIndexPath *))info {
    objc_setAssociatedObject(self, @selector(sn_setCell:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sn_cellBlock) {
        return self.sn_cellBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_setCell:)]) {
        tableViewCellBlock block = objc_getAssociatedObject(self, @selector(sn_setCell:));
        if (block) {
            return block(tableView, indexPath);
        } else {
//            return [UITableViewCell new];
            return nil;
        }
    } else {
        
//        NSAssert(NO, @"tableview没有实现cellforrow方法，请调用cellBlock或者setCell方法");
        NSLog(@"tableview没有实现cellforrow方法，请调用cellBlock或者setCell方法");
//        return [UITableViewCell new];
        return nil;
    }

}



- (intergerBlock)sn_sectionNumberBlock {
    return objc_getAssociatedObject(self, @selector(sn_sectionNumberBlock));
}

- (void)setSn_sectionNumberBlock:(intergerBlock)sn_sectionNumberBlock {
    objc_setAssociatedObject(self, @selector(sn_sectionNumberBlock), sn_sectionNumberBlock, OBJC_ASSOCIATION_COPY);
}


- (void)sn_setSectionCount:(NSInteger (^)())count {
    objc_setAssociatedObject(self, @selector(sn_setSectionCount:), count, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.sn_sectionNumberBlock) {
        
        return self.sn_sectionNumberBlock(tableView);
    } else if ([self respondsToSelector:@selector(sn_setSectionCount:)]) {
        intergerBlock block = objc_getAssociatedObject(self, @selector(sn_setSectionCount:));
        if (block) {
            return block(tableView);
        } else {
            return 1;
        }
    } else {
    return 1;
    }
}


- (stringBlock)sn_titleForHeaderBlock {
    return objc_getAssociatedObject(self, @selector(sn_titleForHeaderBlock));
}

- (void)setSn_titleForHeaderBlock:(stringBlock)sn_titleForHeaderBlock {
    objc_setAssociatedObject(self, @selector(sn_titleForHeaderBlock), sn_titleForHeaderBlock, OBJC_ASSOCIATION_COPY);
}

- (void)sn_setTitleForHeader:(NSString *(^)(NSInteger *))title {
    objc_setAssociatedObject(self, @selector(sn_setTitleForHeader:), title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (self.sn_titleForHeaderBlock) {
        return self.sn_titleForHeaderBlock(section);
    } else if ([self respondsToSelector:@selector(sn_setTitleForHeader:)]) {
        stringBlock block = objc_getAssociatedObject(self, @selector(sn_setTitleForHeader:));
        if (block) {
            return block(section);
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}



- (stringBlock)sn_titleForFooterBlock {
    return objc_getAssociatedObject(self, @selector(sn_titleForFooterBlock));
}

- (void)setSn_titleForFooterBlock:(stringBlock)sn_titleForFooterBlock {
    objc_setAssociatedObject(self, @selector(sn_titleForFooterBlock), sn_titleForFooterBlock, OBJC_ASSOCIATION_COPY);
}

- (void)sn_setTitleForFooter:(NSString *(^)(NSInteger *))sn_title {
    objc_setAssociatedObject(self, @selector(sn_setTitleForFooter:), sn_title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.sn_titleForFooterBlock) {
        return self.sn_titleForFooterBlock(section);
    } else if ([self respondsToSelector:@selector(sn_setTitleForFooter:)]) {
        stringBlock block = objc_getAssociatedObject(self, @selector(sn_setTitleForFooter:));
        if (block) {
            return block(section);
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

// Editing

- (void)sn_setCanEditRow:(BOOL (^)(UITableView *, NSIndexPath *))info {
    objc_setAssociatedObject(self, @selector(sn_setCanEditRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (boolBlock)sn_isCanEditRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_isCanEditRowBlock));
}

- (void)setSn_isCanEditRowBlock:(boolBlock)sn_isCanEditRowBlock {
    objc_setAssociatedObject(self, @selector(sn_isCanEditRowBlock), sn_isCanEditRowBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sn_isCanEditRowBlock) {
        return self.sn_isCanEditRowBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_setCanEditRow:)]) {
        boolBlock block = objc_getAssociatedObject(self, @selector(sn_setCanEditRow:));
        if (block) {
           return block(tableView, indexPath);
        } else {
            return YES;
//            return NO;
        }
    } else {
        return YES;
//            return NO;
    }
}


- (void)sn_setCanMoveRow:(BOOL (^)(UITableView *, NSIndexPath *))info {
    objc_setAssociatedObject(self, @selector(sn_setCanMoveRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (boolBlock)sn_isCanMoveRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_isCanMoveRowBlock));
}

- (void)setSn_isCanMoveRowBlock:(boolBlock)sn_isCanMoveRowBlock {
    objc_setAssociatedObject(self, @selector(sn_isCanMoveRowBlock), sn_isCanMoveRowBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_isCanMoveRowBlock) {
        return self.sn_isCanMoveRowBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_setCanMoveRow:)]) {
        boolBlock block = objc_getAssociatedObject(self, @selector(sn_setCanMoveRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return YES;
            //            return NO;
        }
    } else {
        return YES;
        //            return NO;
    }
}


#pragma mark -- Delegate
// Display customization
- (void)sn_willDisplayCell:(tableCellIndexInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_willDisplayCell:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableCellIndexInfoBlock)sn_willDisplayCellBlock {
    return objc_getAssociatedObject(self, @selector(sn_willDisplayCellBlock));
}

- (void)setSn_willDisplayCellBlock:(tableCellIndexInfoBlock)sn_willDisplayCellBlock {
    objc_setAssociatedObject(self, @selector(sn_willDisplayCellBlock), sn_willDisplayCellBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_willDisplayCellBlock) {
        self.sn_willDisplayCellBlock(tableView, cell, indexPath);
    } else if ([self respondsToSelector:@selector(sn_willDisplayCell:)]) {
        tableCellIndexInfoBlock block = objc_getAssociatedObject(self, @selector(sn_willDisplayCell:));
        if (block) {
            block(tableView, cell, indexPath);
        }
    }
}



- (void)sn_willDisplayHeaderView:(tableViewSectionInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_willDisplayHeaderView:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableViewSectionInfoBlock)sn_willDisplayHeaderViewBlock {
    return objc_getAssociatedObject(self, @selector(sn_willDisplayHeaderViewBlock));
}

- (void)setSn_willDisplayHeaderViewBlock:(tableViewSectionInfoBlock)sn_willDisplayHeaderViewBlock {
    objc_setAssociatedObject(self, @selector(sn_willDisplayHeaderViewBlock), sn_willDisplayHeaderViewBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.sn_willDisplayHeaderViewBlock) {
        self.sn_willDisplayHeaderViewBlock(tableView, view, section);
    } else if ([self respondsToSelector:@selector(sn_willDisplayHeaderView:)]) {
        tableViewSectionInfoBlock block = objc_getAssociatedObject(self, @selector(sn_willDisplayHeaderView:));
        if (block) {
            block(tableView, view, section);
        }
    }
}



- (void)sn_willDisplayFooterView:(tableViewSectionInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_willDisplayFooterView:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableViewSectionInfoBlock)sn_willDisplayFooterViewBlock {
    return objc_getAssociatedObject(self, @selector(sn_willDisplayFooterViewBlock));
}

- (void)setSn_willDisplayFooterViewBlock:(tableViewSectionInfoBlock)sn_willDisplayFooterViewBlock {
    objc_setAssociatedObject(self, @selector(sn_willDisplayFooterViewBlock), sn_willDisplayFooterViewBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if (self.sn_willDisplayFooterViewBlock) {
        self.sn_willDisplayFooterViewBlock(tableView, view, section);
    } else if ([self respondsToSelector:@selector(sn_willDisplayFooterView:)]) {
        tableViewSectionInfoBlock block = objc_getAssociatedObject(self, @selector(sn_willDisplayFooterView:));
        if (block) {
            block(tableView, view, section);
        }
    }
}


- (void)sn_didEndDisplayingCell:(tableCellIndexInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingCell:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableCellIndexInfoBlock)sn_didEndDisplayingCellBlock {
    return objc_getAssociatedObject(self, @selector(sn_didEndDisplayingCellBlock));
}

- (void)setSn_didEndDisplayingCellBlock:(tableCellIndexInfoBlock)sn_didEndDisplayingCellBlock {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingCellBlock), sn_didEndDisplayingCellBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    if (self.sn_didEndDisplayingCellBlock) {
        self.sn_didEndDisplayingCellBlock(tableView, cell, indexPath);
    } else if ([self respondsToSelector:@selector(sn_didEndDisplayingCell:)]) {
        tableCellIndexInfoBlock block = objc_getAssociatedObject(self, @selector(sn_didEndDisplayingCell:));
        if (block) {
            block(tableView, cell, indexPath);
        }
    }
}



- (void)sn_didEndDisplayingHeader:(tableViewSectionInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingHeader:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableViewSectionInfoBlock)sn_didEndDisplayingHeaderBlock {
    return objc_getAssociatedObject(self, @selector(sn_didEndDisplayingHeaderBlock));
}

- (void)setSn_didEndDisplayingHeaderBlock:(tableViewSectionInfoBlock)sn_didEndDisplayingHeaderBlock {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingHeaderBlock), sn_didEndDisplayingHeaderBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section  {
    if (self.sn_didEndDisplayingHeaderBlock) {
        self.sn_didEndDisplayingHeaderBlock(tableView, view, section);
    } else if ([self respondsToSelector:@selector(sn_didEndDisplayingHeader:)]) {
        tableViewSectionInfoBlock block = objc_getAssociatedObject(self, @selector(sn_didEndDisplayingHeader:));
        if (block) {
            block(tableView, view, section);
        }
    }
}



- (void)sn_didEndDisplayingFooter:(tableViewSectionInfoBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingFooter:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableViewSectionInfoBlock)sn_didEndDisplayingFooterBlock {
    return objc_getAssociatedObject(self, @selector(sn_didEndDisplayingFooterBlock));
}

- (void)setSn_didEndDisplayingFooterBlock:(tableViewSectionInfoBlock)sn_didEndDisplayingFooterBlock {
    objc_setAssociatedObject(self, @selector(sn_didEndDisplayingFooterBlock), sn_didEndDisplayingFooterBlock, OBJC_ASSOCIATION_COPY);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section  {
    if (self.sn_didEndDisplayingHeaderBlock) {
        self.sn_didEndDisplayingHeaderBlock(tableView, view, section);
    } else if ([self respondsToSelector:@selector(sn_didEndDisplayingFooter:)]) {
        tableViewSectionInfoBlock block = objc_getAssociatedObject(self, @selector(sn_didEndDisplayingFooter:));
        if (block) {
            block(tableView, view, section);
        }
    }
}


// Variable height support
- (void)sn_setHeightForRow:(heightSetByIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setHeightForRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIndexBlock)sn_rowHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_rowHeightBlock));
}

- (void)setSn_rowHeightBlock:(heightSetByIndexBlock)sn_rowHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_rowHeightBlock), sn_rowHeightBlock, OBJC_ASSOCIATION_COPY);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.sn_rowHeightBlock) {
        return self.sn_rowHeightBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_setHeightForRow:)]) {
        heightSetByIndexBlock block = objc_getAssociatedObject(self, @selector(sn_setHeightForRow:));
        if (block) {
           return block(tableView, indexPath);
        } else {
            return self.rowHeight;
        }
    } else {
        return self.rowHeight;
    }
}




- (void)sn_setHeightForHeader:(heightSetByIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setHeightForHeader:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIntBlock)sn_headerHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_headerHeightBlock));
}

- (void)setSn_headerHeightBlock:(heightSetByIntBlock)sn_headerHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_headerHeightBlock), sn_headerHeightBlock, OBJC_ASSOCIATION_COPY);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.sn_headerHeightBlock ) {
        return self.sn_headerHeightBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setHeightForHeader:)]) {
        heightSetByIntBlock block = objc_getAssociatedObject(self, @selector(sn_setHeightForHeader:));
        if (block) {
           return block(tableView, section);
        } else {
            return self.sectionHeaderHeight;
        }
    } else {
        return self.sectionHeaderHeight;
    }
//    return 44;
}



- (void)sn_setHeightForFooter:(heightSetByIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setHeightForFooter:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIntBlock)sn_footerHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_footerHeightBlock));
}

- (void)setSn_footerHeightBlock:(heightSetByIntBlock)sn_footerHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_footerHeightBlock), sn_footerHeightBlock, OBJC_ASSOCIATION_COPY);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.sn_footerHeightBlock ) {
        return self.sn_footerHeightBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setHeightForFooter:)]) {
        heightSetByIntBlock block = objc_getAssociatedObject(self, @selector(sn_setHeightForFooter:));
        if (block) {
           return block(tableView, section);
        } else {
            return self.sectionFooterHeight;
        }
    } else {
        return self.sectionFooterHeight;
    }
}


- (void)sn_setEstimatedHeightForRow:(heightSetByIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setEstimatedHeightForRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIndexBlock)sn_rowEstimatedHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_rowEstimatedHeightBlock));
}

- (void)setSn_rowEstimatedHeightBlock:(heightSetByIndexBlock)sn_rowEstimatedHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_rowEstimatedHeightBlock), sn_rowEstimatedHeightBlock, OBJC_ASSOCIATION_COPY);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0) {
    
    if (self.sn_rowEstimatedHeightBlock) {
        return self.sn_rowEstimatedHeightBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_setEstimatedHeightForRow:)]) {
        heightSetByIndexBlock block = objc_getAssociatedObject(self, @selector(sn_setHeightForRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return self.estimatedRowHeight;
        }
    } else {
        return self.estimatedRowHeight;
    }
}



- (void)sn_setEstimatedHeightForHeader:(heightSetByIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setEstimatedHeightForHeader:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIntBlock)sn_headerEstimatedHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_headerEstimatedHeightBlock));
}

- (void)setSn_headerEstimatedHeightBlock:(heightSetByIntBlock)sn_headerEstimatedHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_headerEstimatedHeightBlock), sn_headerEstimatedHeightBlock, OBJC_ASSOCIATION_COPY);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    
    if (self.sn_headerEstimatedHeightBlock ) {
        return self.sn_headerEstimatedHeightBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setEstimatedHeightForHeader:)]) {
        heightSetByIntBlock block = objc_getAssociatedObject(self, @selector(sn_setEstimatedHeightForHeader:));
        if (block) {
            return block(tableView, section);
        } else {
            return self.estimatedSectionHeaderHeight;
        }
    } else {
        return self.estimatedSectionHeaderHeight;
    }
}


- (void)sn_setEstimatedHeightForFooter:(heightSetByIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setEstimatedHeightForFooter:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (heightSetByIntBlock)sn_footerEstimatedHeightBlock {
    return objc_getAssociatedObject(self, @selector(sn_footerEstimatedHeightBlock));
}

- (void)setSn_footerEstimatedHeightBlock:(heightSetByIntBlock)sn_footerEstimatedHeightBlock {
    objc_setAssociatedObject(self, @selector(sn_footerEstimatedHeightBlock), sn_footerEstimatedHeightBlock, OBJC_ASSOCIATION_COPY);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    if (self.sn_footerEstimatedHeightBlock ) {
        return self.sn_footerEstimatedHeightBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setEstimatedHeightForFooter:)]) {
        heightSetByIntBlock block = objc_getAssociatedObject(self, @selector(sn_setEstimatedHeightForFooter:));
        if (block) {
            return block(tableView, section);
        } else {
            return self.estimatedSectionFooterHeight;
        }
    } else {
        return self.estimatedSectionFooterHeight;
    }
}




- (void)sn_setSectionHeaderView:(viewTableIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setSectionHeaderView:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (viewTableIntBlock)sn_sectionHeaderViewBlock {
    return objc_getAssociatedObject(self, @selector(sn_sectionHeaderViewBlock));
}

- (void)setSn_sectionHeaderViewBlock:(viewTableIntBlock)sn_sectionHeaderViewBlock {
    objc_setAssociatedObject(self, @selector(sn_sectionHeaderViewBlock), sn_sectionHeaderViewBlock, OBJC_ASSOCIATION_COPY);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.sn_sectionHeaderViewBlock ) {
        return self.sn_sectionHeaderViewBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setSectionHeaderView:)]) {
        viewTableIntBlock block = objc_getAssociatedObject(self, @selector(sn_setSectionHeaderView:));
        if (block) {
            return block(tableView, section);
        } else {
            return self.tableHeaderView;
        }
    } else {
        return self.tableHeaderView;
    }
}

- (void)sn_setSectionFooterView:(viewTableIntBlock)info {
    objc_setAssociatedObject(self, @selector(sn_setSectionFooterView:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (viewTableIntBlock)sn_sectionFooterViewBlock {
    return objc_getAssociatedObject(self, @selector(sn_sectionFooterViewBlock));
}

- (void)setSn_sectionFooterViewBlock:(viewTableIntBlock)sn_sectionFooterViewBlock {
    objc_setAssociatedObject(self, @selector(sn_sectionFooterViewBlock), sn_sectionFooterViewBlock, OBJC_ASSOCIATION_COPY);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.sn_sectionFooterViewBlock ) {
        return self.sn_sectionFooterViewBlock(tableView, section);
    } else if ([self respondsToSelector:@selector(sn_setSectionFooterView:)]) {
        viewTableIntBlock block = objc_getAssociatedObject(self, @selector(sn_setSectionFooterView:));
        if (block) {
            return block(tableView, section);
        } else {
            return self.tableFooterView;
        }
    } else {
        return self.tableFooterView;
    }
}




- (void)sn_accessoryButtonTappedRow:(tableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_accessoryButtonTappedRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (tableIndexBlock)sn_accessoryButtonTapBlock {
    return objc_getAssociatedObject(self, @selector(sn_accessoryButtonTapBlock));
}

- (void)setSn_accessoryButtonTapBlock:(tableIndexBlock)sn_accessoryButtonTapBlock {
    objc_setAssociatedObject(self, @selector(sn_accessoryButtonTapBlock), sn_accessoryButtonTapBlock, OBJC_ASSOCIATION_COPY);
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_accessoryButtonTapBlock ) {
        return self.sn_accessoryButtonTapBlock(tableView, indexPath);
    } else if ([self respondsToSelector:@selector(sn_accessoryButtonTappedRow:)]) {
        tableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_accessoryButtonTappedRow:));
        if (block) {
            return block(tableView, indexPath);
        }
    }
}

- (void)sn_willSelectRow:(indexTableIndex)info {
    objc_setAssociatedObject(self, @selector(sn_willSelectRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (indexTableIndex)sn_willSelectRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_willSelectRowBlock));
}

- (void)setSn_willSelectRowBlock:(indexTableIndex)sn_willSelectRowBlock {
    objc_setAssociatedObject(self, @selector(sn_willSelectRowBlock), sn_willSelectRowBlock, OBJC_ASSOCIATION_COPY);
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_willSelectRowBlock) {
        return self.sn_willSelectRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_willSelectRow:)]) {
        indexTableIndex block = objc_getAssociatedObject(self, @selector(sn_willSelectRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return indexPath;
        }
    } else {
        return indexPath;
    }
}

- (void)sn_willDeselectRow:(indexTableIndex)info {
    objc_setAssociatedObject(self, @selector(sn_willDeselectRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (indexTableIndex)sn_willDeselectRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_willDeselectRowBlock));
}

- (void)setSn_willDeselectRowBlock:(indexTableIndex)sn_willDeselectRowBlock {
    objc_setAssociatedObject(self, @selector(sn_willDeselectRowBlock), sn_willDeselectRowBlock, OBJC_ASSOCIATION_COPY);
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_willDeselectRowBlock) {
        return self.sn_willDeselectRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_willDeselectRow:)]) {
        indexTableIndex block = objc_getAssociatedObject(self, @selector(sn_willDeselectRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return indexPath;
        }
    } else {
        return indexPath;
    }
}



// Called after the user changes the selection.
- (void)sn_didSelectRow:(tableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didSelectRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (tableIndexBlock)sn_didSelectRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_didSelectRowBlock));
}
- (void)setSn_didSelectRowBlock:(tableIndexBlock)sn_didSelectRowBlock {
    objc_setAssociatedObject(self, @selector(sn_didSelectRowBlock), sn_didSelectRowBlock, OBJC_ASSOCIATION_COPY);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_didSelectRowBlock) {
        return self.sn_didSelectRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_didSelectRow:)]) {
        tableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_didSelectRow:));
        if (block) {
             block(tableView, indexPath);
        }
    }
}


- (void)sn_didDeselectRow:(tableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didDeselectRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (tableIndexBlock)sn_didDeselectRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_didDeselectRowBlock));
}
- (void)setSn_didDeselectRowBlock:(tableIndexBlock)sn_didDeselectRowBlock {
    objc_setAssociatedObject(self, @selector(sn_didDeselectRowBlock), sn_didDeselectRowBlock, OBJC_ASSOCIATION_COPY);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_didDeselectRowBlock) {
        return self.sn_didDeselectRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_didDeselectRow:)]) {
        tableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_didDeselectRow:));
        if (block) {
            block(tableView, indexPath);
        }
    }
}

- (void)sn_editingRowStyle:(cellEditStyleTableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_editingRowStyle:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (cellEditStyleTableIndexBlock)sn_editingRowStyleBlock {
    return objc_getAssociatedObject(self, @selector(sn_editingRowStyleBlock));
}
- (void)setSn_editingRowStyleBlock:(cellEditStyleTableIndexBlock)sn_editingRowStyleBlock {
    objc_setAssociatedObject(self, @selector(sn_editingRowStyleBlock), sn_editingRowStyleBlock, OBJC_ASSOCIATION_COPY);
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_editingRowStyleBlock) {
        return self.sn_editingRowStyleBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_editingRowStyle:)]) {
        cellEditStyleTableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_editingRowStyle:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return UITableViewCellEditingStyleDelete;
        }
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}


- (void)sn_titleDeleteConfirmationButtonRow:(stringTableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_titleDeleteConfirmationButtonRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (stringTableIndexBlock)sn_titleDeleteConformationButtonRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_titleDeleteConformationButtonRowBlock));
}
- (void)setSn_titleDeleteConformationButtonRowBlock:(stringTableIndexBlock)sn_titleDeleteConformationButtonRowBlock {
    objc_setAssociatedObject(self, @selector(sn_titleDeleteConformationButtonRowBlock), sn_titleDeleteConformationButtonRowBlock, OBJC_ASSOCIATION_COPY);
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_titleDeleteConformationButtonRowBlock) {
        return self.sn_titleDeleteConformationButtonRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_titleDeleteConfirmationButtonRow:)]) {
        stringTableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_titleDeleteConfirmationButtonRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}


- (void)sn_editActionsRow:(rowActionsTableIndex)info {
    objc_setAssociatedObject(self, @selector(sn_editActionsRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (rowActionsTableIndex)sn_editActionsRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_editActionsRowBlock));
}
- (void)setSn_editActionsRowBlock:(rowActionsTableIndex)sn_editActionsRowBlock {
    objc_setAssociatedObject(self, @selector(sn_editActionsRowBlock), sn_editActionsRowBlock, OBJC_ASSOCIATION_COPY);
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_editActionsRowBlock) {
        return self.sn_editActionsRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_editActionsRow:)]) {
        rowActionsTableIndex block = objc_getAssociatedObject(self, @selector(sn_editActionsRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (void)sn_shouldIndentWhileEditingRow:(boolBlock)info {
    objc_setAssociatedObject(self, @selector(sn_shouldIndentWhileEditingRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (boolBlock)sn_shouldIndentWhileEditingRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_shouldIndentWhileEditingRowBlock));
}
- (void)setSn_shouldIndentWhileEditingRowBlock:(boolBlock)sn_shouldIndentWhileEditingRowBlock {
    objc_setAssociatedObject(self, @selector(sn_shouldIndentWhileEditingRowBlock), sn_shouldIndentWhileEditingRowBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_shouldIndentWhileEditingRowBlock) {
        return self.sn_shouldIndentWhileEditingRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_shouldIndentWhileEditingRow:)]) {
        boolBlock block = objc_getAssociatedObject(self, @selector(sn_shouldIndentWhileEditingRow:));
        if (block) {
            return block(tableView, indexPath);
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}


- (void)sn_willBeginEditingRow:(tableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_willBeginEditingRow:), info , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (tableIndexBlock)sn_willBeginEditingRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_willBeginEditingRowBlock));
}
- (void)setSn_willBeginEditingRowBlock:(tableIndexBlock)sn_willBeginEditingRowBlock {
    objc_setAssociatedObject(self, @selector(sn_willBeginEditingRowBlock), sn_willBeginEditingRowBlock, OBJC_ASSOCIATION_COPY);
}
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sn_willBeginEditingRowBlock) {
        return self.sn_willBeginEditingRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_willBeginEditingRow:)]) {
        tableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_willBeginEditingRow:));
        if (block) {
             block(tableView, indexPath);
        }
    }
}



- (void)sn_didEndEditingRow:(tableIndexBlock)info {
    objc_setAssociatedObject(self, @selector(sn_didEndEditingRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (tableIndexBlock)sn_didEndEditingRowBlock {
    return objc_getAssociatedObject(self, @selector(sn_didEndEditingRowBlock));
}
- (void)setSn_didEndEditingRowBlock:(tableIndexBlock)sn_didEndEditingRowBlock {
    objc_setAssociatedObject(self, @selector(sn_didEndEditingRowBlock), sn_didEndEditingRowBlock, OBJC_ASSOCIATION_COPY);
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath {
    if (self.sn_didEndEditingRowBlock) {
        return self.sn_didEndEditingRowBlock(tableView,indexPath);
    } else if ([self respondsToSelector:@selector(sn_didEndEditingRow:)]) {
        tableIndexBlock block = objc_getAssociatedObject(self, @selector(sn_didEndEditingRow:));
        if (block) {
            block(tableView, indexPath);
        }
    }
}

- (void)sn_targetIndexForMoveFromRow:(NSIndexPath *(^)(UITableView *, NSIndexPath *, NSIndexPath *))info {
    objc_setAssociatedObject(self, @selector(sn_targetIndexForMoveFromRow:), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if ([self respondsToSelector:@selector(sn_targetIndexForMoveFromRow:)]) {
        NSIndexPath *(^block)(UITableView*, NSIndexPath*,NSIndexPath*)  = objc_getAssociatedObject(self, @selector(sn_targetIndexForMoveFromRow:));
        if (block) {
           return block(tableView, sourceIndexPath, proposedDestinationIndexPath);
        } else {
            return sourceIndexPath;
        }
    } else {
        return sourceIndexPath;
    }
}
@end
