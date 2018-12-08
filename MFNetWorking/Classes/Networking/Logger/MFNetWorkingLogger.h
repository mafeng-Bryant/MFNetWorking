//
//  MFNetWorkingLogger.h
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFRequest.h"

@interface MFNetWorkingLogger : NSObject

+ (void)printWithRequest:(NSString *)className
                 methord:(NSString *)methord
                     url:(NSString *)url
                 headers:(NSDictionary *)headers
                  params:(id)params;

+ (void)printResponse:(MFRequest *)request
                error:(NSError *)error;


@end

