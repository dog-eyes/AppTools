//
//  AppSuperColor.h
//  PropertyApp
//
//  Created by fenglei on 16/9/28.
//  Copyright © 2016年 netall.propertyapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSuperColor : NSObject {
    
}

/** 颜色获取方式 rgb */
+ (UIColor*)getColorWithR:(float)cr G:(float)cg B:(float)cb;
/** 带透明度的颜色 */
+ (UIColor*)getColorWithR:(float)cr G:(float)cg B:(float)cb A:(float)alpha;
/** 颜色获取方式 hex */
+ (UIColor*)getColorWithHex:(long)rgb;

@end
