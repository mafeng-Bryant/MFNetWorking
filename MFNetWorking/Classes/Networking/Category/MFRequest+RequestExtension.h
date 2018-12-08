//
//  MFRequest+RequestExtension.h
//  MFNetWork
//
//  Created by Mafeng-MacPro on 2018/11/4.
//  Copyright © 2018年 test. All rights reserved.
//

#import "MFRequest.h"
#import "MFApiStatus.h"

@interface MFRequest (RequestExtension)<MFRequestInjector>
@property (nonatomic, strong, readonly) id content; //kResponseKeyContent 内容
@property (nonatomic, strong, readonly) id currency; //货币信息
@property (nonatomic,strong) MFApiStatus* status;

@end

