//
//  MFApiStatus.h
//  MFNetWork
//
//  Created by patpat on 2018/11/5.
//  Copyright © 2018年 test. All rights reserved.


#import <Foundation/Foundation.h>

static NSString *const PPNSLocalizedErrorSummaryKey = @"NSLocalizedErrorSummaryKey";  // NSString

@interface NSError(MF_Error)
- (NSString *)descriptionSummary;
@end

@interface MFApiStatus : NSObject

@property (nonatomic,strong,readonly) NSString* code;
@property(nonatomic,strong,readonly) NSString *domain;
@property(nonatomic,strong) NSString *localizedDescription;
@property(nonatomic,strong,readonly) NSDictionary *userInfo;
@property(nonatomic,assign,readonly) BOOL normal;

-(instancetype)initWithDomain:(NSString*)domain
                         code:(NSString*)code
                     userInfo:(NSDictionary*)dic;

+ (id)statusWithDomain:(NSString*)domain
                  code:(NSString*)code
              userInfo:(NSDictionary*)dic;

@end

