//
//  CommentListCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/10.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import "CommentListCell.h"
#import "RTLabel.h"
#import "FeedCell.h"
#import "Comment.h"

#define formateForComment1  @"<a href='http://store.apple.com'>%@</a>回复<a href='http://www.google.com'>%@</a>: \"%@\""
#define formateForComment2  @"<a href='http://store.apple.com'>%@</a>: %@"

#define nameColor [UIColor redColor]

@interface CommentListCell()

@property(nonatomic, strong)RTLabel *contentLb;

@end

@implementation CommentListCell

- (void)awakeFromNib {
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentLb = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth] - 75, 0)];
        self.contentLb.linkAttributes = [NSDictionary dictionaryWithObjectsAndKeys:@"0", @"underline", @"#ff0000", @"color", nil];
        self.contentLb.selectedLinkAttributes = [NSDictionary dictionaryWithObjectsAndKeys:@"0", @"underline",@"#ff0000", @"color", nil];
        self.contentLb.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:self.contentLb];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize optimumSize = [self.contentLb optimumSize];
    CGRect frame = [self.contentLb frame];
    frame.size.height = (int)optimumSize.height+5;
    [self.contentLb setFrame:frame];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCellWithData:(id)data position:(CellPosition)position{    
    Comment *info = (Comment*)data;
    NSString *text;
    
    if ([info isKindOfClass:[Comment class]]) {
        if (info.toName == nil) {
            text = [NSString stringWithFormat:formateForComment2, info.fromName, info.content];
        }else{
            text = [NSString stringWithFormat:formateForComment1, info.fromName, info.toName, info.content];
        }
        self.contentLb.text = text;
        
    }
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    Comment *info = (Comment*)data;
    NSString *text;

    if ([info isKindOfClass:[Comment class]]) {
        if (info.toName == nil) {
            text = [NSString stringWithFormat:formateForComment2, info.fromName, info.content];
        }else{
            text = [NSString stringWithFormat:formateForComment1, info.fromName, info.toName, info.content];

        }
        RTLabel *lb = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, Feed_Content_Width, 0)];
        lb.text = text;
        CGSize size = [lb  optimumSize];
        return size.height + 5;
        
    }else{
        return 0;
    }
    
}

@end
