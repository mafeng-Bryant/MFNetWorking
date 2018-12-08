//
//  MFNetWorkingHelper.h
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFRequest+RequestExtension.h"

@interface MFNetWorkingHelper : NSObject<MFRequestReformer,MFResponseReformer,MFResponseInterceptor>

+ (void)init;

+ (MFNetWorkingHelper *)sharedInstance;

@end

