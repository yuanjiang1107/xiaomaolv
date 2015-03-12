//
//  ChatViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatMessage.h"
#import "ChatMessageBodyCell.h"



@interface ChatViewController ()<UITextFieldDelegate, NSFetchedResultsControllerDelegate>

@property(nonatomic, strong)UIView *bottomTool;
@property(nonatomic, strong)UITextField *inputField;
@property(nonatomic, strong)UIButton *moreButton;

@property(nonatomic, strong)UIView *maskVIew;
@end


#define testCellNum 15

#define testFrom 11111110

#define bottomToolHeight 49

@implementation ChatViewController

-(void)addTestMessage{
    ChatMessage *message = [ChatMessage  MR_createEntity];
    message.from = [NSNumber numberWithInt:testFrom];
    message.to = [NSNumber numberWithInt:CURRENT_USER_ID];
    message.content = @"小兔崽子";
    message.creatTime = [NSNumber numberWithLongLong:12345678];
    
    
    message = [ChatMessage  MR_createEntity];
    message.from = [NSNumber numberWithInt:CURRENT_USER_ID];
    message.to = [NSNumber numberWithInt:testFrom];
    message.content = @"小表咂";
    message.creatTime = [NSNumber numberWithLongLong:22345678];

    
    message = [ChatMessage  MR_createEntity];
    message.from = [NSNumber numberWithInt:testFrom];
    message.to = [NSNumber numberWithInt:CURRENT_USER_ID];
    message.content = @"今天余额宝收益降了0.1个百分比，损失过万了，换个微信的试试？";
    message.creatTime = [NSNumber numberWithLongLong:32345678];

    
    [message.managedObjectContext  MR_saveToPersistentStoreAndWait];

}


#define mark viewLoadProgress

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bottomTool = [[UIView alloc] init];
    [self.view addSubview:self.bottomTool];
    self.bottomTool.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
//    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.button setTitle:@"show" forState:UIControlStateNormal];
//    self.button.frame = CGRectMake(0, 0, 60, 40);
//    [self.bottomTool addSubview:self.button];
//    self.button.centerX = self.bottomTool.width / 2;
//    [self.button addTarget:self action:@selector(inputRequest:) forControlEvents:UIControlEventTouchUpInside];
//    [self addTestMessage];
    
        self.fetchController = [ChatMessage  MR_fetchAllSortedBy:@"creatTime"
                                                       ascending:YES
                                                   withPredicate:nil
                                                         groupBy:nil
                                                        delegate:self];

    
    
    self.bottomTool.frame = CGRectMake(0, self.view.height - bottomToolHeight, self.view.width, bottomToolHeight);
    self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - bottomToolHeight);
    
    self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(8, 8, self.view.width - 72, 34)];
    [self.bottomTool addSubview:self.inputField];
    self.inputField.backgroundColor = [UIColor whiteColor];
    self.inputField.returnKeyType = UIReturnKeySend;
    self.inputField.delegate = self;
    
    self.moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.moreButton.frame = CGRectMake(0, 0, 40, 40);
    self.moreButton.backgroundColor = [UIColor whiteColor];
    self.moreButton.right = self.bottomTool.width - 10;
    self.moreButton.centerY = self.bottomTool.height / 2;
    [self.moreButton addTarget:self action:@selector(moreButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomTool addSubview:self.moreButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowNotification:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHiddenNotification:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboarFrameWillChangedNotification:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];

    self.maskVIew = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.maskVIew addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewEvent:)]];
    [self.maskVIew addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewEvent:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.bottomTool];
}

-(void)firstDidApear{
    [super firstDidApear];
    self.tableView.scrollsToTop = YES;
}

-(void)firstDidLayoutSubViews{
    [super firstDidLayoutSubViews];
    [self.tableView scrollToRowAtIndexPath:[self lastCellPath] atScrollPosition:UITableViewScrollPositionTop animated:NO];

}




#pragma mark tableViewConfig

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.fetchController.fetchedObjects.count;
//}

//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
//    if (indexPath.row == testCellNum - 1) {
//        cell.textLabel.text = @"xxxx";
//    }else{
//        cell.textLabel.text = @"gggg";
//    }
//    return cell;
//}


-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ChatMessageBodyCell class];
}

-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStylePlain;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleNone;
}

-(NSIndexPath*)lastCellPath{
    NSIndexPath *path ;
    if (self.fetchController.fetchedObjects.count > 0) {
        path = [NSIndexPath indexPathForRow:self.fetchController.fetchedObjects.count - 1 inSection:0];
    }
    return path;
}


#pragma mark coreData

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[self lastCellPath] atScrollPosition:UITableViewScrollPositionTop animated:NO];

}


#pragma mark send and save Message
-(void)sendAndSaveMessage:(NSString*)text{
    ChatMessage *message = [ChatMessage  MR_createEntity];
    message.from = [NSNumber numberWithInt:CURRENT_USER_ID];
    message.to = [NSNumber numberWithInt:testFrom];
    message.content = text;
    message.creatTime = [NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]];
    [message.managedObjectContext  MR_saveToPersistentStoreAndWait];
}

#pragma mark moreButtonEvent

-(void)moreButtonEvent:(UIButton*)button{
    UIView *view;
}

-(UIView*)moreToolView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 55)];
    view.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
    view.alpha = 0.6;
    return view;
}

#pragma mark 键盘

-(void)maskViewEvent:(UIGestureRecognizer*)gest{
    [self.inputField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.inputField resignFirstResponder];
    if (![self.inputField.text isEqualToString:@""]) {
        [self sendAndSaveMessage:textField.text];
    }
    return YES;
}

-(void)keyboardWillShowNotification:(NSNotification*)not{
    [self.tableView scrollToRowAtIndexPath:[self lastCellPath] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self.view addSubview:self.maskVIew];
}

-(void)keyboardWillHiddenNotification:(NSNotification*)not{
    [self.maskVIew removeFromSuperview];
}

-(void)keyboarFrameWillChangedNotification:(NSNotification*)not{
    NSDictionary *info = not.userInfo;
    CGRect rect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval time = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSInteger options = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    [self changeContentFrame:rect.origin.y duration:time options:options];
}



-(void)changeContentFrame:(CGFloat)offset duration:(NSTimeInterval)duration options:(NSInteger)options{
    //position bottomTool
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:options];
    self.bottomTool.bottom = offset;
    [UIView commitAnimations];
    
    //position tableview
    NSIndexPath *path = [self lastCellPath];
    CGRect rect;
    if (path) {
        rect = [self.tableView rectForRowAtIndexPath:[self lastCellPath]];
    }
    CGFloat cellBottom = CGRectGetMaxY(rect) + 64;
    CGFloat keyboardBottom = offset - bottomToolHeight;
    if ((cellBottom) > (keyboardBottom)) {
        CGFloat dValue = cellBottom - keyboardBottom;
        CGFloat tableViewOffset = self.view.height - dValue;
        if (tableViewOffset < offset) {
            tableViewOffset = offset;
        }
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:options];
        self.tableView.bottom = tableViewOffset - bottomToolHeight;
        [UIView commitAnimations];
    }
    
    if (offset == self.view.height) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:options];
        self.tableView.bottom = self.view.height - bottomToolHeight;
        [UIView commitAnimations];

    }
    
}




@end
