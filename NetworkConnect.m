//
//  NetworkConnect.m
//  RoullierApp
//
//  Created by heroz_f on 15/12/30.
//  Copyright © 2015年 Roullier. All rights reserved.
//

#import "NetworkConnect.h"
#import "AFNetworking.h"

@interface NetworkConnect() {
    
}
@end

@implementation NetworkConnect
@synthesize delegate=_delegate;

- (id)initWithUrl:(NSString*)netUrl attribute:(NSDictionary*)attr forType:(RequestType)rType tag:(NSString *)tag
{
    if ([super init]) {
        [self connection: netUrl attribute: attr forType:rType tag: tag];
    }
    return self;
}

- (void)connection:(NSString*)netUrl attribute:(NSDictionary*)attr forType:(RequestType)rType tag:(NSString*)tag
{
    
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"http://%@/%@",[AppTools getServerBase],netUrl]];
    
//    NSLog(@"url=%@",url);
//    NSLog(@"attr=%@",attr);
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration: config];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject: @"application/json"];
    
    switch (rType) {
        case Request_Type_Post:
        {
            [manager POST: url.absoluteString
               parameters: attr
                 progress: nil
                  success: ^(NSURLSessionTask *task,id responseObject){
                      
                      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
                      if (httpResponse.statusCode == 200) {
                          [self connectionSuccessful: responseObject tag: tag];
                      }else {
                          NSLog(@"httpResponse.statusCode=%ld",(long)httpResponse.statusCode);
                      }
                  }
                  failure: ^(NSURLSessionTask *operation,NSError *error){
                      [self connectionError: [error localizedDescription] tag: tag];
                      NSLog(@"--connection error--");
                      NSLog(@"%@",error.description);
                  }];
            break;
        }
        case Request_Type_Get:
        {
            [manager GET: url.absoluteString
               parameters: attr
                 progress: nil
                  success: ^(NSURLSessionTask *task,id responseObject){
                      
                      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
                      if (httpResponse.statusCode == 200) {
                          [self connectionSuccessful: responseObject tag: tag];
                      }else {
                          NSLog(@"httpResponse.statusCode=%ld",(long)httpResponse.statusCode);
                      }
                  }
                  failure: ^(NSURLSessionTask *operation,NSError *error){
                      [self connectionError: [error localizedDescription] tag: tag];
                      NSLog(@"--connection error--");
                      //NSLog(@"%@",error.description);
                      switch (error.code) {
                          case -1003:
                              [AppTools alertNormal: @"连接主机失败"];
                              break;
                          case -1009:
                              [AppTools alertNormal: @"连接互联网失败"];
                              break;
                          default:
                              NSLog(@"%@",error.description);
                              break;
                      }
                  }];
            break;
        }
    }
    
}


- (void)connectionSuccessful:(NSDictionary*)result tag:(NSString*)tag
{
//    NSLog(@"%@",result);
    [self.delegate networkConnectionSuccessful:result tag: tag];
}

- (void)connectionError:(NSString*)error tag:(NSString*)tag
{
    [self.delegate networkConnectionError: error tag: tag];
}



@end
