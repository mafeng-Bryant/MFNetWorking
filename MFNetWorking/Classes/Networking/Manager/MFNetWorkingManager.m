//
//  MFNetWorkManager.m
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFNetWorkingManager.h"
#import "MFNetWorkingRequestEngine.h"
#import "MFNetWorkingRequestManager.h"
#import "MFNetWorkingRequestUploadEngine.h"
#import "MFNetWorkingRequestDownLoadEngine.h"

@interface MFNetWorkingManager()

@property (nonatomic,strong) MFNetWorkingRequestEngine* requestEngine;
@property (nonatomic,strong) MFNetWorkingRequestManager* requestManager;
@property (nonatomic,strong) MFNetWorkingRequestUploadEngine* uploadRequestEngine;
@property (nonatomic,strong) MFNetWorkingRequestDownLoadEngine* downLoadRequestEngine;

@end

@implementation MFNetWorkingManager

+ (MFNetWorkingManager *)sharedInstance
{
    static MFNetWorkingManager *sharedManager = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[MFNetWorkingManager alloc] init];
    });
    return sharedManager;
}

- (void)sendGetRequest:(NSString *)url
               handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodGET
                         parameters:nil
                          loadCache:NO
                      cacheDuration:0
                           handler:handler];
}

- (void)sendGetRequest:(NSString *)url
            parameters:(id)parameters
               handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodGET
                         parameters:parameters
                          loadCache:NO
                      cacheDuration:0
                            handler:handler];
}

- (void)sendGetRequest:(NSString *)url
            parameters:(id)parameters
             loadCache:(BOOL)loadCache
               handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodGET
                         parameters:parameters
                          loadCache:loadCache
                      cacheDuration:0
                            handler:handler];
}

- (void)sendGetRequest:(NSString *)url
            parameters:(id)parameters
         cacheDuration:(NSTimeInterval)cacheDuration
               handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodGET
                         parameters:parameters
                          loadCache:NO
                      cacheDuration:cacheDuration
                            handler:handler];
}

- (void)sendGetRequest:(NSString *)url
            parameters:(id)parameters
             loadCache:(BOOL)loadCache
         cacheDuration:(NSTimeInterval)cacheDuration
               handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodGET
                         parameters:parameters
                          loadCache:loadCache
                      cacheDuration:cacheDuration
                            handler:handler];
}


- (void)sendPostRequest:(NSString *)url
             parameters:(id)parameters
                handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodPOST
                         parameters:parameters
                          loadCache:NO
                      cacheDuration:0
                            handler:handler];
}

- (void)sendPostRequest:(NSString *)url
             parameters:(id)parameters
              loadCache:(BOOL)loadCache
                handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodPOST
                         parameters:parameters
                          loadCache:loadCache
                      cacheDuration:0
                            handler:handler];
}

- (void)sendPostRequest:(NSString *)url
             parameters:(id)parameters
          cacheDuration:(NSTimeInterval)cacheDuration
                handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodPOST
                         parameters:parameters
                          loadCache:NO
                      cacheDuration:cacheDuration
                            handler:handler];
}



- (void)sendPostRequest:(NSString *)url
             parameters:(id)parameters
              loadCache:(BOOL)loadCache
          cacheDuration:(NSTimeInterval)cacheDuration
                handler:(MFRequestCompletionHandler)handler
{
    [self.requestEngine sendRequest:url
                             method:MFRequestMethodPOST
                         parameters:parameters
                          loadCache:loadCache
                      cacheDuration:cacheDuration
                            handler:handler];
}

- (void)sendUploadImageRequest:(NSString *)url
                    parameters:(id)parameters
                         image:(UIImage *)image
                          name:(NSString *)name
                      mimeType:(NSString *)mimeType
                      progress:(MFUploadProgressBlock)uploadProgressBlock
                       success:(MFUploadSuccessBlock)uploadSuccessBlock
                       failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
    
    
}

