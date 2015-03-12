//
//  ViewCreatorHelper.h
//  RenrenOfficial-iOS-Concept
//
//  Created by 田立彬 on 13-5-29.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <Foundation/Foundation.h>


@class RTLabel;
@class CBAutoScrollLabel;
@class SevenSwitch;
@class InsetsLabel;

@interface ViewCreatorHelper : NSObject


+(UIButton*)createAutoLayoutButton:(NSString*)title
                                    normaImage:(NSString*)normalImageKey
                                    highlitedImage:(NSString*)highlitedImageKey
                                    disableImage:(NSString*)disableImageKey
                                    target:(id)target
                                    action:(SEL)action;


+ (UIButton*)createButtonWithTitle:(NSString*)title
                             frame:(CGRect)frame
                        normaImage:(NSString*)normalImageKey
                    highlitedImage:(NSString*)highlitedImageKey
                      disableImage:(NSString*)disableImageKey
                            target:(id)target
                            action:(SEL)action;

+ (UIButton*)createIconButtonWithFrame:(CGRect)frame
                            normaImage:(NSString*)normalImageKey
                        highlitedImage:(NSString*)highlitedImageKey
                          disableImage:(NSString*)disableImageKey
                                target:(id)target
                                action:(SEL)action;

+ (UIButton*)createButtonWithTitle:(NSString*)title
                             frame:(CGRect)frame
                             image:(UIImage*)normalImage
                           hlImage:(UIImage*)highlitedImage
                          disImage:(UIImage*)disableImage
                            target:(id)target
                            action:(SEL)action;

+ (UIButton*)createFrameButtonWithTitle:(NSString*)title
                                  frame:(CGRect)frame
                                 target:(id)target
                                 action:(SEL)action;

+ (UIButton*)createRedFrameButtonWithTitle:(NSString*)title
                                     frame:(CGRect)frame
                                    target:(id)target
                                    action:(SEL)action;

+ (UILabel*)createLabelWithTitle:(NSString*)title
                            font:(UIFont*)font
                           frame:(CGRect)frame
                       textColor:(UIColor*)textColor
                   textAlignment:(NSTextAlignment)textAlignment;

+ (InsetsLabel*)createInsetsLabelWithTitle:(NSString*)title
                                      font:(UIFont*)font
                                     space:(CGFloat)space
                                 textColor:(UIColor*)textColor
                             textAlignment:(NSTextAlignment)textAlignment;

+ (UITextField*)createTextFiledWithFrame:(CGRect)frame
                                delegate:(id<UITextFieldDelegate>)delegate
                             placeHolder:(NSString*)placeHolder
                            keyboardType:(UIKeyboardType)keyboardType
                           returnKeyType:(UIReturnKeyType)returnKeyType;

//+ (RTLabel*)createRTLabelWithFrame:(CGRect)frame
//                              font:(UIFont*)font
//                         textColor:(UIColor*)textColor
//                   backgroundColor:(UIColor*)backgroundColor;
//
//+ (CBAutoScrollLabel*)createAutoScrollLabelWithFrame:(CGRect)frame
//                                                font:(UIFont*)font
//                                           textColor:(UIColor*)textColor
//                                     backgroundColor:(UIColor*)backgroundColor;





+ (UIView*)lineWithWidth:(CGFloat)width;
+ (UIView*)vLineWithHeight:(CGFloat)width;


+ (SevenSwitch*)createSwitchWithTarget:(id)target
                                action:(SEL)action;

+ (void)addBorderForView:(UIView*)view;
+ (void)addBorderForView:(UIView*)view color:(UIColor*)color;


+ (UIView*)emptyViewWithWidth:(CGFloat)width;
+ (UIView*)emptyViewWithHeight:(CGFloat)height;
+ (UIView*)emptyViewWithFrame:(CGRect)frame;


@end
