//
//  NTAttr.h
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAttributedStringBuilderElement.h"


/// Helper class for NTAttributedStringBuilder. Each ethod returns an object that will update the NTAttributedStringBuilder's
/// current attributes when passed to [NTAttributedStringBuilder append:].
@interface NTAttr : NSObject<NTAttributedStringBuilderElement>

/// set the current font. If you pass nil, the string uses a 12-point Helvetica(Neue) font by default.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)font:(UIFont *)font;

/// set the current font name.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)fontSize:(CGFloat)fontSize;

/// set the current font size.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)fontName:(NSString *)fontName;

/// set the current paragraph style.  If you pass nil, the string uses the default paragraph attributes, as
/// returned by the defaultParagraphStyle method of NSParagraphStyle.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)paragraphStyle:(NSParagraphStyle *)paragraphStyle;

/// set the distance in points between the bottom of one line fragment and the top of the next.
/// @remarks This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)lineSpacing:(CGFloat)lineSpacing;

/// set the space after the end of the paragraph.
/// @remarks This property contains the space (measured in points) added at the end of the paragraph to separate it from the
/// following paragraph. This value must be nonnegative. The space between paragraphs is determined by adding the previous
/// paragraph’s paragraphSpacing and the current paragraph’s paragraphSpacingBefore.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)paragraphSpacing:(CGFloat)paragraphSpacing;

/// set the text alignment of the string.
/// @remarks Natural text alignment is realized as left or right alignment depending on the line sweep direction of the first
/// script contained in the paragraph.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)alignment:(NSTextAlignment)alignment;

/// set he indentation of the first line of the string.
/// @remarks This property contains the distance (in points) from the leading margin of a text container to the beginning of the
/// paragraph’s first line. This value is always nonnegative.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)firstLineHeadIndent:(CGFloat)firstLineHeadIndent;

/// set the indentation of the string's lines other than the first.
/// @remarks This property contains the distance (in points) from the leading margin of a text container to the beginning of lines
/// other than the first. This value is always nonnegative.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)headIndent:(CGFloat)headIndent;

/// set the trailing indentation of the receiver.
/// @remarks If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text).
/// If 0 or negative, it’s the distance from the trailing margin. For example, a paragraph style designed to fit exactly in a 2-
/// inch wide container has a head indent of 0.0 and a tail indent of 0.0. One designed to fit with a quarter-inch margin has a
/// head indent of 0.25 and a tail indent of –0.25.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)tailIndent:(CGFloat)tailIndent;

/// set the mode that should be used to break lines in the string.
/// @remarks This property contains the line break mode to be used laying out the paragraph’s text. For a list of line break
/// constants, see the “Constants” section of NSParagraphStyle Class Reference.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)lineBreakMode:(NSLineBreakMode)lineBreakMode;

/// set the string’s minimum height.
/// @remarks This property contains the minimum height in points that any line in the receiver will occupy, regardless of the font
/// size or size of any attached graphic. This value must be nonnegative.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)minimumLineHeight:(CGFloat)minimumLineHeight;

/// set the string's maximum line height.
/// @remarks This property contains the maximum height in points that any line in the receiver will occupy, regardless of the font
/// size or size of any attached graphic. This value is always nonnegative. The default value is 0. Glyphs and graphics exceeding
/// this height will overlap neighboring lines; however, a maximum height of 0 implies no line height limit. Although this limit
/// applies to the line itself, line spacing adds extra space between adjacent lines.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)maximumLineHeight:(CGFloat)maximumLineHeight;

/// set the base writing direction for the string.
/// @remarks If you specify NSWritingDirectionNaturalDirection, the receiver resolves the writing direction to either
/// NSWritingDirectionLeftToRight or NSWritingDirectionRightToLeft, depending on the direction for the user’s language preference
/// setting.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)baseWritingDirection:(NSWritingDirection)baseWritingDirection;

/// set the line height multiple.
/// @remarks The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum
/// and maximum line height. The default value of this property is 0.0.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)lineHeightMultiple:(CGFloat)lineHeightMultiple;

/// set the distance between the paragraph’s top and the beginning of its text content.
/// @remarks This property contains the space (measured in points) between the paragraph’s top and the beginning of its text
/// content. The default value of this property is 0.0.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore;

