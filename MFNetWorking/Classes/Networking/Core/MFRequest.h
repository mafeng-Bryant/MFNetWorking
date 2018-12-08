//
//  MFRequest.h
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFNetWorkingHeader.h"
#import <UIKit/UIKit.h>
#import "MFNetWorkingProtocol.h"

@interface MFRequest : NSObject

@property (nonatomic,copy)                NSString* identifer;
@property (nonatomic,strong)              NSURLSessionTask* task;
@property (nonatomic,readwrite,strong)    NSURLResponse *response;
@property (nonatomic,readwrite, copy)     NSString *requestUrl;
@property (nonatomic,readwrite)           MFRequestMethodType method;
@property (nonatomic,strong, readonly)    NSDictionary *responseHeaders;
@property (nonatomic,readonly)            NSInteger responseStatusCode;
@property (nonatomic,strong, readonly)    NSString *absoluteString;
@property (nonatomic,readwrite)           NSError* error;
@property (nonatomic,readwrite,strong)    id responseObject;
@property (nonatomic,strong)              id parameters;
@property (nonatomic,assign)              BOOL loadCache;
@property (nonatomic,readwrite,assign)   NSTimeInterval cacheDuration;
@property (nonatomic,readwrite,strong)   NSData *responseData;
@property (nonatomic,readwrite,copy)     MFRequestCompletionHandler completionHandler;
@property (nonatomic,readwrite,copy)     NSString *uploadUrl;
@property (nonatomic,readwrite,copy)     NSArray<UIImage *> *uploadImages; //upload images(or image)array
@property (nonatomic,readwrite,copy)     NSString *imagesIdentifer; //image identifer
@property (nonatomic,readwrite,copy)     NSString *mimeType; //mime type of upload file
@property (nonatomic,readwrite,assign)   float imageCompressRatio; //compress ratio of all upload images, default is 1(original)
@property (nonatomic,readonly,copy)      NSString *cacheDataFilePath; //cache data file path
@property (nonatomic,readonly,copy)      NSString *cacheDataInfoFilePath; //cache data info file path(record info of corresponding cache data)
@property (nonatomic,readwrite,copy)     MFUploadSuccessBlock uploadSuccessBlock;//upload success block
@property (nonatomic,readwrite,copy)     MFUploadProgressBlock uploadProgressBlock; //upload progress block
@property (nonatomic,readwrite,copy)     MFUploadFailureBlock uploadFailedBlock; //upload faile block
@property (nonatomic,weak)               id<MFRequestReformer> requestReformer; //request reformer:对请求的数据统一做refrom处理，比如做签名，添加共用参数等
@property (nonatomic,weak)               id<MFResponseReformer> responseReformer; //response reformer:对返回的数据统一做refrom处理,比如对返回数据格式处理等
@property (nonatomic,weak)               id<MFResponseInterceptor> interceptor; //拦截器:请求完成后调用，实现协议方法后，可以在方法里完成比如说对某一状态做处理。
@property (nonatomic,weak)               id<MFRequestInjector> injector; //注入器：初始化时，通过这个协议可以实现统一注入

-(instancetype)initRequestUrl:(NSString*)url
                       method:(MFRequestMethodType)method
                   parameters:(id)parameters
                    loadCache:(BOOL)loadCache
                cacheDuration:(NSTimeInterval)cacheDuration
                       handler:(MFRequestCompletionHandler)handler;

-(NSString *)requestUrl;

- (MFRequestType)requestType;

- (NSString *)cacheDataFilePath;

- (NSString *)cacheDataInfoFilePath;

- (void)clearAllBlocks;

@end

