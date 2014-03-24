//
//  NTAttributedStringBuilderCategories.m
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//

#import "NTAttributedStringBuilderCategories.h"


@implementation UIFont (NTAttributedStringBuilder)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.font = self;
}

@end


@implementation UIColor (NTAttributedStringBuilder)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.foregroundColor = self;
}

@end


@implementation NSParagraphStyle (NTAttributedStringBuilder)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.paragraphStyle = self;
}

@end

