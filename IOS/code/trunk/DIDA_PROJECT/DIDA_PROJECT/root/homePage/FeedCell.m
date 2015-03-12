//
//  FeedCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/9.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import "FeedCell.h"
#import "AvatarView.h"
#import "CommentListCell.h"
#import "CommentInfo.h"
#import "Feed.h"


@interface FeedCell()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)AvatarView *userAvatar;

@property(nonatomic, strong)UILabel *userName;

@property(nonatomic, strong)UIButton *dreamDisclusure;

@property(nonatomic, strong)UILabel *content;

@property(nonatomic, strong)UIButton *moreButton;

@property(nonatomic, strong)UILabel *timeLb;

@property(nonatomic, strong)UIButton *replyButton;

@property(nonatomic, strong)NSLayoutConstraint *heightConstraint;

@property(nonatomic, strong)UITableView* tableView;

@property(nonatomic, strong)Feed *feedInfo;

@property(nonatomic, strong)NSArray *commentList;



@end



@implementation FeedCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userAvatar = [AvatarView avatarWithFrame:CGRectMake(0, 0, 50, 50)
                                                image:nil
                                          borderColor:[UIColor grayColor]];
        self.userAvatar.translatesAutoresizingMaskIntoConstraints  = NO;
        self.userName = [[UILabel alloc] init];
        
        self.dreamDisclusure = [UIButton buttonWithType:UIButtonTypeSystem];
        self.dreamDisclusure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        self.content = [FeedCell FeedContentLb];
        self.content.numberOfLines = 0;
        
        self.moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.moreButton addTarget:self action:@selector(foldOrUnfoldEvent:) forControlEvents:UIControlEventTouchUpInside];
        self.moreButton.contentMode = UIViewContentModeLeft;
        self.moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        self.timeLb = [[UILabel alloc ] init];;
        
        self.replyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.replyButton setTitle:@"回复" forState:UIControlStateNormal];
        [self.replyButton addTarget:self action:@selector(replyEvent:to:) forControlEvents:UIControlEventTouchUpInside];
        self.content.textColor = [UIColor blackColor];
        self.userName.textColor = [UIColor blackColor];
        
        [self addsubviewToContentView:@[_userAvatar, _userName, _dreamDisclusure, _content, _moreButton, _timeLb, _replyButton]];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Feed_Content_Width, 0) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.scrollEnabled = NO;
        self.tableView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.tableView];
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    self.userAvatar.frame = CGRectMake(0, 0, 50, 50);
    self.userAvatar.left = 10;
    self.userAvatar.top = 10;
    self.userName.frame = CGRectMake(0, 0, 100, 15);
    self.userName.left = self.userAvatar.right + 5;
    self.userName.top = 10;
    
    CGFloat contentWidth = 0;
    CGFloat offset = 10 + 50 + 5 + 10;
    contentWidth = [UIDevice screenWidth] - offset;
    
    
    self.dreamDisclusure.frame = CGRectMake(0, 0, contentWidth, 25);
    self.dreamDisclusure.left = self.userAvatar.right + 5;
    self.dreamDisclusure.top = self.userName.bottom + 5;
    
    CGFloat contentHeight = [self.content.text heightForLb:self.content constrainedToWidth:contentWidth];
    
    BOOL needFoldOrUnfoldButton;
    
    if (contentHeight > Feed_Content_Default_Height) {
        if (self.unfold) {
            [self.moreButton setTitle:@"收起" forState:UIControlStateNormal];
            
        }else{
            contentHeight = Feed_Content_Default_Height;
            [self.moreButton setTitle:@"展开" forState:UIControlStateNormal];
        }
        needFoldOrUnfoldButton = YES;
        
    }else{
        needFoldOrUnfoldButton = NO;
        [self.moreButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    self.content.frame = CGRectMake(0, 0, contentWidth, contentHeight);
    
    
    self.content.left = self.userAvatar.right + 5;
    self.content.top = self.dreamDisclusure.bottom + 5;
    
    
    if (contentHeight > Feed_Content_Default_Height) {
        contentHeight = Feed_Content_Default_Height;
    }
    
    
    
    self.moreButton.frame = CGRectMake(0, 0, 40, 30);
    self.moreButton.left = self.userAvatar.right + 5;
    self.moreButton.top = self.content.bottom;
    
    
    
    self.timeLb.frame = CGRectMake(0, 0, 100, 20);
    self.timeLb.left = self.userAvatar.right + 5;
    self.timeLb.top = self.moreButton.bottom + 5;
    if (needFoldOrUnfoldButton) {
        self.timeLb.top = self.moreButton.bottom + 5;
    }else{
        self.timeLb.top = self.content.bottom + 5;
    }

    [self.replyButton sizeToFit];
    self.replyButton.right = self.content.right;
    self.replyButton.centerY = self.timeLb.centerY;
    
    self.tableView.top = self.timeLb.bottom + 5;
    self.tableView.left = self.userAvatar.right;
    
}

-(void)fillCommentList:(NSSet*)set{
    self.commentList = [FeedCell sortArray:set];
}

+(UILabel*)FeedContentLb{
    UILabel *lb = [[UILabel alloc] init];
    return lb;
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    Feed *feedInfo = (Feed*)data;
    UILabel *lable = [FeedCell FeedContentLb];
    CGFloat contentHeight = [feedInfo.content heightForLb:lable constrainedToWidth:Feed_Content_Width];
    
    if (!feedInfo.unfold.boolValue) {
        if (contentHeight > Feed_Content_Default_Height) {
            contentHeight = Feed_Content_Default_Height;
        }
    }
    
    NSArray *array = [self sortArray:feedInfo.commentList];
    
    CGFloat height = contentHeight + 120 + [self calculateCommentHeight:array] + 10;
    return height;
}


+(NSArray*)sortArray:(NSSet*)set{
    if (set.count == 0) {
        return nil;
    }
    NSArray *array = [set allObjects];
    NSSortDescriptor *dpr = [NSSortDescriptor sortDescriptorWithKey:@"fromName" ascending:YES];
    NSArray *array2 = [array sortedArrayUsingDescriptors:@[dpr]];
    return [NSArray arrayWithArray:array2];
}


+(CGFloat)calculateCommentHeight:(NSArray*)commentInfos{
    CGFloat height = 0;
    for (Comment *info in commentInfos) {
        height += [CommentListCell heightForClassCellWidth:info position:0];
    }
    return height;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.commentList = nil;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    Feed *feedInfo = (Feed*)data;
    
    [self.tableView reloadData];

    
    self.userAvatar.backgroundColor = [UIColor blackColor];
    self.userName.text = feedInfo.ownerName;
    [self.dreamDisclusure setTitle:@"xxxxx梦想" forState:UIControlStateNormal];
    self.content.text = feedInfo.content;
    
    self.unfold = feedInfo.unfold.boolValue;
    self.feedInfo = feedInfo;
    self.timeLb.text = @"2015-1-1";
    
    self.tableView.height = [FeedCell calculateCommentHeight:self.commentList];
}

-(void)foldOrUnfoldEvent:(UIButton*)button{
    self.feedInfo.unfold = [NSNumber numberWithBool:!self.feedInfo.unfold.boolValue];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CommentListCell heightForClassCellWidth:[self.commentList objectAtIndex:indexPath.row] position:0];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentListCell *cell = [[CommentListCell alloc] init];
    Comment *comment = [self.commentList objectAtIndex:indexPath.row];
    [cell configCellWithData:comment position:0];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



-(void)replyEvent:(Feed*)feed to:(NSString*)someOne{
    if ([self.ancestorsTableviewController respondsToSelector:@selector(showCommentInpute:withData:toUserId:toUserName:)]) {
        [self.ancestorsTableviewController  showCommentInpute:self withData:nil toUserId:111 toUserName:@"xxxxx"];
    }
    
}

@end
