//
//  NTAttributedStringBuilderElement.h
//  NTAttributedStringBuilderSample
//
//  Created by Ethan Nagel on 3/20/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NTAttributedStringBuilder;


@protocol NTAttributedStringBuilderElement <NSObject>

@required

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder;

@end

