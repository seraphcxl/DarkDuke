//
//  UIViewController+TourGuide.m
//  MonkeyPatching_ Swizzle
//
//  Created by Derek Chen on 13-7-10.
//  Copyright (c) 2013年 CaptainSolid Studio. All rights reserved.
//

#import "UIViewController+TourGuide.h"
#import <objc/runtime.h>
#import "NSObject+Swizzle.h"

static char tourStepsKey;

@implementation UIViewController (TourGuide)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceSelector:@selector(viewWillAppear:) withNewSelector:@selector(tourGuideWillAppear:)];
    });
}

- (void)setTourSteps:(NSArray *)tourSteps {
    objc_setAssociatedObject(self, &tourStepsKey, tourSteps, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)getTourSteps {
    return (NSArray *)objc_getAssociatedObject(self, &tourStepsKey);
}

- (void) displayTour {
    // run the tour
}

- (BOOL)isTourRan {
    BOOL result = NO;
    do {
        ;
    } while (NO);
    return result;
}

- (void)tourGuideWillAppear:(BOOL)animated {
    // call the old implementation, now under the new message signature
    [self tourGuideWillAppear:animated];
    
    if (![self isTourRan]) {
        [self displayTour];
    }
}

@end
