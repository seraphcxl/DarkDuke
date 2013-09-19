//
//  NSObject+Swizzle.m
//  Swizzle
//
//  Created by Derek Chen on 13-7-9.
//  Copyright (c) 2013年 CaptainSolid Studio. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSelector withNewSelector:(SEL)newSelector {
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
    
    BOOL methodAdded = class_addMethod([self class], originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    if (methodAdded) {
        class_replaceMethod([self class], newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end
