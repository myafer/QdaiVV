//
//  QdaiDefine.h
//  QdaiV
//
//  Created by 口贷网 on 15/7/20.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#ifndef QdaiV_QdaiDefine_h
#define QdaiV_QdaiDefine_h

#define NUMBER_WITH_YUAN(NUMBER_YUAN) [NSString stringWithFormat:@"%@元", (NUMBER_YUAN)]
#define NUMBER_WITH_VALUE(NUMBER_YUAN, VALUE) [NSString stringWithFormat:@"%@%@", (NUMBER_YUAN), (VALUE)]

#define QDAI_THEME_COLOR [UIColor colorWithRed:0/255.0 green:146/255.0 blue:221/255.0 alpha:1]
#define QDAI_BACK_COLOR [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1]

#define APP_WIDTH [UIScreen mainScreen].bounds.size.width 
#define APP_SCALE [UIScreen mainScreen].bounds.size.width / 320
#define Color(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]
#define kLine_Color [Color(201, 201, 201) CGColor] //线条颜色

#endif
