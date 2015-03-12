//
//  PrepareCell.h
//  dida
//
//  Created by he chao on 8/5/14.
//  Copyright (c) 2014 he chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvatarView.h"
@interface PrepareCell : UITableViewCell{
    UIImageView *imgBg,*imgCover,*imgMark,*progressBg,*progress;
    AvatarView *avatar;
    UILabel *title,*description,*price,*name,*value[3];
}
@property (nonatomic, strong) NSMutableDictionary *dictDream;

- (void)initSelf;
- (void)load;

@end
