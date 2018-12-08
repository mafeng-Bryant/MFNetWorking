//
//  MFNetWorkRequestEngine.h
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFNetWorkingRequestBaseEngine.h"
#import "MFNetWorking.h"
#import "PPHostHelper.h"
#import <AFNetworking/AFNetworking.h>

@interface MFNetWorkingRequestEngine : MFNetWorkingRequestBaseEngine

/**
 *  This method offers the most number of parameters of a certain network request.
 *
 *  @param url                request url
 *  @param method             request method
 *  @param parameters         parameters
 *  @param loadCache          consider whether to load cache
 *  @param cacheDuration      consider whether to write cache
 *  @param handler            handler callback
 *
 */
- (void)sendRequest:(NSString *)url
             method:(MFRequestMethodType)method
         parameters:(id)parameters
          loadCache:(BOOL)loadCache
      cacheDuration:(NSTimeInterval)cacheDuration
            handler:(MFRequestCompletionHandler)handler;


@end

