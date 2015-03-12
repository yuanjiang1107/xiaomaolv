//
//  MyDRFListViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/28.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MyDRFListViewController.h"
#import "AvatarView.h"
#import "DiDaSegmentControl.h"
#import "DiDaSelectControl.h"
#import "OwnerFeedCell.h"
#import "DreamCell.h"
#import "MyDreamCell.h"

@interface MyDRFListViewController ()


@property(nonatomic, strong) UIImageView *avatar;

@property(nonatomic, strong) UILabel *userNameLb;

@property(nonatomic, strong) UILabel *desLb;

@property(nonatomic, strong) UIImageView *genderIcon;


@property(nonatomic, strong) DiDaSelectControl* selectControl;

@property(nonatomic, strong) DiDaSegmentControl *segmentControl;

@property(nonatomic, assign) MyDRFListSelectedType selectedType;
@property(nonatomic, assign) MyDRFListSubtype subtype;

@end

@implementation MyDRFListViewController

-(instancetype)initWithSelectedType:(MyDRFListSelectedType)type{
    self = [super init];
    if (self) {
        self.selectedType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    
    if (self.selectedType == MyDRFListSelectedTypeFeed) {
        self.segmentControl = nil;
    }else{
        [self configSegmentControlWith:@[@"我发布的梦想", @"我关注的梦想"]];
    }
    self.selectControl = [[DiDaSelectControl  alloc] initWithSegmentCount:2 selectedBlock:^(NSInteger index) {
        if (index == 0) {
            [self configSegmentControlWith:@[@"我发布的梦想", @"我关注的梦想"]];
            self.selectedType = MyDRFListSelectedTypeDream;
            [self.tableView reloadData];
        }else{
            self.segmentControl = nil;
            self.selectedType = MyDRFListSelectedTypeFeed;
            [self.tableView reloadData];
        }
        self.tableView.tableHeaderView = [self configHeader];
    }];
    
    self.selectControl.selectedIndex = self.selectedType;
    
    self.tableView.tableHeaderView = [self configHeader];

    
}

-(void)configSegmentControlWith:(NSArray*)titles{
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:titles eventCallBack:^(NSInteger selectedIndex) {
        self.subtype = selectedIndex;
        [self.tableView reloadData];
    }];
}

-(UIView*)configHeader{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    self.avatar = [AvatarView avatarWithFrame:CGRectMake(0, 0, 50, 50) image:nil borderColor:[UIColor blackColor]];
    self.avatar.translatesAutoresizingMaskIntoConstraints = NO;
    self.userNameLb = [[UILabel alloc] initForAutoLayout];
    self.desLb = [[UILabel alloc]initForAutoLayout];
    self.genderIcon = [[UIImageView alloc] initForAutoLayout];
    self.desLb.font = [UIFont systemFontOfSize:12.0f];
    [view addSubview:self.avatar];
    [view addSubview:self.userNameLb];
    [view addSubview:self.desLb];
    [view addSubview:self.genderIcon];
    
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _userNameLb, _desLb, _genderIcon);
    
    CGFloat offset;
    if (IOS8_OR_LATER) {
        offset = 110;
    }else{
        offset = 90;
    }
    NSString *conStr = [NSString stringWithFormat:@"H:|-%f-[_avatar(50)]-8-[_userNameLb]-5-[_genderIcon(10)]", offset];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:conStr
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-17-[_avatar(50)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-27-[_genderIcon(10)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-22-[_userNameLb]-3-[_desLb]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict]];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_avatar]-8-[_desLb]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:dict]];
    
    
    
    self.selectControl.top = 75;
    [view addSubview:self.selectControl];
    
    if (self.segmentControl != nil) {
        self.segmentControl.frame = CGRectMake(10, 0, self.view.width - 20, 30);
        self.segmentControl.top = self.selectControl.bottom + 15;
        [view addSubview:self.segmentControl];
        view.height = 150;
    }else{
        view.height = 115;
    }
    
    
    self.userNameLb.text = @"古道边";
    self.desLb.text = @"xxx路，xxx门";
    self.genderIcon.backgroundColor = [UIColor blackColor];
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201112/08/20111208233330_FCHvf.jpg"]];
    
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedType == MyDRFListSelectedTypeDream) {
        return 320.0;
    }else{
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}



-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedType == MyDRFListSelectedTypeFeed) {
        return [OwnerFeedCell class];
    }else{
        return [MyDreamCell class];
    }
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleNone;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:; forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
