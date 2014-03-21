//
//  NTAttrCategories.m
//
//  Created by Ethan Nagel on 3/20/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import "NTAttrCategories.h"


@implementation UIFont (NTAttr)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.font = self;
}

@end


@implementation UIColor (NTAttr)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.foregroundColor = self;
}

@end


@implementation NSParagraphStyle (NTAttr)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.paragraphStyle = self;
}

@end

