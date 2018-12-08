//
//  MFNetWorkingHeader.h
//  MFNetWork
//
//  Created by patpat on 2018/10/31.
//  Copyright © 2018年 test. All rights reserved.
//

#ifndef MFNetWorkHeader_h
#define MFNetWorkHeader_h

@class MFRequest;

//---------------------------------------normal request call block-----------------------------------------------------------------------//
typedef void (^MFRequestCompletionHandler)(id result,MFRequest *request,NSError *error);

//---------------------------------------upload request call block-----------------------------------------------------------------------//
typedef void(^MFUploadSuccessBlock)(id responseObject);
typedef void(^MFUploadProgressBlock)(NSProgress *uploadProgress);
typedef void(^MFUploadFailureBlock)(NSURLSessionTask *task, NSError *error, NSInteger statusCode, NSArray<UIImage *>*uploadFailedImages);

//---------------------------------------download request call block-----------------------------------------------------------------------//



/**
 *  HTTP Request method
 */
typedef enum {
    MFRequestMethodGET,
    MFRequestMethodPOST,
    MFRequestMethodPUT,
    MFRequestMethodDELETE,
    MFRequestMethodHEADER
}MFRequestMethodType;

/**
 *  Request type
 */
typedef enum {
    MFRequestTypeNormal,
    MFRequestTypeUpload,
    MFRequestTypeDownload
}MFRequestType;

/**
 *  Manual operation by user (start,suspend,resume,cancel)
 */
typedef enum {
    MFDownloadManualOperationStart,
    MFDownloadManualOperationSuspend,
    MFDownloadManualOperationResume,
    MFDownloadManualOperationCancel
}MFDownloadManualOperationType;

typedef enum {
    MFRequestPrintLogTypeNone, //no request log will be printed
    MFRequestPrintLogTypeJSON, //request log will be printed with json format
    MFRequestPrintLogTypeNSObject //request log will be printed with NSObject format,e.g:NSArray,NSDictionary
}MFRequestPrintLogType;


static NSString *const MFRequestMethodGet     = @"GET";
static NSString *const MFRequestMethodPost    = @"POST";
static NSString *const MFRequestMethodHead    = @"HEAD";
static NSString *const MFRequestMethodPut     = @"PUT";
static NSString *const MFRequestMethodDelete  = @"DELETE";

#endif /* MFNetWorkHeader_h */
