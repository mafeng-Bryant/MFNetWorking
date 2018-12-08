//
//  MFApiStatus.m
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFApiStatus.h"

@implementation NSError(MF_Error)

- (NSString *)descriptionSummary
{
    if ([self.userInfo isKindOfClass:[NSDictionary class]]) {
        return @"";
       // return FormatString(self.userInfo[PPNSLocalizedErrorSummaryKey],@"");
    }
    return @"";
}

@end

@implementation MFApiStatus

-(instancetype)initWithDomain:(NSString*)domain
                         code:(NSString*)code
                     userInfo:(NSDictionary*)dic
{
    if (self = [super init]) {
        _domain = domain;
        _code = code;
        _userInfo = dic;
        _localizedDescription = _userInfo[NSLocalizedDescriptionKey];
    }
    
    return self;
}

+ (id)statusWithDomain:(NSString*)domain
                  code:(NSString*)code
              userInfo:(NSDictionary*)dic
{
    MFApiStatus* status = [[MFApiStatus alloc]initWithDomain:domain code:code userInfo:dic];
    return status;
}

-(BOOL)normal
{
    if (_code.length > 0 && [_code integerValue] == 200) {
        return YES;
    }
    return NO;
}

@end
