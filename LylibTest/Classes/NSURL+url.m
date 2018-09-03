//
//  NSURL+url.m
//  runtime_hank
//
//  Created by shunshun on 2018/8/24.
//  Copyright © 2018年 shunshun. All rights reserved.
//

/*同过Hook ，下钩子把系统的方法替换为自己的实现方法
 
 */


#import "NSURL+url.h"
#import <objc/runtime.h>

@implementation NSURL (url)
+(void)load{
//类方法
//    class_getClassMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)

//实例方法
//    class_getInstanceMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)
    Method URLWithString = class_getClassMethod(self, @selector(URLWithString:));
    Method LY_URLWithString = class_getClassMethod(self, @selector(LY_URLWithString:));
    //交换
    method_exchangeImplementations(URLWithString, LY_URLWithString);
}
+(instancetype)LY_URLWithString:(NSString *)URLString{

    NSURL *url = [NSURL LY_URLWithString:URLString];
    if (url==nil) {

        NSLog(@"url is nil");
    }
    return url;
}
@end
