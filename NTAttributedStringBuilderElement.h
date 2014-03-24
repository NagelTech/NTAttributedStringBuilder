//
//  NTAttributedStringBuilderElement.h
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NTAttributedStringBuilder;


@protocol NTAttributedStringBuilderElement <NSObject>

@required

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder;

@end

