//
//  NTAttributedStringBuilder.h
//
//  Created by Ethan Nagel on 3/19/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAttributedStringBuilderElement.h"
#import "NTAttr.h"
#import "NTAttrCategories.h"


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


