//
//  NTAttributedStringBuilder.m
//  NTAttributedStringBuilderSample
//
//  Created by Ethan Nagel on 3/19/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import "NTAttributedStringBuilder.h"


@interface NTAttributedStringBuilder ()
{
    NSMutableAttributedString *_attributedString;
    NSMutableDictionary *_attributes;
    NSMutableArray *_attributeStack;
}

-(void)setParagraphStyleWithBlock:(void (^)(NSMutableParagraphStyle *p))block;

@end


@implementation NTAttributedStringBuilder


+(NSDictionary *)defaultAttributes
{
    return
    @{
        NSFontAttributeName: [UIFont systemFontOfSize:[UIFont systemFontSize]],
      };
}


-(NSMutableAttributedString *)attributedString
{
    return _attributedString;
}


-(id)init
{
    if ( (self=[super init]) )
    {
        _attributedString = [[NSMutableAttributedString alloc] init];
        _attributes = [[self.class defaultAttributes] mutableCopy];
    }
    
    return self;
}


#pragma mark - attribute Properties


-(UIFont *)font
{
    UIFont *font = _attributes[NSFontAttributeName];
    
    return (font) ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
}


-(void)setFont:(UIFont *)font
{
    if ( !font )
        [_attributes removeObjectForKey:NSFontAttributeName];
    else
        _attributes[NSFontAttributeName] = font;
}


-(CGFloat)fontSize
{
    return self.font.pointSize;
}


-(void)setFontSize:(CGFloat)fontSize
{
    self.font = [UIFont fontWithName:self.font.fontName size:fontSize];
}


-(NSString *)fontName
{
    return self.font.fontName;
}


-(void)setFontName:(NSString *)fontName
{
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}


-(NSParagraphStyle *)paragraphStyle
{
    NSParagraphStyle *paragraphStyle = _attributes[NSParagraphStyleAttributeName];
    
    return (paragraphStyle) ? paragraphStyle : [[NSParagraphStyle alloc] init];
}


-(void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle
{
    if ( !paragraphStyle )
        [_attributes removeObjectForKey:NSParagraphStyleAttributeName];
    else
    {
        if ( [paragraphStyle isKindOfClass:[NSMutableParagraphStyle class]] )
            paragraphStyle = [paragraphStyle copy]; // create an immutable copy
        
        _attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    }
}


-(void)setParagraphStyleWithBlock:(void (^)(NSMutableParagraphStyle *))block
{
    NSMutableParagraphStyle *paragraphStyle = [_attributes[NSParagraphStyleAttributeName]  mutableCopy];
    
    if ( !paragraphStyle )
        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    block(paragraphStyle);
    
    _attributes[NSParagraphStyleAttributeName] = [paragraphStyle copy];
}


-(CGFloat)lineSpacing
{
    return self.paragraphStyle.lineSpacing;
}


-(void)setLineSpacing:(CGFloat)lineSpacing
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.lineSpacing = lineSpacing; }];
}


-(CGFloat)paragraphSpacing
{
    return self.paragraphStyle.paragraphSpacing;
}



-(void)setParagraphSpacing:(CGFloat)paragraphSpacing
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.paragraphSpacing = paragraphSpacing; }];
}


-(NSTextAlignment)alignment
{
    return self.paragraphStyle.alignment;
}


-(void)setAlignment:(NSTextAlignment)alignment
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.alignment = alignment; }];
}


-(CGFloat)firstLineHeadIndent
{
    return self.paragraphStyle.firstLineHeadIndent;
}


-(void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.firstLineHeadIndent = firstLineHeadIndent; }];
}


-(CGFloat)headIndent
{
    return self.paragraphStyle.headIndent;
}


-(void)setHeadIndent:(CGFloat)headIndent
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.headIndent = headIndent; }];
}


-(CGFloat)tailIndent
{
    return self.paragraphStyle.tailIndent;
}


-(void)setTailIndent:(CGFloat)tailIndent
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.tailIndent = tailIndent; }];
}


-(NSLineBreakMode)lineBreakMode
{
    return self.paragraphStyle.lineBreakMode;
}


-(void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.lineBreakMode = lineBreakMode; }];
}


-(CGFloat)minimumLineHeight
{
    return self.paragraphStyle.minimumLineHeight;
}


-(void)setMinimumLineHeight:(CGFloat)minimumLineHeight
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.minimumLineHeight = minimumLineHeight; }];
}


-(CGFloat)maximumLineHeight
{
    return self.paragraphStyle.maximumLineHeight;
}


-(void)setMaximumLineHeight:(CGFloat)maximumLineHeight
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.maximumLineHeight = maximumLineHeight; }];
}


-(NSWritingDirection)baseWritingDirection
{
    return self.paragraphStyle.baseWritingDirection;
}


