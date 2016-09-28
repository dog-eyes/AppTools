//
//  AlertCustomerView.h
//  MyShineApp
//
//  Created by Guan Hui on 16/4/12.
//  Copyright © 2016年 sennotech. All rights reserved.
//

@protocol AlertYesNoDelegate <NSObject>
@required
- (void)alertYesNoForYes:(NSObject*)obj;
@optional
- (void)alertYesNoForNo;

@end

@protocol AlertNormalDelegate <NSObject>
@optional
- (void)alertNormalWithOK;
@end


@interface AlertCustomerView : NSObject{
    
}
+ (void)alertNormal:(NSString*)str delegate:(NSObject<AlertNormalDelegate>*)delegate viewController:(UIViewController*)controller;
+ (void)alertWithYesNo:(NSString*)str delegate:(NSObject<AlertYesNoDelegate>*)delegate controller:(UIViewController*)controller attribute:(NSObject*)obj;

@end
