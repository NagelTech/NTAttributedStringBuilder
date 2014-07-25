//
//  NTAttr.m
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//


#import "NTAttributedStringBuilder.h"



@interface NTAttr ()

@property (nonatomic,copy) void (^block)(NTAttributedStringBuilder *b);

+(NTAttr *)attrWithBlock:(void (^)(NTAttributedStringBuilder *b))block;

@end


@implementation NTAttr


+(NTAttr *)attrWithBlock:(void (^)(NTAttributedStringBuilder *))block
{
    NTAttr *attr = [[NTAttr alloc] init];
    attr.block = block;
    
    return attr;
}


-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    self.block(builder);
}


+(NTAttr *)push
{
    return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b)
    {
        [b pushAttributes];
    }];
}


+(NTAttr *)pop
{
    return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b)
    {
        [b popAttributes];
    }];
}

+(NTAttr *)clear
{
    return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b)
    {
        [b clearAttributes];
    }];
}


+(NTAttr *)startLink:(NSURL *)link
{
    return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b)
    {
        b.link = link;
    }];
}


+(NTAttr *)endLink
{
    return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b)
    {
        b.link = nil;
    }];
}


#define AUTO_METHOD(type,name) +(NTAttr *)name:(type)name { return [NTAttr attrWithBlock:^(NTAttributedStringBuilder *b) { b.name = name; } ]; }

// copy any new declarations and perform an xcode regex search: \+\(NTAttr \*\)(.*):\((.*)\).*$ replace: AUTO_METHOD(\2, \1)

AUTO_METHOD(UIFont *, font)
AUTO_METHOD(CGFloat, fontSize)
AUTO_METHOD(NSString *, fontName)
AUTO_METHOD(NSParagraphStyle *, paragraphStyle)
AUTO_METHOD(CGFloat, lineSpacing)
AUTO_METHOD(CGFloat, paragraphSpacing)
AUTO_METHOD(NSTextAlignment, alignment)
AUTO_METHOD(CGFloat, firstLineHeadIndent)
AUTO_METHOD(CGFloat, headIndent)
AUTO_METHOD(CGFloat, tailIndent)
AUTO_METHOD(NSLineBreakMode, lineBreakMode)
AUTO_METHOD(CGFloat, minimumLineHeight)
AUTO_METHOD(CGFloat, maximumLineHeight)
AUTO_METHOD(NSWritingDirection, baseWritingDirection)
AUTO_METHOD(CGFloat, lineHeightMultiple)
AUTO_METHOD(CGFloat, paragraphSpacingBefore)
AUTO_METHOD(float, hyphenationFactor)
AUTO_METHOD(NSUnderlineStyle, strikethroughStyle)
AUTO_METHOD(UIColor *, strikethroughColor)
AUTO_METHOD(NSUnderlineStyle, underlineStyle)
AUTO_METHOD(UIColor *, underlineColor)
AUTO_METHOD(UIColor *, strokeColor)
AUTO_METHOD(float, strokeWidth)
AUTO_METHOD(NSShadow *, shadow)
AUTO_METHOD(CGSize, shadowOffset)
AUTO_METHOD(UIColor *, shadowColor)
AUTO_METHOD(CGFloat, shadowBlurRadius)
AUTO_METHOD(NSString *, textEffect)
AUTO_METHOD(BOOL, textEffectLetterPress)
AUTO_METHOD(UIColor *, foregroundColor)
AUTO_METHOD(UIColor *, backgroundColor)

@end
