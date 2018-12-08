//
//  PPNetworkCacheHelper.h
//  PatPat
//
//  Created by 刘曦 on 2018/7/24.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPNetworkCacheHelper : NSObject

+ (NSDictionary *)getUrlCacheWithUrl:(NSString *)url;

+ (BOOL)judgeHasUrlCacheWithUrl:(NSString *)url;

+ (void)saveResponseObjectWithUrl:(NSString *)url responseObject:(id)responseObject;

+ (void)removeAllCache;

@end
