//
//  PhotoAlbumCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "PhotoAlbumCell.h"

@implementation PhotoAlbumCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self showBg];
}


-(CGFloat)heightForCellWidth:(id)data{
    return 200;
}


@end
