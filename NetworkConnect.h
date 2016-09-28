//
//  NetworkConnect.h
//  RoullierApp
//
//  Created by heroz_f on 15/12/30.
//  Copyright © 2015年 Roullier. All rights reserved.
//

@protocol NetworkConnectDelegate <NSObject>
- (void)networkConnectionSuccessful:(NSDictionary*)jsonStr tag:(NSString*)tag;
@optional
- (void)networkConnectionError:(NSString*)errorStr tag:(NSString*)tag;
@end


typedef enum : NSUInteger {
    Request_Type_Post,
    Request_Type_Get
}RequestType;

@interface NetworkConnect : NSObject {
    NSObject<NetworkConnectDelegate> *_delegate;
}
@property (retain, nonatomic)NSObject<NetworkConnectDelegate> *delegate;

- (id)initWithUrl:(NSString*)netUrl attribute:(NSDictionary*)attr forType:(RequestType)rType tag:(NSString *)tag;
@end
