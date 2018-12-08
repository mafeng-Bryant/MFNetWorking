//
//  MFNetWorkingHelper.m
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingHelper.h"
#import "MFNetWorkingConfig.h"
#import "MFNetWorkingRequestCommonParameterHeader.h"
#import "MFNetWorkingRequestManager.h"
#import "MFSignatureGenerator.h"
//#import "UIAlertController+PPCategory.h"
//#import "AppDelegate.h"
#import "PPHostHelper.h"

@interface MFNetWorkingHelper()
{
    BOOL _isShowingLoginAlert;
}

@end

@implementation MFNetWorkingHelper

+ (MFNetWorkingHelper *)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)init
{
    [MFNetWorkingHelper sharedInstance];
}

- (id)init {
    self = [super init];
    if (self) {
        [MFNetWorkingConfig initWithHost:[PPHostHelper getHost]];
        [MFNetWorkingConfig sharedInstance].printLogType = MFRequestPrintLogTypeNSObject;
    }
    return self;
}

#pragma mark MFRequestReformer

- (void)requestReformerWithHeaders:(id)headers
                        parameters:(id)parameters
                          finished:(void(^)(id newHeaders,id newParameters))result
{
    //reformer parameters
    NSDictionary *commonParameters = [MFNetWorkingRequestCommonParameterHeader commonParameters];
    NSDictionary *requestParameters = parameters;
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionaryWithDictionary:commonParameters];
    if ([requestParameters isKindOfClass:[NSDictionary class]]) {
        [allParameters addEntriesFromDictionary:requestParameters];
    }
    
    NSString* jsonStr = [self toJsonString:allParameters];
    NSDictionary *finalParameters = @{@"p":jsonStr};

    //reformer headers
    NSDictionary *commonHeaders = [MFNetWorkingRequestCommonParameterHeader commonHeaders];
    NSMutableDictionary *finalHeaders = [NSMutableDictionary dictionaryWithDictionary:commonHeaders];
    NSString *sign =  [MFSignatureGenerator generateSignatureWithParameters:allParameters];
    finalHeaders[@"sign"] = sign;
    result(finalHeaders,finalParameters);
}

#pragma mark MFResponseReformer

- (void)responseReormer:(MFRequest *)request
{
    if (!request.error) {
        [request status];  //请求成功了生成业务相关的status
        if (request.status && !request.status.normal) { //在这里将NSError和PPStatus合并为一个error
            NSMutableDictionary *descriptionDict = [NSMutableDictionary dictionary];
            descriptionDict[PPNSLocalizedErrorSummaryKey] =@"";
            descriptionDict[NSLocalizedDescriptionKey] = request.status.localizedDescription;
            request.error = [NSError errorWithDomain:request.status.domain code:[request.status.code integerValue] userInfo:descriptionDict];
        }
    }else{
        //重新设置请求失败的error信息
        NSMutableDictionary *descriptionDict = [NSMutableDictionary dictionary];
        if (![MFNetWorkingRequestManager isConnected]) { //lost network
            descriptionDict[PPNSLocalizedErrorSummaryKey]= @"";
            descriptionDict[NSLocalizedDescriptionKey] = @"";
        }else{
            descriptionDict[PPNSLocalizedErrorSummaryKey]=@"";
            descriptionDict[NSLocalizedDescriptionKey] = request.error.localizedDescription;
        }
        request.error = [NSError errorWithDomain:request.error.domain code:request.error.code userInfo:descriptionDict];
    }
}

#pragma mark MFResponseInterceptor

- (void)interceptResponse:(MFRequest *)request
{
    MFApiStatus* api_status = request.status;
    if (api_status&&[api_status.code isEqualToString:@"1001"]) { //token过期了
      //  api_status.localizedDescription = FormatString(api_status.localizedDescription,PPString(AUTHENTICATIONLOGINAGAIN));
        [self verifyAccount:api_status];
        api_status.localizedDescription = @"";
     }
}

- (NSString *)toJsonString:(NSDictionary*)paramaters
{
    if ([NSJSONSerialization isValidJSONObject:paramaters]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramaters options:0 error:&error];
        NSString *json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

//检查帐号token是否有效，如果过期就跳到登录界面
- (void)verifyAccount:(MFApiStatus *)status
{
//    if (_isShowingLoginAlert || ![PPSetting isAuthValid]) {
//        return;
//    }
    _isShowingLoginAlert = YES;
//    [UIAlertController showAlertCntroller:[AppDelegate appDelegate].currentVisibleViewController alertControllerStyle:UIAlertControllerStyleAlert title:@"" message:status.localizedDescription block:^(NSInteger index) {
//        if (index ==1) {
//            self->_isShowingLoginAlert = NO;
//            [[AppDelegate appDelegate]signOut];
//        }
//    } cancelButtonTitle:nil okButtonTitle:PPString(OK_STRING) otherButtonTitles:nil];
}


@end
