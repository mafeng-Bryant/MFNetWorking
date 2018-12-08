  //
//  PPStoreHelper.m
//  PatPat
//
//  Created by Bruce He on 15/9/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPStoreHelper.h"
#import "SFHFKeychainUtils.h"

static NSString * const kServiceDomain                     = @"com.interfocusllc.patpat";

@implementation PPStoreHelper

#pragma mark 加密存储数据到NSUserDefaults

+(void)storeValue:(id)value forKey:(NSString *)key
{
    key = [kAppBundleIdentifier stringByAppendingFormat:@".%@",key];
    NSUserDefaults *defaultsSetting = [NSUserDefaults standardUserDefaults];
    if (value==nil) {
        [defaultsSetting removeObjectForKey:key];
    }else{
        [defaultsSetting setValue:value forKey:key];
    }
    [defaultsSetting synchronize];
}

+(id)getValueForKey:(NSString *)key
{
    if (key == nil)return nil;
    key = [kAppBundleIdentifier stringByAppendingFormat:@".%@",key];
    NSUserDefaults *defaultsSetting = [NSUserDefaults standardUserDefaults];
    return [defaultsSetting valueForKey:key];
}

+(void)systemStoreValue:(NSString *)value
                 forKey:(NSString *)key
{
    if (!isValidString(value)) {
        if ([SFHFKeychainUtils deleteItemForUsername:key andServiceName:kServiceDomain error:nil withAccessible:YES]){
            HYLog(@"删除kechain信息成功！");
        }else{
            HYLog(@"删除kechain信息失败！");
        }
    }else{
        if ([SFHFKeychainUtils storeUsername:key
                                 andPassword:value
                              forServiceName:kServiceDomain
                              updateExisting:true
                                       error:nil]){
            HYLog(@"保存信息到kechain成功！");
        }else{
            HYLog(@"保存信息到kechain失败！");
        };
    }
}

+ (id)getSystemValueForKey:(NSString *)key
{
    return [SFHFKeychainUtils getPasswordForUsernameOld:key andServiceName:kServiceDomain error:nil];
}

@end
