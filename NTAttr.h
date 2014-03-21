//
//  NTAttr.h
//
//  Created by Ethan Nagel on 3/20/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "NTAttributedStringBuilderElement.h"


@interface NTAttr : NSObject<NTAttributedStringBuilderElement>

+(NTAttr *)font:(UIFont *)font;
+(NTAttr *)fontSize:(CGFloat)fontSize;
+(NTAttr *)fontName:(NSString *)fontName;
+(NTAttr *)paragraphStyle:(NSParagraphStyle *)paragraphStyle;
+(NTAttr *)lineSpacing:(CGFloat)lineSpacing;
+(NTAttr *)paragraphSpacing:(CGFloat)paragraphSpacing;
+(NTAttr *)alignment:(NSTextAlignment)alignment;
+(NTAttr *)firstLineHeadIndent:(CGFloat)firstLineHeadIndent;
+(NTAttr *)headIndent:(CGFloat)headIndent;
+(NTAttr *)tailIndent:(CGFloat)tailIndent;
+(NTAttr *)lineBreakMode:(NSLineBreakMode)lineBreakMode;
+(NTAttr *)minimumLineHeight:(CGFloat)minimumLineHeight;
+(NTAttr *)maximumLineHeight:(CGFloat)maximumLineHeight;
+(NTAttr *)baseWritingDirection:(NSWritingDirection)baseWritingDirection;
+(NTAttr *)lineHeightMultiple:(CGFloat)lineHeightMultiple;
+(NTAttr *)paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore;
+(NTAttr *)hyphenationFactor:(float)hyphenationFactor;
+(NTAttr *)strikethroughStyle:(NSUnderlineStyle)strikethroughStyle;
+(NTAttr *)strikethroughColor:(UIColor *)strikethroughColor;
+(NTAttr *)underlineStyle:(NSUnderlineStyle)underlineStyle;
+(NTAttr *)underlineColor:(UIColor *)underlineColor;
+(NTAttr *)strokeColor:(UIColor *)strokeColor;
+(NTAttr *)strokeWidth:(float)strokeWidth;
+(NTAttr *)shadow:(NSShadow *)shadow;
+(NTAttr *)shadowOffset:(CGSize)shadowOffset;
+(NTAttr *)shadowColor:(UIColor *)shadowColor;
+(NTAttr *)shadowBlurRadius:(CGFloat)shadowBlurRadius;
+(NTAttr *)textEffect:(NSString *)textEffect;
+(NTAttr *)textEffectLetterPress:(BOOL)textEffectLetterPress;
+(NTAttr *)foregroundColor:(UIColor *)foregroundColor;
+(NTAttr *)backgroundColor:(UIColor *)backgroundColor;

+(NTAttr *)push;
+(NTAttr *)pop;
+(NTAttr *)clear;


@end
