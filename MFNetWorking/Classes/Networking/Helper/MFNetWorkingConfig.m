//
//  MFNetWorkConfig.m
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingConfig.h"

@implementation MFNetWorkingConfig

+ (MFNetWorkingConfig *)sharedInstance
{
    static MFNetWorkingConfig *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _host = nil;
        _timeoutInterval = 30;//default 30s
        _printLogType = MFRequestPrintLogTypeNSObject;
        _requestSerializer = [AFHTTPRequestSerializer serializer];
        _responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

+ (void)initWithHost:(NSString *)host
{
    [self initWithHost:host requestSerializer:nil responseSerializer:nil];
}

+ (void)initWithHost:(NSString *)host
   requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
  responseSerializer:(AFHTTPResponseSerializer *)responseSerializer
{
    [[MFNetWorkingConfig sharedInstance] setHost:host];
    if (requestSerializer) {
        [[MFNetWorkingConfig sharedInstance] setRequestSerializer:requestSerializer];
    }
    if (responseSerializer) {
        [[MFNetWorkingConfig sharedInstance] setResponseSerializer:responseSerializer];
    }
}

@end
