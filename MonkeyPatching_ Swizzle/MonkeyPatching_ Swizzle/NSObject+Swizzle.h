//
//  NSObject+Swizzle.h
//  Swizzle
//
//  Created by Derek Chen on 13-7-9.
//  Copyright (c) 2013年 CaptainSolid Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSelector withNewSelector:(SEL)newSelector;

@end
