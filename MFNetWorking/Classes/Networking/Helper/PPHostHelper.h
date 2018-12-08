//
//  PPUrlManager.h
//  PatPat
//
//  Created by patpat on 15/3/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "MFNetWorkingConfig.h"

typedef enum {
    PPHostTypeTest,
    PPHostTypeProduct
}PPHostType;

typedef enum {
    PPExposeTypeProduct,
    PPExposeTypeEvent,
    PPExposeTypeCategory
}PPExposeType;


typedef enum {
  PPVisitPageTypeHome = 0,//首页
  PPVisitPageTypeFlashSaleList = 1,//flash sale list
  PPVisitPageTypeSearchResult = 2,//搜索结果页
  PPVisitPageTypeDailySpecialList = 3,//daily special 列表页面
  PPVisitPageTypeDailySpecialDetail = 4,//daily special 详情页面
  PPVisitPageTypeCategory = 5,//category 分类页面
  PPVisitPageTypeCategoryDetail = 6,//分类详情页面
  PPVisitPageTypeProductDetail = 7,//产品详情页面
  PPVisitPageTypeAboutUS = 8,//about us 页面
  PPVisitPageTypeRegister = 9,//注册页面
  PPVisitPageTypeLogin = 10,//登录页面
  PPVisitPageTypeCart = 11,//购物车页面
  PPVisitPageTypeCheckout = 12,//Checkout页面
  PPVisitPageTypeConfirmation = 13,//订单确认页面
  PPVisitPageTypeOrderLogistics = 14,//物流页面
  PPVisitPageTypeOrderDetail = 15, //订单详情页面
  PPVisitPageTypeVouchAndPromoCodePage = 16,//购物车Voucher/Promo Code输入页面
  PPVisitPageTypeVouchAndPromoCodeRulesPoliciesPage = 17,//购物车Voucher/Promo Code规则页面页面
  PPVisitPageTypeAddAddress = 18,//添加收货地址页面
  PPVisitPageTypeAddressList = 19,//收货地址列表页面
  PPVisitPageTypeEditAddress = 20,//编辑收货地址页面
  PPVisitPageTypeOrderInProgress = 21,//订单列表页面（In Progress）
  PPVisitPageTypeOrderDelivered = 22,//订单列表页面（Delivered）
  PPVisitPageTypeOrderReview = 23,//订单列表页面（Reviews）
  PPVisitPageTypeSearch = 24,//搜索输入框页面
  PPVisitPageTypeNotification = 25,//通知页面
  PPVisitPageTypeSystemNotification = 26,//系统通知页面
  PPVisitPageTypePromotionsNotification = 27,//钱包通知页面
  PPVisitPageTypeEventNotification = 28,//事件通知页面
  PPVisitPageTypeOrderNotification = 63,//订单通知页面
  PPVisitPageTypeLifeNew = 29,//社区New页面
  PPVisitPageTypeLifeFeatured = 30,//社区Feature页面
  PPVisitPageTypeLifeReview = 31,//社区Review页面
  PPVisitPageTypeLifePostDetail = 32,//社区贴子详情页面
  PPVisitPageTypeLifePostYourLife = 33,//发布帖子页面
  PPVisitPageTypeLifeMyPosts = 34,//社区个人中心（My Posts）
  PPVisitPageTypeLifeMyLikes = 35,//社区个人中心（My Likes）
  PPVisitPageTypePatPoints = 36,//签到页面
  PPVisitPageTypePatPointsHistory = 37,//签到历史页面
  PPVisitPageTypePatPointsRules = 38,//签到规则页面
  PPVisitPageTypeSetting = 40,//设置页面
  PPVisitPageTypeAbout = 41,//关于页面
  PPVisitPageTypeSettingEmail = 43,//邮箱设置页面
  PPVisitPageTypeSettingPushNotification = 44,//通知设置页面
  PPVisitPageTypeVoucherAvailable = 45,//我的优惠券页面（Available）
  PPVisitPageTypeVoucherApplied = 46,//我的优惠券页面（Applied）
  PPVisitPageTypeVoucherExpired = 47,//我的优惠券页面（Expired）
  PPVisitPageTypeVoucherRulesAndPolicies = 48,//我的优惠券Rules&Policies页面
  PPVisitPageTypeProfile = 49,//个人信息页面
  PPVisitPageTypeProfileChangeName = 50,//修改昵称页面
  PPVisitPageTypeProfileChangePassword = 51,//修改密码页面
  PPVisitPageTypeProfileCustomerSupport= 52,//客服支持页面
  PPVisitPageTypeProfileCustomerContactUS= 53,//客服支持页面(Contact Us)
  PPVisitPageTypeProfileCustomertFAQ= 54,//客服支持页面(FAQ)
  PPVisitPageTypeProfileCustomertPrivacyPolicy= 55,//客服支持页面(Privacy Policy)
  PPVisitPageTypeProfileCustomertTermsOfService= 56,//客服支持页面(Terms Of Service)
  PPVisitPageTypeWallet= 57,//钱包页面
  PPVisitPageTypeFaves= 58,//收藏页面
  PPVisitPageTypeAccount= 59,//账户中心页面
  PPVisitPageTypeNortonSecuredSeal= 60,//Norton Secured Seal 安全认证页面
  PPVisitPageTypeBbbSecuredSeal= 61,//BBB Secured Seal 安全认证页面
  PPVisitPageTypeQualitySecuredSeal = 62,//Quality Secured Seal 安全认证页面
  PPVisitPageTypeCartAddOnItem = 64,//购物车凑单页面
  PPVisitPageTypePhotoSelect = 65,//选择照片页面
  PPVisitPageTypeNewArrivals = 66,//NewArrivals展示页
  PPVisitPageTypeBenefitsDetail = 67,//会员权益说明
  PPVisitPageTypePaymentInfo = 68,//支付方式页面
  PPVisitPageTypeAddCard  = 69,//添加卡
  PPVistiPageTypeClearance = 70,//清仓页
  PPVistiPageTypeReseller = 71,//评分页
  PPVistiPageTypeFreeItemList = 72//免费商品页
}PPVisitPageType;