-(void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.baseWritingDirection = baseWritingDirection; }];
}


-(CGFloat)lineHeightMultiple
{
    return self.paragraphStyle.lineHeightMultiple;
}


-(void)setLineHeightMultiple:(CGFloat)lineHeightMultiple
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.lineHeightMultiple = lineHeightMultiple; }];
}


-(CGFloat)paragraphSpacingBefore
{
    return self.paragraphStyle.paragraphSpacingBefore;
}


-(void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.paragraphSpacingBefore = paragraphSpacingBefore; }];
}


-(float)hyphenationFactor
{
    return self.paragraphStyle.paragraphSpacingBefore;
}


-(void)setHyphenationFactor:(float)hyphenationFactor
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *p) { p.hyphenationFactor = hyphenationFactor; }];
}


-(NSUnderlineStyle)strikethroughStyle
{
    return [_attributes[NSStrikethroughStyleAttributeName] integerValue];
}


-(void)setStrikethroughStyle:(NSUnderlineStyle)strikethroughStyle
{
    if ( !strikethroughStyle )
        [_attributes removeObjectForKey:NSStrikethroughStyleAttributeName];
    else
        _attributes[NSStrikethroughStyleAttributeName] = @(strikethroughStyle);
}


-(UIColor *)strikethroughColor
{
    return _attributes[NSStrikethroughColorAttributeName];
}


-(void)setStrikethroughColor:(UIColor *)strikethroughColor
{
    if ( !strikethroughColor )
        [_attributes removeObjectForKey:NSStrikethroughColorAttributeName];
    else
        _attributes[NSStrikethroughColorAttributeName] = strikethroughColor;
}


-(NSUnderlineStyle)underlineStyle
{
    return [_attributes[NSUnderlineStyleAttributeName] integerValue];
}


-(void)setUnderlineStyle:(NSUnderlineStyle)underlineStyle
{
    if ( !underlineStyle )
        [_attributes removeObjectForKey:NSUnderlineStyleAttributeName];
    else
        _attributes[NSUnderlineStyleAttributeName] = @(underlineStyle);
}


-(UIColor *)underlineColor
{
    return _attributes[NSUnderlineColorAttributeName];
}


-(void)setUnderlineColor:(UIColor *)underlineColor
{
    if ( !underlineColor )
        [_attributes removeObjectForKey:NSUnderlineColorAttributeName];
    else
        _attributes[NSUnderlineColorAttributeName] = underlineColor;
}


-(UIColor *)strokeColor
{
    return _attributes[NSStrokeColorAttributeName];
}


-(void)setStrokeColor:(UIColor *)strokeColor
{
    if ( !strokeColor )
        [_attributes removeObjectForKey:NSStrokeColorAttributeName];
    else
        _attributes[NSStrokeColorAttributeName] = strokeColor;
}


-(float)strokeWidth
{
    return [_attributes[NSStrokeWidthAttributeName] floatValue];
}


-(void)setStrokeWidth:(float)strokeWidth
{
    if ( !strokeWidth )
        [_attributes removeObjectForKey:NSStrokeWidthAttributeName];
    else
        _attributes[NSStrokeWidthAttributeName] = @(strokeWidth);
}


-(NSShadow *)shadow
{
    return [_attributes[NSShadowAttributeName] copy];
}


-(void)setShadow:(NSShadow *)shadow
{
    if ( !shadow )
        [_attributes removeObjectForKey:NSShadowAttributeName];
    
    else
        _attributes[NSShadowAttributeName] = [shadow copy];
}


-(CGSize)shadowOffset
{
    return self.shadow.shadowOffset;
}


-(void)setShadowOffset:(CGSize)shadowOffset
{
    NSShadow *shadow = _attributes[NSShadowAttributeName];
    
    if ( !shadow )
        shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = shadowOffset;
    
    _attributes[NSShadowAttributeName] = shadow;
}


-(UIColor *)shadowColor
{
    return self.shadow.shadowColor;
}


-(void)setShadowColor:(UIColor *)shadowColor
{
    NSShadow *shadow = _attributes[NSShadowAttributeName];
    
    if ( !shadow )
        shadow = [[NSShadow alloc] init];
    
    shadow.shadowColor = shadowColor;
    
    _attributes[NSShadowAttributeName] = shadow;
}


-(CGFloat)shadowBlurRadius
{
    return self.shadow.shadowBlurRadius;
}


-(void)setShadowBlurRadius:(CGFloat)shadowBlurRadius
{
    NSShadow *shadow = _attributes[NSShadowAttributeName];
    
    if ( !shadow )
        shadow = [[NSShadow alloc] init];
    
    shadow.shadowBlurRadius = shadowBlurRadius;
    
    _attributes[NSShadowAttributeName] = shadow;
}


