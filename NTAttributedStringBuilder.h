//
//  NTAttributedStringBuilder.h
//  NTAttributedStringBuilderSample
//
//  Created by Ethan Nagel on 3/19/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NTAttributedStringBuilder : NSObject

@property (readonly, nonatomic)     NSMutableAttributedString *attributedString;
@property (readonly, nonatomic)     NSMutableDictionary *attributes;

@property (nonatomic)               UIFont *font;
@property (nonatomic)               NSString *fontName;
@property (nonatomic)               CGFloat fontSize;

@property (nonatomic)               NSParagraphStyle *paragraphStyle;
@property (nonatomic)               CGFloat lineSpacing;
@property (nonatomic)               CGFloat paragraphSpacing;
@property (nonatomic)               NSTextAlignment alignment;
@property (nonatomic)               CGFloat firstLineHeadIndent;
@property (nonatomic)               CGFloat headIndent;
@property (nonatomic)               CGFloat tailIndent;
@property (nonatomic)               NSLineBreakMode lineBreakMode;
@property (nonatomic)               CGFloat minimumLineHeight;
@property (nonatomic)               CGFloat maximumLineHeight;
@property (nonatomic)               NSWritingDirection baseWritingDirection;
@property (nonatomic)               CGFloat lineHeightMultiple;
@property (nonatomic)               CGFloat paragraphSpacingBefore;
@property (nonatomic)               float hyphenationFactor;

@property (nonatomic)               NSUnderlineStyle strikethroughStyle;
@property (nonatomic)               UIColor *strikethroughColor;

@property (nonatomic)               NSUnderlineStyle underlineStyle;
@property (nonatomic)               UIColor *underlineColor;

@property (nonatomic)               UIColor *strokeColor;
@property (nonatomic)               float strokeWidth;

@property (nonatomic)               NSShadow *shadow;
@property (nonatomic)               CGSize shadowOffset;
@property (nonatomic)               UIColor *shadowColor;
@property (nonatomic)               CGFloat shadowBlurRadius;

@property (nonatomic)               NSString *textEffect;
@property (nonatomic)               BOOL textEffectLetterPress;

@property (nonatomic)               UIColor *foregroundColor;
@property (nonatomic)               UIColor *backgroundColor;

-(id)init;

-(void)pushAttributes;
-(void)popAttributes;
-(void)clearAttributes;

-(void)append:(id)item;
-(void)appendFormat:(NSString *)format, ...;

+(NSMutableAttributedString *)build:(NSArray *)items;

@end


@protocol NTAttributedStringBuilderElement <NSObject>

@required

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder;

@end


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

@end


