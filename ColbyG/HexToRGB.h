//
//  HexToRGB.h
//  LearningMultiView
//
//  Created by Colby Gatte on 10/12/16.
//  Copyright © 2016 Colby Gatte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexToRGB)

+ (UIColor *) colorWithHexString: (NSString *) hexString;
//+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

@end
