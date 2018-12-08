//
//  MFRequestBaseEngine.m
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingRequestBaseEngine.h"
#import "MFNetWorkingConfig.h"
#import "PPNSString+Addition.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface  MFNetWorkingRequestBaseEngine()

@end

@implementation MFNetWorkingRequestBaseEngine

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self validateBaseUrl];
        _sessionManager = [AFHTTPSessionManager manager];
        if ([MFNetWorkingConfig sharedInstance].requestSerializer) {
            _sessionManager.requestSerializer = [MFNetWorkingConfig sharedInstance].requestSerializer;
        }
        if ([MFNetWorkingConfig sharedInstance].responseSerializer) {
            _sessionManager.responseSerializer = [MFNetWorkingConfig sharedInstance].responseSerializer;
        }
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        _sessionManager.securityPolicy = securityPolicy;
        _sessionManager.responseSerializer.acceptableContentTypes = [self acceptableContentTypes];
        _sessionManager.operationQueue.maxConcurrentOperationCount = 4;
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    }
    return self;
}

- (NSSet *)acceptableContentTypes
{
    NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:_sessionManager.responseSerializer.acceptableContentTypes];
    [acceptableContentTypes addObject:@"text/html"];
    [acceptableContentTypes addObject:@"text/plain"];
    [acceptableContentTypes addObject:@"text/json"];
    [acceptableContentTypes addObject:@"text/xml"];
    [acceptableContentTypes addObject:@"text/javascript"];
    [acceptableContentTypes addObject:@"application/json"];
    return acceptableContentTypes;
}

//检测是否设置了base url
- (void)validateBaseUrl{
    NSAssert([[MFNetWorkingConfig sharedInstance].host isValidUrl], @"Error: Please set request base url,use setRequestBaseUrl: methord in MFNetWorkingConfig");
}

- (void)requestDidSuccessWithRequest:(MFRequest*)request
{
  //subclass rewrite
}
@end
