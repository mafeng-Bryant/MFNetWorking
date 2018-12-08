//
//  MFApiStatusGenerator.m
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFApiStatusGenerator.h"

//response key
static NSString *const kResponseKeyStatus            = @"status";
static NSString *const kResponseKeyMsg               = @"msg";
static NSString *const kResponseKeyCode              = @"code";

@implementation MFApiStatusGenerator

+ (MFApiStatus*)generateApiStatusWithRequest:(MFRequest*)request
{
    NSDictionary *responseResult = [request responseObject];
    if ([responseResult isKindOfClass:[NSDictionary class]]) {
        id status = responseResult[kResponseKeyStatus];
        id msg = responseResult[kResponseKeyMsg];
        if ([request respondsToSelector:@selector(requestUrl)] && ([request.requestUrl hasPrefix:@"http"] || [request.requestUrl hasPrefix:@"https"])) {
            status = responseResult[kResponseKeyCode];
            msg = responseResult[kResponseKeyStatus];
        }
        if ([MFApiStatusGenerator statusIsValid:status] && [msg length]>0) {
            NSString *code = [NSString stringWithFormat:@"%@",status];
            NSString *description = [NSString stringWithFormat:@"%@",msg];
            MFApiStatus *apistatus = [MFApiStatusGenerator createStatus:code description:description domain:[request.absoluteString stringByDeletingLastPathComponent]];
            return apistatus;
        }
     }
    return nil;
}

#pragma mark Private methord

+ (BOOL)statusIsValid:(id)status
{
    if ([status isKindOfClass:[NSString class]] || [status isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    return NO;
}

+ (MFApiStatus *)createStatus:(NSString *)code
                  description:(NSString *)description
                       domain:(NSString *)domain
{
    if (!code)return nil;
    if (description.length<=0) {
        description = @"";
    }
    if (domain.length<=0) {
        domain = @"www.patpat.com";
    }
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:description};
    MFApiStatus *status = [MFApiStatus statusWithDomain:domain code:code userInfo:userInfo];
    return status;
}

@end