/// set he paragraph’s threshold for hyphenation.
/// @remarks Valid values lie between 0.0 and 1.0 inclusive. The default value is 0.0. Hyphenation is attempted when the ratio of
/// the text width (as broken without hyphenation) to the width of the line fragment is less than the hyphenation factor. When the
/// paragraph’s hyphenation factor is 0.0, the layout manager’s hyphenation factor is used instead. When both are 0.0, hyphenation
/// is disabled.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)hyphenationFactor:(float)hyphenationFactor;

/// this value indicates whether the text has a line through it and corresponds to one of the constants described in “Underline and
/// Strikethrough Style Attributes”. The default value for this attribute is NSUnderlineStyleNone.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)strikethroughStyle:(NSUnderlineStyle)strikethroughStyle;

/// set the strikethrough UIColor. The default value is nil, indicating same as foreground color.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)strikethroughColor:(UIColor *)strikethroughColor;

/// this value indicates whether the text is underlined and corresponds to one of the constants described in “Underline and
/// Strikethrough Style Attributes”. The default value for this attribute is NSUnderlineStyleNone.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)underlineStyle:(NSUnderlineStyle)underlineStyle;

/// set the underline UIColor. The default value is nil, indicating same as foreground color.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)underlineColor:(UIColor *)underlineColor;

/// set the outline color. The default value is nil, indicating same as foreground color.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)strokeColor:(UIColor *)strokeColor;

/// set the stroke width as a percentage of the point size.
/// @remarks This value represents the amount to change the stroke width and is specified as a percentage of the font point size.
/// Specify 0 (the default) for no additional changes. Specify positive values to change the stroke width alone. Specify negative
/// values to stroke and fill the text. For example, a typical value for outlined text would be 3.0.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)strokeWidth:(float)strokeWidth;

/// This property encapsulates the attributes used to create a drop shadow during drawing operations.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)shadow:(NSShadow *)shadow;

/// set the offset values of the shadow.
/// @remarks This property contains the horizontal and vertical offset values, specified using the width and height fields of the
/// CGSize data type. These offsets are measured using the default user coordinate space and are not affected by custom
/// transformations. This means that positive values always extend down and to the right from the user's perspective.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)shadowOffset:(CGSize)shadowOffset;

/// set the color of the shadow.
/// @remarks The default shadow color is black with an alpha of 1/3. If you set this property to nil, the shadow is not drawn.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)shadowColor:(UIColor *)shadowColor;

/// set the blur radius of the shadow.
/// @remarks This property contains the blur radius, as measured in the default user coordinate space. A value of 0 indicates no
/// blur, while larger values produce correspondingly larger blurring. The default value is 0.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)shadowBlurRadius:(CGFloat)shadowBlurRadius;

/// set the textEffect. Use this property to specify a text effect, such as NSTextEffectLetterpressStyle. pass nil to indicate no
/// text effect.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)textEffect:(NSString *)textEffect;

/// set to YES to enable the LetterPress text effect or NO to disable it.
/// @remarks this is the same as setting (or clearing) the textEffect property to NSTextEffectLetterpressStyle
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)textEffectLetterPress:(BOOL)textEffectLetterPress;

/// set the color of the text during rendering. If you do not specify this attribute, the text is rendered in black.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)foregroundColor:(UIColor *)foregroundColor;

/// set the background area behind the text. If you do not specify this attribute, no background color is drawn.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)backgroundColor:(UIColor *)backgroundColor;

/// Push the current attributes onto a stack.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)push;

/// Restore previously pushed attributes.
/// @remarks Throws an exception if pop is called when there is no corresponding push.
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)pop;

/// Clear all attributes, restoring defaults
/// @return an instance of NTAttr that will update NTAttributedStringBuilder's current attributes when passed [NTAttributedStringBuilder append:]
+(NTAttr *)clear;

/// Starts a Link (URL) wit the passed URL. Append endLink to end the current link.
+(NTAttr *)startLink:(NSURL *)link;

/// Ends the current Link (URL), if there is one.
+(NTAttr *)endLink;

@end
