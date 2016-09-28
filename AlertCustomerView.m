//
//  AlertCustomerView.m
//  MyShineApp
//
//  Created by Guan Hui on 16/4/12.
//  Copyright © 2016年 sennotech. All rights reserved.
//

#import "AlertCustomerView.h"

@interface AlertCustomerView() {
    
}

@end


@implementation AlertCustomerView

+ (void)alertNormal:(NSString*)str delegate:(NSObject<AlertNormalDelegate>*)delegate viewController:(UIViewController*)controller
{
    if ([AlertCustomerView isIOS8]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示"
                                                                       message: str
                                                                preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction: [UIAlertAction actionWithTitle: @"好"
                                                   style: UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     [delegate alertNormalWithOK];
                                                 }]];
        [controller presentViewController: alert animated: YES completion: nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"提示"
                                                        message: str
                                                       delegate: nil
                                              cancelButtonTitle: @"好"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

+ (void)alertWithYesNo:(NSString*)str delegate:(NSObject<AlertYesNoDelegate>*)delegate controller:(UIViewController*)controller attribute:(NSObject*)obj
{
    if ([AlertCustomerView isIOS8]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示"
                                                                       message: str
                                                                preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction: [UIAlertAction actionWithTitle: @"是"
                                                   style: UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     [delegate alertYesNoForYes: obj];
                                                 }]];
        [alert addAction: [UIAlertAction actionWithTitle: @"否"
                                                   style: UIAlertActionStyleCancel
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     if ([delegate respondsToSelector: @selector(alertYesNoForNo)]) {
                                                         [delegate alertYesNoForNo];
                                                     }
                                                 }]];
        [controller presentViewController: alert animated: YES completion: nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"提示"
                                                        message: str
                                                       delegate: delegate
                                              cancelButtonTitle: @"否"
                                              otherButtonTitles: @"是", nil];
        //runtime方法传参数
        [AppTools setAttribute: alert Key: @"key" Value: obj];
        [alert show];
    }
}



+ (BOOL)isIOS8
{
    return [UIDevice currentDevice].systemVersion.floatValue >=8.0?true:false;
}


@end