//api正式服务器地址
#define kStatgeHost      @"https://api2.patpat.com/v1.4"
//alpha测试地址
#define kAlphaStatgeHost @"https://api2.patpat.vip/v1.4" //证书安全

//119测试地址
#define kTestHost        @"http://api.dev.interfocus.org/v1.4"

//119测试地址2 h5
#define kTestHost2       @"http://h5_api.dev.interfocus.org/v1.4"

//明鉴
#define kTestHost3       @"http://api.cc/v1.4"

//陈石林
#define kTestHost4       @"http://api.patpat.test:81/v1.4"

//张志坚
#define kTestHost5       @"http://www.api.test/v3.8"

//麦麦
#define kTestHost7       @"http://api.paimaike.xyz/v3.8"

//易松本地
#define kTestHost6       @"http://app_api.dev.patpat.yangyisong.com/v1.4"

//网站地址
#define kWebSiteHost     @"www.patpat.com"
//网站Alpha地址
#define kAlphaWebSiteHost @"www.alpha.patpat.vip"
//完整网站正式地址
#define kCompleteWebSiteHost  @"https://www.patpat.com"

//新的埋点数据上报正式地址
#define kTrackProductHost     @"https://track.patpat.com/v1/tracks"

//完整网站alpha地址
#define kCompleteAlphaWebSiteHost @"https://www.alpha.patpat.vip"

//完整网站alpha2地址
#define kCompleteAlphaWebSiteHost2 @"https://www.alpha2.patpat.vip"

//意松埋点测试本地地址
#define kCompleteAlphaWebSiteHost3 @"http://log.dev.patpat.yangyisong.com/v1/tracks"

@interface PPHostObject : NSObject
@property(nonatomic,strong)NSString *host;
@property(nonatomic,strong)NSString *title;
@property(nonatomic)PPHostType type;
@end

@interface PPHostHelper : NSObject<UIActionSheetDelegate>

+ (PPHostHelper *)sharedInstance;

/**
 *  所有host
 *
 *  @return host的集合
 */
+ (NSArray *)hosts;

/**
 *  设置host
 *
 *  @param host
 */
+ (void)setHost:(NSString *)host;

/**
 *  读取设置的host
 *
 *  @return NSString
 */
+ (NSString *)getHost;

/**
 *  获取当前的server host
 *
 *  @return NSString
 */
+ (NSString *)currentServerHost;

/**
 *  改变url
 *
 *  @return void
 */
- (void)changeUrl;

/**
 *  获取设备的ip地址
 *
 *  @return NSString
 */
+ (NSString*)getIpAddress;


/**
 *  获取网站目录的域名
 *
 *  @return NSString
 */
+ (NSString*)getWebsiteHosts;




@end
