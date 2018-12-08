//
//  MFRequestManager.h
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MFRequest;

//a dictionary to hold all current request models,保持请求的对象
typedef NSMutableDictionary<NSString*, MFRequest*> MFCurrentRequestModels;

@interface MFNetWorkingRequestManager : NSObject

/**
 *  单例模式
 *
 *  @return MFNetWorkingRequestManager实例
 */
+ (MFNetWorkingRequestManager*)sharedInstance;

/**
 *
 *  @return current models
 */
- (MFCurrentRequestModels*)currentRequest;

/**
 *
 *  This method is used to add a request model into current request models set
 */
- (void)addRequest:(MFRequest*)request;

/**
 *
 *  This method is used to remove a request model from current request models set
 */
- (void)removeRequest:(MFRequest *)request;

/**
 *  This method is used to cancel all current requests
 *
 */
- (void)cancelAllCurrentRequests;

/**
 *  是否有网络连接
 *
 *  @return BOOL
 */
+ (BOOL)isConnected;



@end

