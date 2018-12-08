//
//  MFRequest.m
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFRequest.h"

@implementation MFRequest

-(instancetype)init
{
    self = [super init];
    _requestReformer = nil;
    _responseReformer = nil;
    _interceptor = nil;
    _injector = (id<MFRequestInjector>)self;
    if (_injector && [_injector respondsToSelector:@selector(initInjector:)]) {
        [_injector initInjector:self];
    }
    return self;
}

-(instancetype)initRequestUrl:(NSString*)url
                       method:(MFRequestMethodType)method
                   parameters:(id)parameters
                    loadCache:(BOOL)loadCache
                cacheDuration:(NSTimeInterval)cacheDuration
                      handler:(MFRequestCompletionHandler)handler
{
    self = [self init];
    if (self) {
        _requestUrl = url;
        _method = method;
        _parameters = parameters;
        _loadCache = loadCache;
        _cacheDuration = cacheDuration;
        _completionHandler = handler;
    }
    return self;
}

- (NSDictionary *)responseHeaders
{
    return self.task.currentRequest.allHTTPHeaderFields;
}

- (NSInteger)responseStatusCode
{
    NSHTTPURLResponse * responses = (NSHTTPURLResponse *)self.task.response;
    return responses.statusCode;
}

-(NSString *)absoluteString
{
    return self.task.currentRequest.URL.absoluteString;
}

- (MFRequestType)requestType
{
    if (self.uploadUrl.length >0) {
        return MFRequestTypeUpload;
    }
    return MFRequestTypeNormal;
}

-(NSString *)requestUrl
{
    return _requestUrl;
}

- (NSString *)cacheDataFilePath
{
    if (self.requestType == MFRequestTypeNormal) {
        if (self.cacheDataFilePath.length>0) {
            return self.cacheDataFilePath;
        }
    }
    return @"";
}

- (NSString *)cacheDataInfoFilePath
{
    if (self.requestType == MFRequestTypeNormal) {
        if (self.cacheDataInfoFilePath.length>0) {
            return self.cacheDataInfoFilePath;
        }
    }
    return @"";
}

- (void)clearAllBlocks
{
    _completionHandler = nil;
    _uploadProgressBlock = nil;
    _uploadSuccessBlock = nil;
    _uploadFailedBlock = nil;
}

@end