-(NSString *)textEffect
{
    return _attributes[NSTextEffectAttributeName];
}


-(void)setTextEffect:(NSString *)textEffect
{
    if ( !textEffect )
        [_attributes removeObjectForKey:NSTextEffectAttributeName];
    else
        _attributes[NSTextEffectAttributeName] = textEffect;
}


-(BOOL)textEffectLetterPress
{
    return [self.textEffect isEqualToString:NSTextEffectLetterpressStyle];
}


-(void)setTextEffectLetterPress:(BOOL)textEffectLetterPress
{
    self.textEffect = (textEffectLetterPress) ? NSTextEffectLetterpressStyle : nil;
}


-(UIColor *)foregroundColor
{
    UIColor *foregroundColor = _attributes[NSForegroundColorAttributeName];
    
    return (foregroundColor) ? foregroundColor : [UIColor darkTextColor];
}


-(void)setForegroundColor:(UIColor *)foregroundColor
{
    if ( !foregroundColor )
        [_attributes removeObjectForKey:NSForegroundColorAttributeName];
    else
        _attributes[NSForegroundColorAttributeName] = foregroundColor;
}


-(UIColor *)backgroundColor
{
    UIColor * backgroundColor = _attributes[NSBackgroundColorAttributeName];
    
    return (backgroundColor) ? backgroundColor : [UIColor clearColor];
}


-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    if ( !backgroundColor )
        [_attributes removeObjectForKey:NSBackgroundColorAttributeName];
    else
        _attributes[NSBackgroundColorAttributeName] = backgroundColor;
}


#pragma mark - push/pop


-(void)pushAttributes
{
    if ( !_attributeStack )
        _attributeStack = [NSMutableArray array];
    
    [_attributeStack addObject:_attributes];
}


-(void)popAttributes
{
    if ( !_attributeStack.count )
        @throw [NSException exceptionWithName:@"UnbalancedPushPop" reason:@"Unbalanced push/pop calls to NTAttributedStringBuilder" userInfo:nil];
    
    _attributes = [_attributeStack lastObject];
    [_attributeStack removeLastObject];
}


-(void)clearAttributes
{
    _attributes = [[self.class defaultAttributes] mutableCopy];
}


#pragma mark - Append


-(void)append:(id)item
{
    // Nil or null are ignored...
    
    if ( item == nil || item == [NSNull null] )
        return ;
    
    // Expand arrays...
    
    if ( [item isKindOfClass:[NSArray class]] )
    {
        for(id subitem in (NSArray *)item)
            [self append:subitem];
        
        return ;
    }
    
    // Handle appending text...
    
    if ( [item isKindOfClass:[NSString class]] )
    {
        NSString *string = item;
        
        [_attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:string attributes:_attributes]];
        
        return ;
    }
    
    // Handle dictionaries, which are added as attributes...
    
    if ( [item isKindOfClass:[NSDictionary class]] )
    {
        NSDictionary *attributes = item;
        
        for(NSString *key in attributes.allKeys)
        {
            id value = [attributes objectForKey:key];
            
            if ( value == [NSNull null] )
                [_attributes removeObjectForKey:key];
            else
                [_attributes setValue:value forKey:key];
        }
        
        return ;
    }
    
    // Append elements...
    
    if ( [item conformsToProtocol:@protocol(NTAttributedStringBuilderElement)] )
    {
        id<NTAttributedStringBuilderElement> element = item;
        
        [element appendToAttributedStringBuilder:self];
        
        return ;
    }

    // Ok we've got something we don't understand here...
    
    @throw [NSException exceptionWithName:@"UnexpectedType"
                                   reason:[NSString stringWithFormat:@"Unexpected type %@ for NTAttributedStringBuilder append", NSStringFromClass([item class])] userInfo:nil];
}


-(void)appendFormat:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    
    [self append:[[NSString alloc] initWithFormat:format arguments:args]];
}


+(NSMutableAttributedString *)build:(NSArray *)items
{
    NTAttributedStringBuilder *builder = [[NTAttributedStringBuilder alloc] init];
    
    [builder append:items];
    
    return builder.attributedString;
}

@end


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


@interface UIFont (NTAttr) <NTAttributedStringBuilderElement>

@end


@implementation UIFont (NTAttr)


-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.font = self;
}


@end


@interface UIColor (NTAttr) <NTAttributedStringBuilderElement>

@end


@implementation UIColor (NTAttr)

-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.foregroundColor = self;
}

@end



@interface NSParagraphStyle (NTAttr) <NTAttributedStringBuilderElement>

@end


@implementation NSParagraphStyle (NTAttr)


-(void)appendToAttributedStringBuilder:(NTAttributedStringBuilder *)builder
{
    builder.paragraphStyle = self;
}


@end




