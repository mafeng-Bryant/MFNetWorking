//
//  MFSignatureGenerator.h
//  PatPat
//
//  Created by patpat on 2018/11/14.
//  Copyright © 2018年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFSignatureGenerator : NSObject

+ (NSString *)generateSignatureWithParameters:(NSDictionary *)allParameters;


@end

