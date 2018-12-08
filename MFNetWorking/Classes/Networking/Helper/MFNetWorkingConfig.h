//
//  MFNetWorkConfig.h
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFNetWorking.h"
#import <AFNetworking/AFNetworking.h>


@interface MFNetWorkingConfig : NSObject
@property (nonatomic,strong)   NSString                 *host;          //request host
@property (nonatomic,strong)   AFHTTPRequestSerializer  *requestSerializer ; //request serializer
@property (nonatomic,strong)   AFHTTPResponseSerializer *responseSerializer ; //response serializer
@property (nonatomic, assign)  NSInteger                timeoutInterval ; //request timeout interval
@property (nonatomic, assign)  MFRequestPrintLogType    printLogType ; //the type of print log

/**
 *  单例模式
 *
 *  @return MFNetWorkConfig实例
 */
+ (MFNetWorkingConfig *)sharedInstance;

/**
 *  初始化网络模块，设置host
 *
 *  @param host 请求的host
 */
+ (void)initWithHost:(NSString *)host;

/**
 *  初始化网络模块，设置host
 *
 *  @param host               请求的host，例如http://api.test.com
 *  @param requestSerializer  请求的serializer
 *  @param responseSerializer 处理请求返回内容的serializer
 */
+ (void)initWithHost:(NSString *)host
   requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
  responseSerializer:(AFHTTPResponseSerializer *)responseSerializer;


@end

