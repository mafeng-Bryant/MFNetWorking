//
//  PPNetworkCacheHelper.m
//  PatPat
//
//  Created by 刘曦 on 2018/7/24.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import "PPNetworkCacheHelper.h"
#import <YYCache/YYCache.h>

static NSString *const kGlobleURLCacheKey = @"kGlobleURLCacheKey";

@implementation PPNetworkCacheHelper

#pragma mark - interface methods
+ (NSDictionary *)getUrlCacheWithUrl:(NSString *)url {
    if (![self judgeHasUrlCacheWithUrl:url]) {
        return nil;
    }
    YYCache *cache = [YYCache cacheWithName:kGlobleURLCacheKey];
    id responseObject = [cache objectForKey:url];
    if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)responseObject;
    }
    return nil;
}

+ (BOOL)judgeHasUrlCacheWithUrl:(NSString *)url {
    YYCache *cache = [YYCache cacheWithName:kGlobleURLCacheKey];
    if (cache && [cache containsObjectForKey:url]) {
        return YES;
    }
    return NO;
}

+ (void)saveResponseObjectWithUrl:(NSString *)url responseObject:(id)responseObject {
    YYCache *cache = [[YYCache alloc] initWithName:kGlobleURLCacheKey];
    [cache setObject:responseObject forKey:url];
}

+ (void)removeAllCache
{
    YYCache *cache = [YYCache cacheWithName:kGlobleURLCacheKey];
    if (cache) {
        [cache removeAllObjects];
    }
}

@end
