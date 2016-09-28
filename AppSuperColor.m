//
//  AppSuperColor.m
//  PropertyApp
//
//  Created by fenglei on 16/9/28.
//  Copyright © 2016年 netall.propertyapp. All rights reserved.
//

#import "AppSuperColor.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation AppSuperColor

+ (UIColor*)getColorWithR:(float)cr G:(float)cg B:(float)cb
{
    return [UIColor colorWithRed: cr/255.0 green: cg/255.0 blue: cb/255.0 alpha: 1];
}

+ (UIColor*)getColorWithR:(float)cr G:(float)cg B:(float)cb A:(float)alpha
{
    return [UIColor colorWithRed: cr/255.0 green: cg/255.0 blue: cb/255.0 alpha: alpha];
}

+ (UIColor*)getColorWithHex:(long)rgb
{
    //0x39526b
    return UIColorFromRGB(rgb);
}

@end
