//
//  PPUrlManager.m
//  PatPat
//
//  Created by patpat on 15/3/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPHostHelper.h"
#import "PPStoreHelper.h"
//#import "AppDelegate.h"
//#import "UIAlertController+PPCategory.h"

@implementation PPHostObject
@synthesize title;
@synthesize host;
@end

@implementation PPHostHelper

+ (PPHostHelper *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (NSArray *)hosts
{
    NSMutableArray *hosts = [NSMutableArray array];
    
    //119内网测试服务器
    PPHostObject *object = [[PPHostObject alloc]init];
    object.host = kTestHost;
    object.title = @"119 Test Server";
    object.type = PPHostTypeTest;
    [hosts addObject:object];
    
    //119内网测试服务器2 h5
    object = [[PPHostObject alloc]init];
    object.host = kTestHost2;
    object.title = @"h5 测试服务器地址";
    object.type = PPHostTypeTest;
    [hosts addObject:object];

    //意松本地环境
    object = [[PPHostObject alloc]init];
    object.host = @"http://api.dev.patpat.yangyisong.com/v1.4";
    object.title = @"yinsong Test Server";
    object.type = PPHostTypeTest;
    [hosts addObject:object];
    
    //马峰本地环境
    object = [[PPHostObject alloc]init];
    object.host = @"http://api.patpat.dev/v1.4";
    object.title = @"mafeng Test Server";
    object.type = PPHostTypeTest;
    [hosts addObject:object];
  
    //陈石林本地环境
    object = [[PPHostObject alloc]init];
    object.host = @"https://api.patpat.test3_6/v1.4";
    object.title = @"yinsong Test Server";
    object.type = PPHostTypeTest;
    [hosts addObject:object];
    
    //alpha环境||正式服务器
    object = [[PPHostObject alloc]init];
    object.host = kAlphaStatgeHost;//kStatgeHost kAlphaStatgeHost
    object.title = @"Amazon Product Server";
    object.type = PPHostTypeProduct;
    [hosts addObject:object];

    return hosts;
}

+ (NSString *)currentServerHost
{
    return [MFNetWorkingConfig sharedInstance].host;
}

+ (void)setHost:(NSString *)host
{
    [PPStoreHelper storeValue:host forKey:[self hostKey]];
}

+ (NSString *)getHost
{
    NSString *_serverHost = nil;
#if defined(DEBUG) || defined(ADHOC)
    _serverHost = [PPStoreHelper getValueForKey:[self hostKey]];
#endif
   if ([_serverHost length] <0) {
       _serverHost = [self hostWithType:PPHostTypeProduct];
    }
    return _serverHost;
}

+ (NSString*)getWebsiteHosts
{
    NSString* _rootHosts = nil;
    if ([[self getHost]isEqualToString:kAlphaStatgeHost]) {
        _rootHosts = kTrackProductHost;//测试埋点数据到alpha
    }else if ([[self getHost] isEqualToString:kStatgeHost]){
        _rootHosts = kTrackProductHost;
    }else {
        _rootHosts = kTrackProductHost;
    }
    return _rootHosts;
}

+ (NSString*)getIpAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

#pragma mark Private methord

+ (NSString *)hostKey
{
    return @"server.host";
}

+ (NSString *)hostWithType:(PPHostType)type
{
    for (PPHostObject *object in [self hosts]) {
        if (object.type == type) {
            return object.host;
        }
    }
    return nil;
}

#pragma mark Change url

- (void)changeUrl
{
    NSMutableArray* appHosts = [NSMutableArray array];
    for (PPHostObject *hostObject in [PPHostHelper hosts]) {
        NSString *currentHost = [PPHostHelper currentServerHost];
        if ([currentHost isEqualToString:hostObject.host]) {
            [appHosts addObject:[NSString stringWithFormat:@"[√]%@(%@)",hostObject.title,hostObject.host]];
        }else{
            [appHosts addObject:[NSString stringWithFormat:@"%@(%@)",hostObject.title,hostObject.host]];
        }
    }
//    [UIAlertController showAlertCntroller:[AppDelegate appDelegate].currentVisibleViewController alertControllerStyle:UIAlertControllerStyleActionSheet
//                                    title:nil message:PPString(MORE_CHANGESERVER)
//                        cancelButtonTitle:PPString(CANCEL_STRING)
//                                    block:^(NSInteger index) {
//                                        NSArray *hosts = [PPHostHelper hosts];
//                                        if (index>hosts.count-1 || index ==-1) {
//                                            return;
//                                        }
//                                        PPHostObject *hostObject = hosts[index];
//                                        [PPHostHelper setHost:hostObject.host];
//                                        [[PPSetting sharedPPSetting]reset]; //需要用户重新登陆
//                                        [self exitApplication];
//                                    } otherButtonTitles:appHosts];
}

- (void)exitApplication {
//    UIWindow *window = [AppDelegate appDelegate].window;
//    [UIView animateWithDuration:1.0f animations:^{
//        window.alpha = 0;
//        window.size = CGSizeZero;
//        window.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
//    } completion:^(BOOL finished) {
//        exit(0);
//    }];
}

@end
