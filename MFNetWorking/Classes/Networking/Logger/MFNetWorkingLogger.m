//
//  MFNetWorkingLogger.m
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingLogger.h"
#import "MFNetWorkingConfig.h"

@implementation MFNetWorkingLogger

+ (id)convertToJSONString:(id)object
{
    if ([NSJSONSerialization isValidJSONObject:object]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
        NSString *json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return object;
}

+ (void)printWithRequest:(NSString *)className
                 methord:(NSString *)methord
                     url:(NSString *)url
                 headers:(NSDictionary *)headers
                  params:(id)params
{
    if (![self isPrintLogType]) {
        return;
    }
    id _params = params;
    if ([self printLogType] == MFRequestPrintLogTypeJSON) {
        _params = [self convertToJSONString:params];
    }
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n**************************************************************\n*                       Request Start                        *\n**************************************************************\n\n"];
    [logString appendFormat:@"Class:\t\t%@\n", className];
    [logString appendFormat:@"Method:\t\t%@\n", methord];
    [logString appendFormat:@"Http URL:\t%@\n", url];
    [logString appendFormat:@"Http Header:\t%@\n", headers];
    [logString appendFormat:@"Params:\t\t%@\n", _params];
    [logString appendFormat:@"\n**************************************************************\n*                         Request End                        *\n**************************************************************\n\n"];
    NSLog(@"%@",logString);
}

+ (void)printResponse:(MFRequest *)request
                error:(NSError *)error
{
    if (![self isPrintLogType]) {
        return;
    }
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n==============================================================\n=                        API Response                        =\n==============================================================\n\n"];
    [logString appendFormat:@"Class:\t\t%@\n", NSStringFromClass([request class])];
    [logString appendFormat:@"Http URL:\t%@\n", request.task.originalRequest.URL];
    [logString appendFormat:@"Http Header:\t%@\n", request.responseHeaders];
    [logString appendFormat:@"Status:\t\t%ld\t(%@)\n", (long)request.responseStatusCode, [NSHTTPURLResponse localizedStringForStatusCode:request.responseStatusCode]];
    [logString appendFormat:@"Content:\t\t%@\n", [self printLogType]==MFRequestPrintLogTypeJSON?[self convertToJSONString:request.responseObject]:request.responseObject];
    if (error) {
        [logString appendFormat:@"Error Domain:\t\t\t\t\t\t\t%@\n", error.domain];
        [logString appendFormat:@"Error Domain Code:\t\t\t\t\t%ld\n", (long)error.code];
        [logString appendFormat:@"Error Localized Description:\t\t\t%@\n", error.localizedDescription];
        [logString appendFormat:@"Error Localized Failure Reason:\t\t%@\n", error.localizedFailureReason];
        [logString appendFormat:@"Error Localized Recovery Suggestion:\t%@\n", error.localizedRecoverySuggestion];
    }
    [logString appendFormat:@"\n==============================================================\n=                        Response End                        =\n==============================================================\n\n"];
    NSLog(@"%@",logString);
}

#pragma mark Private methord

+ (MFRequestPrintLogType)printLogType
{
    return [MFNetWorkingConfig sharedInstance].printLogType;
}

+ (BOOL)isPrintLogType
{
#ifdef DEBUG //only print with DEBUG mode
    if ([self printLogType] == MFRequestPrintLogTypeNone) {
        return NO;
    }
    return YES;
#else
    return NO;
#endif
}

@end
