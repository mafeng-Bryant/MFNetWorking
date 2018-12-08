//
//  MFRequestBaseEngine.h
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class MFRequest;

@interface MFNetWorkingRequestBaseEngine : NSObject
@property (nonatomic,strong) AFHTTPSessionManager* sessionManager;

- (void)requestDidSuccessWithRequest:(MFRequest*)request;


@end

