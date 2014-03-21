NTAttributedStringBuilder
=========================

[in development] A fast, flexible and easy to use tool for building attributed strings. Does NOT rely on embedded HTML.

Let's face it, building NSAttributeStrings is very cumbersome with built-in support.  There are lots of libraries out there that 
attempt to create AttributedStrings by parsing some kind of html or markdown and while these work, they embed data into strings
so you end up running your app repeatedly to see if things llike the syntax is correct.

NTAttributedStringbuilder takes a different approach. IT maintains a dictionary of current attributes and the current attributes are applied to text as it is appended. By changing the attributes in interesting ways, it's possible build very complex attributes strings.

Almost any attribute can be set as a property. Appending text uses the current values of the attribute:

    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    b.firstLineHeadIndent = 20;
    b.paragraphSpacing = 10.0;
    b.lineSpacing = 5.0;
    b.font = normalFont;

    [b append:someText];
    
	self.label.attributedString = b.attributedString;

Additionally, attributes maybe set by passing values to the append method. Append handles a few special objects:

 * `NSArray` - the contents of the array are expanded recursively. This is a great way to create "styles" - an array of other settings.
 * `NSDictionary` - the contents of the dictionary are applies as attributes. keys are the attribute name. Values are the attribute value to set or NSNull to clear the attribute.
 * `NSString` - Strings are appended using the current attributes.
 * `id<NTAttributedStringBuilderElement>` any object implementing this protocol is responsible for appending it's own output.
 * `NTAttr` methods. These methods return objects to set any attribute, such as the line spacing or underlining.
 * `UIFont` - Sets the current font to the value passsed.
 * `UIColor` - Sets the foreground color to the value passed.
 * `NSParagraphSettings` - Sets all paragraph settings using the vaue passed.
 
The append function allows composition of complex formats:

    NSArray *names = @[@"Ethan", @"Tom", @"Scott"];
    
    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    NSArray *nameStyle = @[[NTAttr push], [UIColor redColor], [NTAttr fontName:@"Avenir-Heavy"], [NTAttr underlineStyle:NSUnderlineStyleSingle]];
    NSArray *endNameStyle = @[[NTAttr pop]];
    
    b.font = [UIFont fontWithName:@"Avenir-Medium" size:18.0];
    
    [b appendFormat:@"Here is a list of %d names: ", names.count];
    
    for(int index=0; index<names.count; index++)
    {
        if ( index > 0 )
            [b append:@", "];
        
        [b append:@[nameStyle, names[index], endNameStyle]];
    }
    
    [b append:@"."];

    self.label.attributedString = b.attributedString;
