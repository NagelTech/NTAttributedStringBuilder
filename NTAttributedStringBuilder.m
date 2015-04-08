//
//  NTAttributedStringBuilder.m
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
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


+(UIFont *)defaultFont
{
    return [UIFont fontWithName:@"HelveticaNeue" size:12.0];    // per NSMutableAttributedString docs
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
        _attributes = [NSMutableDictionary dictionary];
    }
    
    return self;
}


#pragma mark - attribute Properties


-(UIFont *)font
{
    UIFont *font = _attributes[NSFontAttributeName];
    
    return (font) ? font : [self.class defaultFont];
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
    
    return (paragraphStyle) ? paragraphStyle : [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
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
        paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
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


-(NSURL *)link
{
    return _attributes[NSLinkAttributeName];
}


-(void)setLink:(NSURL *)link
{
    if ( !link )
        [_attributes removeObjectForKey:NSLinkAttributeName];
    else
        _attributes[NSLinkAttributeName] = link;
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


-(CGFloat)kern
{
    return (CGFloat)[_attributes[NSKernAttributeName] doubleValue];
}


-(void)setKern:(CGFloat)kern
{
    if ( kern == 0 )
        [_attributes removeObjectForKey:NSKernAttributeName];
    else
        _attributes[NSKernAttributeName] = @(kern);
}


#pragma mark - push/pop


-(void)pushAttributes
{
    if ( !_attributeStack )
        _attributeStack = [NSMutableArray array];
    
    [_attributeStack addObject:[_attributes copy]];
}


-(void)popAttributes
{
    if ( !_attributeStack.count )
        @throw [NSException exceptionWithName:@"UnbalancedPushPop" reason:@"Unbalanced push/pop calls to NTAttributedStringBuilder" userInfo:nil];
    
    _attributes = [[_attributeStack lastObject] mutableCopy];
    [_attributeStack removeLastObject];
}


-(void)clearAttributes
{
    [_attributes removeAllObjects];
}


#pragma mark - Append


-(void)append:(id)item
{
    // Nil or null are ignored...
    
    if ( item == nil || item == [NSNull null] )
        return ;
    
    // Expand arrays...
    // (We could extend NSArray to implement NTAttributdStringBuilderElement to accomplish this too, but
    // maybe it's better to be clear about what's going here, eh?)
    // (This actually goes for our treatment of NSStrings and NSDictionaries too.)
    
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




