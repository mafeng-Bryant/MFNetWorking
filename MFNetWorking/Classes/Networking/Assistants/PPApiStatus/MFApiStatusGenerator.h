//
//  MFApiStatusGenerator.h
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFApiStatus.h"
#import "MFRequest.h"

@interface MFApiStatusGenerator : NSObject

+ (MFApiStatus*)generateApiStatusWithRequest:(MFRequest*)request;

@end

