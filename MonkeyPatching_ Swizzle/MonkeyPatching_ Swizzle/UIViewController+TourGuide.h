//
//  UIViewController+TourGuide.h
//  MonkeyPatching_ Swizzle
//
//  Created by Derek Chen on 13-7-10.
//  Copyright (c) 2013年 CaptainSolid Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TourGuide)

- (NSArray *)getTourSteps;
- (void)setTourSteps:(NSArray *)tourSteps;

@end
