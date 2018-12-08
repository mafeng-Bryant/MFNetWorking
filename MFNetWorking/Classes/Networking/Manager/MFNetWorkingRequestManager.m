//
//  MFRequestManager.m
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingRequestManager.h"
#import <pthread/pthread.h>
#import "objc/runtime.h"
#import "MFRequest.h"
#import <AFNetworking/AFNetworking.h>

#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)

static char MFcurrentRequestKey;

@interface MFNetWorkingRequestManager()
{
    pthread_mutex_t _lock;
}

@end

@implementation MFNetWorkingRequestManager

+ (MFNetWorkingRequestManager *)sharedInstance {
    static id sharedInstance = nil;
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
        pthread_mutex_init(&_lock, NULL);
    }
    return self;
}

- (MFCurrentRequestModels*)currentRequest
{
    MFCurrentRequestModels* currentTasks = objc_getAssociatedObject(self, &MFcurrentRequestKey);
    if (currentTasks) {
        return currentTasks;
    }
    currentTasks = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, &MFcurrentRequestKey, currentTasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return currentTasks;
}

- (void)addRequest:(MFRequest*)request
{
    Lock();
    [self.currentRequest setObject:request forKey:[NSString stringWithFormat:@"%lu",(unsigned long)request.task.taskIdentifier]];
    Unlock();
}

- (void)removeRequest:(MFRequest *)request
{
    Lock();
    [self.currentRequest removeObjectForKey:[NSString stringWithFormat:@"%lu",(unsigned long)request.task.taskIdentifier]];
    Unlock();
}

- (void)cancelAllCurrentRequests
{
    NSArray* allkeys = [self.currentRequest allKeys];
    if (allkeys.count>0) {
        for (MFRequest* request in self.currentRequest.allValues) {
            if (request.requestType == MFRequestTypeNormal) {
                [request.task cancel];
                [self removeRequest:request];
            }
        }
    }
}

+ (BOOL)isConnected{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
