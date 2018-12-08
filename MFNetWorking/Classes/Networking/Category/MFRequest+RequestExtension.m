//
//  MFRequest+RequestExtension.m
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFRequest+RequestExtension.h"
#import "MFNetWorkingHelper.h"
#import "objc/runtime.h"
#import "MFApiStatusGenerator.h"

//response key
static NSString *const kResponseKeyContent          = @"content";
static NSString *const kResponseKeyCurrency         = @"global_setting";
static NSString *const kResponseKeyData             = @"data";

static void *MFNetworkingApiStatus;

@implementation MFRequest (RequestExtension)

- (id)content {
    if ([self.responseObject isKindOfClass:[NSDictionary class]]) {
        if ([self respondsToSelector:@selector(requestUrl)] && ([self.requestUrl hasPrefix:@"http"] || [self.requestUrl hasPrefix:@"https"])) {
            return self.responseObject[kResponseKeyData];
        }
        return self.responseObject[kResponseKeyContent];
    }
   return nil;
}

- (id)currency {
    if ([self.responseObject isKindOfClass:[NSDictionary class]]) {
        return self.responseObject[kResponseKeyCurrency];
    }
    return nil;
}

-(MFApiStatus *)status
{
    id _status = objc_getAssociatedObject(self, &MFNetworkingApiStatus);
    if (!_status) {
        _status = [MFApiStatusGenerator generateApiStatusWithRequest:self];
        self.status = _status;
    }
    return _status;
}

-(void)setStatus:(MFApiStatus *)status
{
    objc_setAssociatedObject(self, &MFNetworkingApiStatus, status, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark MFRequestInjector

- (void)initInjector:(MFRequest *)request
{
    //加载各种reformer和interceptor
    MFNetWorkingHelper *manager = [MFNetWorkingHelper sharedInstance];
    request.requestReformer = manager;
    request.responseReformer = manager;
    request.interceptor = manager;
}


@end
