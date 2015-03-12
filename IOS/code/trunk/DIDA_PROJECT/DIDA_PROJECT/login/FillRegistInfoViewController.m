//
//  FillRegistInfoViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//


#define kImgLength  640
#import "AppDelegate.h"

#import "FillRegistInfoViewController.h"

@interface FillRegistInfoViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

CREATE_STRONG UIButton *avatar;

CREATE_STRONG UIButton *doneButton;


CREATE_STRONG UIImage *uploadImage;

@end

@implementation FillRegistInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    S.avatar = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    S.avatar = [ViewCreatorHelper createButtonWithTitle:@"点击修改头像"
                                                  frame:CGRectMake(0, 0, 80, 80)
                                                  image:nil
                                                hlImage:nil
                                               disImage:nil
                                                 target:self
                                                 action:@selector(chooseAvatar:)];
    S.avatar.backgroundColor = [UIColor greenColor];
    
    S.doneButton = [ViewCreatorHelper createFrameButtonWithTitle:@"完成"
                                                           frame:CGRectMake(0, 0, 280, 40)
                                                          target:self
                                                          action:@selector(doneEvent:)];
    self.doneButton.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:S.avatar];
    [self.view addSubview:self.doneButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.avatar.top = 100;
    self.avatar.centerX = self.view.width / 2;
    
    self.doneButton.bottom = self.view.height - 50;
    self.doneButton.centerX = self.view.width / 2;
}


-(void)doneEvent:(UIButton*)button{
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    [del showRootViewVc];
}

-(void)chooseAvatar:(UIButton*)button{
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
