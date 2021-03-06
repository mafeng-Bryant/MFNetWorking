//
//  PPStoreHelper.h
//  PatPat
//
//  Created by Bruce He on 15/9/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kNewUserKey                        = @"com.interfocusllc.patpat.newUserKey";
static NSString * const kIsStoreUserName                   = @"com.interfocusllc.patpat.isStoreUserName";//是否存储用户名
static NSString * const kEverPopupJoinNow                  = @"com.interfocusllc.patpat.everPopupJoinNow";//是否弹出过JoinNow界面
static NSString * const kCouponDiscount                    = @"com.interfocusllc.patpat.couponDiscount";//coupon折扣值
static NSString * const kMemberTotalSkuCount               = @"com.interfocusllc.patpat.memberTotalSkuCount";//当前有效sku
static NSString * const kLastPopEvaluationDate             = @"com.interfocusllc.patpat.lastPopEvaluationDate";//上次弹出评价界面的时间
static NSString * const kAppsFlyerDeepLinkUrlKey           = @"com.interfocusllc.patpat.kAppsFlyerDeepLinkUrlKey";
static NSString * const kAppInstallSourceKey               = @"com.interfocusllc.patpat.kAppInstallSourceKey";//app安装的来源
static NSString * const kEverClickMembership               = @"com.interfocusllc.patpat.everClickMembership";//是否点击过account界面的会员中心入口


@interface PPStoreHelper : NSObject

/**
 *  存储到NSUserDefaults
 *
 *  @param value,key
 *
 */
+ (void)storeValue:(id)value forKey:(NSString *)key;

/**
 *  根据key从NSUserDefaults获取值
 *
 *  @param key
 *
 */
+ (id)getValueForKey:(NSString *)key;

/**
 *  存储到系统的钥匙串
 *
 *  @param value,key
 *
 */
+(void)systemStoreValue:(NSString *)value
                 forKey:(NSString *)key;

/**
 *  根据key从系统的钥匙串获取值
 *
 *  @param key
 *
 */
+ (id)getSystemValueForKey:(NSString *)key;

@end