- (void)sendUploadImageRequest:(NSString *)url
                 ignoreBaseUrl:(BOOL)ignoreBaseUrl
                    parameters:(id)parameters
                         image:(UIImage *)image
                          name:(NSString *)name
                      mimeType:(NSString *)mimeType
                      progress:(MFUploadProgressBlock)uploadProgressBlock
                       success:(MFUploadSuccessBlock)uploadSuccessBlock
                       failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImagesRequest:(NSString *)url
                     parameters:(id)parameters
                         images:(NSArray<UIImage *> *)images
                           name:(NSString *)name
                       mimeType:(NSString *)mimeType
                       progress:(MFUploadProgressBlock)uploadProgressBlock
                        success:(MFUploadSuccessBlock)uploadSuccessBlock
                        failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImagesRequest:(NSString *)url
                  ignoreBaseUrl:(BOOL)ignoreBaseUrl
                     parameters:(id)parameters
                         images:(NSArray<UIImage *> *)images
                           name:(NSString *)name
                       mimeType:(NSString *)mimeType
                       progress:(MFUploadProgressBlock)uploadProgressBlock
                        success:(MFUploadSuccessBlock)uploadSuccessBlock
                        failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImageRequest:(NSString *)url
                    parameters:(id)parameters
                         image:(UIImage *)image
                 compressRatio:(float)compressRatio
                          name:(NSString *)name
                      mimeType:(NSString *)mimeType
                      progress:(MFUploadProgressBlock)uploadProgressBlock
                       success:(MFUploadSuccessBlock)uploadSuccessBlock
                       failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImageRequest:(NSString *)url
                 ignoreBaseUrl:(BOOL)ignoreBaseUrl
                    parameters:(id)parameters
                         image:(UIImage *)image
                 compressRatio:(float)compressRatio
                          name:(NSString *)name
                      mimeType:(NSString *)mimeType
                      progress:(MFUploadProgressBlock)uploadProgressBlock
                       success:(MFUploadSuccessBlock)uploadSuccessBlock
                       failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImagesRequest:(NSString *)url
                     parameters:(id)parameters
                         images:(NSArray<UIImage *> *)images
                  compressRatio:(float)compressRatio
                           name:(NSString *)name
                       mimeType:(NSString *)mimeType
                       progress:(MFUploadProgressBlock)uploadProgressBlock
                        success:(MFUploadSuccessBlock)uploadSuccessBlock
                        failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
}

- (void)sendUploadImagesRequest:(NSString *)url
                  ignoreBaseUrl:(BOOL)ignoreBaseUrl
                     parameters:(id)parameters
                         images:(NSArray<UIImage *> *)images
                  compressRatio:(float)compressRatio
                           name:(NSString *)name
                       mimeType:(NSString *)mimeType
                       progress:(MFUploadProgressBlock)uploadProgressBlock
                        success:(MFUploadSuccessBlock)uploadSuccessBlock
                        failure:(MFUploadFailureBlock)uploadFailureBlock
{
    
    
}

- (void)cancelAllCurrentRequests
{
    [self.requestManager cancelAllCurrentRequests];
}

#pragma mark set and get method

- (MFNetWorkingRequestEngine *)requestEngine
{    
    if (!_requestEngine) {
        _requestEngine = [[MFNetWorkingRequestEngine alloc] init];
    }
    return _requestEngine;
}

-(MFNetWorkingRequestUploadEngine *)uploadRequestEngine
{
    if (!_uploadRequestEngine) {
        _uploadRequestEngine = [[MFNetWorkingRequestUploadEngine alloc]init];
    }
    return _uploadRequestEngine;
}

-(MFNetWorkingRequestDownLoadEngine *)downLoadRequestEngine
{
    if (!_downLoadRequestEngine) {
        _downLoadRequestEngine = [[MFNetWorkingRequestDownLoadEngine alloc]init];
    }
    return _downLoadRequestEngine;
}

- (MFNetWorkingRequestManager *)requestManager
{
    if (!_requestManager) {
        _requestManager = [MFNetWorkingRequestManager sharedInstance];
    }
    return _requestManager;
}

-(void)dealloc
{
    [self cancelAllCurrentRequests];
}

@end
