//
//  MyProfileViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/27.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MyProfileViewController.h"
#import "UIButton+WebCache.h"
#import "ActionSheetStringPicker.h"
#import "DIDaDatePicker.h"


#define kImgLength  640


@interface MyProfileViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property(nonatomic, strong)UIButton *avatarButton;
@property(nonatomic, strong)UIButton *titleButton;


@property(nonatomic, strong)NSArray *keyNames;
@property(nonatomic, strong)NSArray *values;

@property(nonatomic, strong)UIImage *uploadImage;

@end

@implementation MyProfileViewController

-(void)loadKeyAndValue{
    self.keyNames = @[@[@"昵称＊", @"性别", @"生日"], @[@"职业", @"岗位/专业", @"公司/学校", @"特长"], @[@"手机", @"微信"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本资料";
    [self loadKeyAndValue];
    
    UIView *view =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avatarButton.frame = CGRectMake(0, 0, 70, 70);
    self.avatarButton.layer.cornerRadius = 35.0f;
    self.avatarButton.clipsToBounds = YES;
    self.avatarButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.avatarButton.layer.borderWidth = 0.5;
    
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201112/08/20111208233330_FCHvf.jpg"] forState:UIControlStateNormal];
    
    
    self.titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.titleButton.frame = CGRectMake(0, 0, 70, 20);
    self.titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleButton.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    self.titleButton.titleLabel.textColor = RGBCOLOR(46, 156, 220);
    [self.titleButton setTitle:@"点击上传头像" forState:UIControlStateNormal];
    
    self.titleButton.centerX = self.view.width / 2;
    self.avatarButton.centerX = self.view.width / 2;
    self.avatarButton.top = 10;
    self.titleButton.top = self.avatarButton.bottom + 5;
    [self.avatarButton addTarget:self action:@selector(changeAvatar:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleButton addTarget:self action:@selector(changeAvatar:) forControlEvents:UIControlEventTouchUpInside];

    
    [view addSubview:self.avatarButton];
    [view addSubview:self.titleButton];
    self.tableView.tableHeaderView = view;
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num;
    switch (section) {
        case 0:
            num = 3;
            break;
        case 1:
            num = 4;
            break;
        case 2:
            num = 2;
            break;
        default:
            break;
    }
    return num;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 20)];
    lab.centerY = view.height / 2;
    [view addSubview:lab];
    
    view.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:14.0f];
    lab.textColor = DIDA_TEXT_COLOR;
    NSString *str;
    switch (section) {
        case 0:
            str = @"基本资料设置";
            break;
        case 1:
            str = @"职业特长";
            break;
        case 2:
            str = @"联系方式";
            break;
        default:
            break;
    }
    lab.text = str;
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiDaTableViewCell *cell = (DiDaTableViewCell*)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.needSeparator = NO;
    cell.textLabel.text = [[self.keyNames objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.textLabel.textColor = DIDA_TEXT_COLOR;
    cell.detailTextLabel.text = @"michal";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 1) {

        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择男女"
                                                           delegate:nil
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:@"xxx"
                                                  otherButtonTitles:@"男", @"女", nil];
        [sheet showInView:self.view];
        return;
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        DIDaDatePicker *picker = [[DIDaDatePicker alloc] initWithBlock:^(BOOL isSelected, NSDate *date) {
            
        }];
        [picker show];
        return;
    }

    
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"修改昵称"
                                                   message:@"xxxx"
                                                  delegate:nil
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"确定",nil];
    view.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *field = [view textFieldAtIndex:0];
    field.text = @"昵称";
    [view show];
    
}


-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleSingleLine;
}

-(UITableViewCellStyle)DiDaTableViewCellStyle{
    return UITableViewCellStyleValue1;
}

-(void)changeAvatar:(UIButton*)button{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *menuActionSheet = [[UIActionSheet alloc]
                                          initWithTitle:nil
                                          delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"取消", "")
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:NSLocalizedString(@"从相册选取", ""),
                                          NSLocalizedString(@"拍张新照片", ""),nil];
        
        menuActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [menuActionSheet showInView:[[UIApplication sharedApplication].delegate window]];
    }
    else {
        UIActionSheet *menu = [[UIActionSheet alloc]
                               initWithTitle:nil
                               delegate:self
                               cancelButtonTitle:NSLocalizedString(@"取消", "")
                               destructiveButtonTitle:nil
                               otherButtonTitles:NSLocalizedString(@"从相册选取", ""),nil];
        menu.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [menu showInView:[[UIApplication sharedApplication].delegate window]];
    }
    
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UIImagePickerController* cameraPicker=[[UIImagePickerController alloc] init];
        cameraPicker.delegate = self;
        cameraPicker.allowsEditing = YES;
        cameraPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:cameraPicker animated:YES completion:^{
            
        }];
    }
    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && buttonIndex == 1) {
        UIImagePickerController* cameraPicker=[[UIImagePickerController alloc] init];
        cameraPicker.delegate = self;
        cameraPicker.allowsEditing = YES;
        cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:cameraPicker animated:YES completion:^{
            
        }];
        
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSString *mediaType =[NSString stringWithFormat:[info objectForKey:UIImagePickerControllerMediaType] ,nil];
    if ([mediaType isEqualToString:@"public.image"]) {
        //添加图片处理view
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        if (image == nil) {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        if (image.size.width > kImgLength || image.size.height > kImgLength) {
            self.uploadImage = [self imageWithImageSimple:image scaledToSize:CGSizeMake(kImgLength, kImgLength)];
        }
        else {
            self.uploadImage = image;
        }
        [self.avatarButton setImage:image forState:UIControlStateNormal];
        //[self requestChangeAvatarImg];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([navigationController isKindOfClass:[UIImagePickerController class]]) {
        if (((UIImagePickerController*)navigationController).sourceType == UIImagePickerControllerSourceTypeCamera) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }
    }
}

- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



@end
