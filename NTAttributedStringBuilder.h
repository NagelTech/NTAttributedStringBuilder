//
//  NTAttributedStringBuilder.h
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAttributedStringBuilderElement.h"
#import "NTAttr.h"
#import "NTAttributedStringBuilderCategories.h"


/// This class allow you to easily build NSAttributedStrings. NTAttributedStringBuilder maintaines a dictionary of current
/// attributes which are applied to text whenever it is appended. By changing the current set of attributes you can create
/// very complex attributed strings easily.
/// @remarks the current attributes may be updated either by setting properties that update the attributes directly
/// (such as .font or .lineHeight) or by passing instances of objects into append: that update the current attributes (technically
/// these are classes the implement the NTAttributedStringBuilderElement protocol.) Instances that can update almost any attribute
/// are available in the NTAttr helper class. Additionally, UIFonts, UIColors and NSParagraphsStyles may be passed in directly.
/// append: will append the contents of NSArray's recursively, so you can pass an array of style commands. Often these "style
/// arrays" can be declared once and reused for clarity.
/// @see https://github.com/NagelTech/NTAttributedStringBuilder for more information and examples.
@interface NTAttributedStringBuilder : NSObject

/// The default font, which is used if one is not explicitly set.
+(UIFont *)defaultFont;

/// The current NSAttributedString
@property (readonly, nonatomic)     NSMutableAttributedString *attributedString;

/// the current set of attributes
@property (readonly, nonatomic)     NSMutableDictionary *attributes;

/// the current font. If you do not specify this value, the string uses a 12-point Helvetica(Neue) font by default.
@property (nonatomic)               UIFont *font;

/// the current font name. If you do not specify this value, the string uses a 12-point Helvetica(Neue) font by default.
@property (nonatomic)               NSString *fontName;

/// the current font size. If you do not specify this value, the string uses a 12-point Helvetica(Neue) font by default.
@property (nonatomic)               CGFloat fontSize;

/// the current paragraph style.  If you do not specify this value, the string uses the default paragraph attributes, as returned
/// by the defaultParagraphStyle method of NSParagraphStyle.
@property (nonatomic)               NSParagraphStyle *paragraphStyle;

/// The distance in points between the bottom of one line fragment and the top of the next.
/// @remarks This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
@property (nonatomic)               CGFloat lineSpacing;

/// The space after the end of the paragraph.
/// @remarks This property contains the space (measured in points) added at the end of the paragraph to separate it from the
/// following paragraph. This value must be nonnegative. The space between paragraphs is determined by adding the previous
/// paragraph’s paragraphSpacing and the current paragraph’s paragraphSpacingBefore.
@property (nonatomic)               CGFloat paragraphSpacing;

/// The text alignment of the string.
/// @remarks Natural text alignment is realized as left or right alignment depending on the line sweep direction of the first
/// script contained in the paragraph.
@property (nonatomic)               NSTextAlignment alignment;

/// The indentation of the first line of the string.
/// @remarks This property contains the distance (in points) from the leading margin of a text container to the beginning of the
/// paragraph’s first line. This value is always nonnegative.
@property (nonatomic)               CGFloat firstLineHeadIndent;

/// The indentation of the string's lines other than the first.
/// @remarks This property contains the distance (in points) from the leading margin of a text container to the beginning of lines
/// other than the first. This value is always nonnegative.
@property (nonatomic)               CGFloat headIndent;

/// The trailing indentation of the receiver.
/// @remarks If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text).
/// If 0 or negative, it’s the distance from the trailing margin. For example, a paragraph style designed to fit exactly in a 2-
/// inch wide container has a head indent of 0.0 and a tail indent of 0.0. One designed to fit with a quarter-inch margin has a
/// head indent of 0.25 and a tail indent of –0.25.
@property (nonatomic)               CGFloat tailIndent;

/// The mode that should be used to break lines in the string.
/// @remarks This property contains the line break mode to be used laying out the paragraph’s text. For a list of line break
/// constants, see the “Constants” section of NSParagraphStyle Class Reference.
@property (nonatomic)               NSLineBreakMode lineBreakMode;

/// The string’s minimum height.
/// @remarks This property contains the minimum height in points that any line in the receiver will occupy, regardless of the font
/// size or size of any attached graphic. This value must be nonnegative.
@property (nonatomic)               CGFloat minimumLineHeight;

/// The string's maximum line height.
/// @remarks This property contains the maximum height in points that any line in the receiver will occupy, regardless of the font
/// size or size of any attached graphic. This value is always nonnegative. The default value is 0. Glyphs and graphics exceeding
/// this height will overlap neighboring lines; however, a maximum height of 0 implies no line height limit. Although this limit
/// applies to the line itself, line spacing adds extra space between adjacent lines.
@property (nonatomic)               CGFloat maximumLineHeight;

/// The base writing direction for the string.
/// @remarks If you specify NSWritingDirectionNaturalDirection, the receiver resolves the writing direction to either
/// NSWritingDirectionLeftToRight or NSWritingDirectionRightToLeft, depending on the direction for the user’s language preference
/// setting.
@property (nonatomic)               NSWritingDirection baseWritingDirection;

/// The line height multiple.
/// @remarks The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum
/// and maximum line height. The default value of this property is 0.0.
@property (nonatomic)               CGFloat lineHeightMultiple;

