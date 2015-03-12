//
//  common.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#ifndef DIDA_PROJECT_common_h
#define DIDA_PROJECT_common_h


#define CREATE_STRONG @property(nonatomic, strong)
#define CREATE_ASSIGN @property(nonatomic, assign)
#define CREATE_COPY   @property(nonatomic, copy)

#define S self

#define CURRENT_USER_ID  1234567890

#define block_self  typeof (self) __weak bself = self
/**** 颜色
 
 ****/

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HEXCOLORA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define RGBCOLOR(_R_, _G_, _B_) [UIColor colorWithRed:(CGFloat)(_R_)/255.0f green: (CGFloat)(_G_)/255.0f blue: (CGFloat)(_B_)/255.0f alpha: 1.0f]

/*****  颜色 end **********/



#define DIDA_ORANGE_COLOR RGBCOLOR(253, 132, 68)
#define DIDA_TEXT_COLOR RGBCOLOR(102, 102, 102)
#define DIDA_NAVIGATIONBAR_COLOR HEXCOLOR(0x4d4d4d)
#define DIDA_BACKGROUND_COLOR HEXCOLOR(0xe2e2e2)



#endif
