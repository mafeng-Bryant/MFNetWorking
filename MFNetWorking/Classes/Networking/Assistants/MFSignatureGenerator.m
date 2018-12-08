//
//  MFSignatureGenerator.m
//  PatPat
//
//  Created by patpat on 2018/11/14.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import "MFSignatureGenerator.h"
#import "PPHostHelper.h"

//校验码，需与后台匹配才能完成请求，放在.m文件，防止.h头文件被反编译出来，规则MD5(kSignCode+p)
#define kSignCode       @"moT62o04AbYwKsR0Vci6GGVQ"
#define kTestSignCode   @"test"   //测试时用的校验码

@implementation MFSignatureGenerator

+ (NSString *)generateSignatureWithParameters:(NSDictionary *)allParameters
{
    NSString *signCode = kSignCode;
    if (![[PPHostHelper getHost] isEqualToString:kAlphaStatgeHost] && ![[PPHostHelper getHost] isEqualToString:kStatgeHost]) {
        signCode = kTestSignCode; //除了正式服务器，其他都用test作为sign
    }
    if (![allParameters isKindOfClass:[NSDictionary class]]) {
        return @"";
      //  return [signCode toMD5];
    }
  //  NSString *sign =  [[signCode stringByAppendingString:[allParameters toJsonString]] toMD5];
    return signCode;
}




@end
