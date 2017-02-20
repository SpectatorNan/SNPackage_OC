//
//  UITableView+SeparationProtocol.h
//  refactorEatHome
//
//  Created by Spectator on 2017/2/9.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger (^intergerBlock)();
typedef NSString *(^stringBlock)(NSInteger );
typedef NSInteger (^rowNumberBlock)(NSInteger);
typedef UITableViewCell *(^tableViewCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^boolBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^tableCellIndexInfoBlock)(UITableView *tableView,UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^tableViewSectionInfoBlock)(UITableView *tableView, UIView *view, NSInteger section);
typedef CGFloat (^heightSetByIndexBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef CGFloat (^heightSetByIntBlock)(UITableView *tableView,NSInteger section);
typedef UIView *(^viewTableIntBlock)(UITableView *tableView, NSInteger indexPath);
typedef void (^tableIndexBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef NSIndexPath *(^indexTableIndex)(UITableView *tableView,NSIndexPath *indexPath);
typedef UITableViewCellEditingStyle (^cellEditStyleTableIndexBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef NSString *(^stringTableIndexBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef NSArray<UITableViewRowAction *>* (^rowActionsTableIndex)(UITableView *tableView, NSIndexPath* indexPath);

@interface UITableView (SeparationProtocol)<UITableViewDataSource,UITableViewDelegate>

- (void)sn_lazyProtocol;

- (void)sn_setSectionCount:(NSInteger (^)())count;
@property (nonatomic, copy) intergerBlock sn_sectionNumberBlock;

- (void)sn_setNumberOfRows:(NSInteger (^)())count;
@property (nonatomic, copy) rowNumberBlock sn_rowNumberBlock;

- (void)sn_setCell:(UITableViewCell * (^)(UITableView*, NSIndexPath*))info;
@property (nonatomic, copy) tableViewCellBlock sn_cellBlock;


- (void)sn_setTitleForHeader:(NSString * (^)(NSInteger *))title;
@property (nonatomic, copy) stringBlock sn_titleForHeaderBlock;

- (void)sn_setTitleForFooter:(NSString *(^)(NSInteger *))title;
@property (nonatomic, copy) stringBlock sn_titleForFooterBlock;

- (void)sn_setCanEditRow:(BOOL (^)(UITableView*, NSIndexPath*))info;
@property (nonatomic, copy) boolBlock sn_isCanEditRowBlock;

- (void)sn_setCanMoveRow:(BOOL (^)(UITableView*, NSIndexPath*))info;
@property (nonatomic, copy) boolBlock sn_isCanMoveRowBlock;


// Display customization
- (void)sn_willDisplayCell:(tableCellIndexInfoBlock)info;
@property (nonatomic, copy) tableCellIndexInfoBlock sn_willDisplayCellBlock;

- (void)sn_willDisplayHeaderView:(tableViewSectionInfoBlock)info;
@property (nonatomic, copy) tableViewSectionInfoBlock sn_willDisplayHeaderViewBlock;

- (void)sn_willDisplayFooterView:(tableViewSectionInfoBlock)info;
@property (nonatomic, copy) tableViewSectionInfoBlock sn_willDisplayFooterViewBlock;

- (void)sn_didEndDisplayingCell:(tableCellIndexInfoBlock)info;
@property (nonatomic, copy) tableCellIndexInfoBlock sn_didEndDisplayingCellBlock;

- (void)sn_didEndDisplayingHeader:(tableViewSectionInfoBlock)info;
@property (nonatomic, copy) tableViewSectionInfoBlock sn_didEndDisplayingHeaderBlock;

- (void)sn_didEndDisplayingFooter:(tableViewSectionInfoBlock)info;
@property (nonatomic, copy) tableViewSectionInfoBlock sn_didEndDisplayingFooterBlock;


// Variable height support
- (void)sn_setHeightForRow:(heightSetByIndexBlock)info;
@property (nonatomic, copy) heightSetByIndexBlock sn_rowHeightBlock;

- (void)sn_setHeightForHeader:(heightSetByIntBlock)info;
@property (nonatomic, copy) heightSetByIntBlock sn_headerHeightBlock;

- (void)sn_setHeightForFooter:(heightSetByIntBlock)info;
@property (nonatomic, copy) heightSetByIntBlock sn_footerHeightBlock;

// estimatedHeight
- (void)sn_setEstimatedHeightForRow:(heightSetByIndexBlock)info;
@property (nonatomic, copy) heightSetByIndexBlock sn_rowEstimatedHeightBlock;

- (void)sn_setEstimatedHeightForHeader:(heightSetByIntBlock)info;
@property (nonatomic, copy) heightSetByIntBlock sn_headerEstimatedHeightBlock;

- (void)sn_setEstimatedHeightForFooter:(heightSetByIntBlock)info;
@property (nonatomic, copy) heightSetByIntBlock sn_footerEstimatedHeightBlock;

- (void)sn_setSectionHeaderView:(viewTableIntBlock)info;
@property (nonatomic, copy) viewTableIntBlock sn_sectionHeaderViewBlock;

- (void)sn_setSectionFooterView:(viewTableIntBlock)info;
@property (nonatomic, copy) viewTableIntBlock sn_sectionFooterViewBlock;

- (void)sn_accessoryButtonTappedRow:(tableIndexBlock)info;
@property (nonatomic, copy) tableIndexBlock sn_accessoryButtonTapBlock;

- (void)sn_willSelectRow:(indexTableIndex)info;
@property (nonatomic, copy) indexTableIndex sn_willSelectRowBlock;

- (void)sn_willDeselectRow:(indexTableIndex)info;
@property (nonatomic, copy) indexTableIndex sn_willDeselectRowBlock;

- (void)sn_didSelectRow:(tableIndexBlock)info;
@property (nonatomic, copy) tableIndexBlock sn_didSelectRowBlock;

- (void)sn_didDeselectRow:(tableIndexBlock)info;
@property (nonatomic, copy) tableIndexBlock sn_didDeselectRowBlock;

- (void)sn_editingRowStyle:(cellEditStyleTableIndexBlock)info;
@property (nonatomic, copy) cellEditStyleTableIndexBlock sn_editingRowStyleBlock;

- (void)sn_titleDeleteConfirmationButtonRow:(stringTableIndexBlock)info NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
@property (nonatomic, copy) stringTableIndexBlock sn_titleDeleteConformationButtonRowBlock NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;

- (void)sn_editActionsRow:(rowActionsTableIndex)info NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;
@property (nonatomic, copy) rowActionsTableIndex sn_editActionsRowBlock NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

- (void)sn_shouldIndentWhileEditingRow:(boolBlock)info;
@property (nonatomic, copy) boolBlock sn_shouldIndentWhileEditingRowBlock;

- (void)sn_willBeginEditingRow:(tableIndexBlock)info;
@property (nonatomic, copy) tableIndexBlock sn_willBeginEditingRowBlock;

- (void)sn_didEndEditingRow:(tableIndexBlock)info;
@property (nonatomic, copy) tableIndexBlock sn_didEndEditingRowBlock;


/**


 @param info currentTableView sourceIndexPath proposedDestinationIndexPath
 */
- (void)sn_targetIndexForMoveFromRow:(NSIndexPath *(^)(UITableView*, NSIndexPath*,NSIndexPath*))info;

@end