/// The distance between the paragraph’s top and the beginning of its text content.
/// @remarks This property contains the space (measured in points) between the paragraph’s top and the beginning of its text
/// content. The default value of this property is 0.0.
@property (nonatomic)               CGFloat paragraphSpacingBefore;

/// The paragraph’s threshold for hyphenation.
/// @remarks Valid values lie between 0.0 and 1.0 inclusive. The default value is 0.0. Hyphenation is attempted when the ratio of
/// the text width (as broken without hyphenation) to the width of the line fragment is less than the hyphenation factor. When the
/// paragraph’s hyphenation factor is 0.0, the layout manager’s hyphenation factor is used instead. When both are 0.0, hyphenation
/// is disabled.
@property (nonatomic)               float hyphenationFactor;

/// This value indicates whether the text has a line through it and corresponds to one of the constants described in “Underline and
/// Strikethrough Style Attributes”. The default value for this attribute is NSUnderlineStyleNone.
@property (nonatomic)               NSUnderlineStyle strikethroughStyle;

/// The strikethrough UIColor. The default value is nil, indicating same as foreground color.
@property (nonatomic)               UIColor *strikethroughColor;

/// This value indicates whether the text is underlined and corresponds to one of the constants described in “Underline and
/// Strikethrough Style Attributes”. The default value for this attribute is NSUnderlineStyleNone.
@property (nonatomic)               NSUnderlineStyle underlineStyle;

/// The underline UIColor. The default value is nil, indicating same as foreground color.
@property (nonatomic)               UIColor *underlineColor;

/// The outline color. The default value is nil, indicating same as foreground color.
@property (nonatomic)               UIColor *strokeColor;

/// The stroke width as a percentage of the point size.
/// @remarks This value represents the amount to change the stroke width and is specified as a percentage of the font point size.
/// Specify 0 (the default) for no additional changes. Specify positive values to change the stroke width alone. Specify negative
/// values to stroke and fill the text. For example, a typical value for outlined text would be 3.0.
@property (nonatomic)               float strokeWidth;

/// This property encapsulates the attributes used to create a drop shadow during drawing operations.
@property (nonatomic)               NSShadow *shadow;

/// The offset values of the shadow.
/// @remarks This property contains the horizontal and vertical offset values, specified using the width and height fields of the
/// CGSize data type. These offsets are measured using the default user coordinate space and are not affected by custom
/// transformations. This means that positive values always extend down and to the right from the user's perspective.
@property (nonatomic)               CGSize shadowOffset;

/// The color of the shadow.
/// @remarks The default shadow color is black with an alpha of 1/3. If you set this property to nil, the shadow is not drawn.
@property (nonatomic)               UIColor *shadowColor;

/// The blur radius of the shadow.
/// @remarks This property contains the blur radius, as measured in the default user coordinate space. A value of 0 indicates no
/// blur, while larger values produce correspondingly larger blurring. The default value is 0.
@property (nonatomic)               CGFloat shadowBlurRadius;

/// Use this property to specify a text effect, such as NSTextEffectLetterpressStyle. The default value of this property is nil,
/// indicating no text effect.
@property (nonatomic)               NSString *textEffect;

/// Use this property to specify a URL, the default is nil, indicating no URL.
@property (nonatomic)               NSURL *link;

/// set to YES to enable the LetterPress text effect or NO to disable it.
/// @remarks this is the same as setting (or clearing) the textEffect property to NSTextEffectLetterpressStyle
@property (nonatomic)               BOOL textEffectLetterPress;

/// Use this property to specify the color of the text during rendering. If you do not specify this attribute, the text is rendered
/// in black.
@property (nonatomic)               UIColor *foregroundColor;

/// Use this attribute to specify the color of the background area behind the text. If you do not specify this attribute, no
/// background color is drawn.
@property (nonatomic)               UIColor *backgroundColor;

/// This value specifies the number of points by which to adjust kern-pair characters. Kerning prevents unwanted space from occurring
/// between specific characters and depends on the font. The value 0 means kerning is disabled. The default value for this attribute
/// is 0.
@property (nonatomic)               CGFloat kern;

-(id)init;

/// Push the current attributes onto a stack.
-(void)pushAttributes;

/// Restore previously pushed attributes.
/// @remarks Throws an exception if pop is called when there is no corresponding push.
-(void)popAttributes;

/// Clear all attributes, restoring defaults
-(void)clearAttributes;

/// Append an item to the NSAttributedString.
/// @remarks This method will handle several different objects being passed to it. NSString's
/// will be appended using the current attributes. NSArray's contents will be expanded recursively. NSDictionaries will be
/// interpreted is collection of attributes to be applied. Any object that respond to the NTAttributedStringBuilderElement
/// protocol can modify attributes. [NTAttr ...] methods as well as UIFont, UIColor or NSPAragraphSettings also modify the
/// current attributes.
/// @param item The item to append. See remarks for more information.
/// @see https://github.com/NagelTech/NTAttributedStringBuilder for more info and example usage.
-(void)append:(id)item;

/// Appends the formatted string using the current attributes
-(void)appendFormat:(NSString *)format, ...;

/// A helper method that builds an NSAtributedString processing the array of items passed in.
+(NSMutableAttributedString *)build:(NSArray *)items;

@end


