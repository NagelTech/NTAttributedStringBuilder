NTAttributedStringBuilder
=========================

A fast, flexible and easy-to-use tool for building attributed strings. Does NOT rely on embedded HTML.

NSMutableAttributedString is very cumbersome and error-prone for building attributed strings. 
The most common approach is to create AttributedStrings by parsing some kind of html or markdown. While this approach is workable, 
they embed commands into strings so you end up running your app repeatedly to see if  the syntax is correct. Additionally, you 
don't get any help from the Xcode's auto-compete when creating the strings.

NTAttributedStringbuilder takes a different approach. It maintains a dictionary of current attributes which are applied to text as 
it is appended. By changing the attributes in interesting ways, it's possible build very complex attributes strings.

A few examples are included here. Classes are well documented and "quick help enabled."

Using NTAttributedStringBuilder Properties
------------------------------------------

Almost any attribute can be set as a property. Not only are the high-level attributes exposed, but nested attributes such as those 
in appending text uses the current values of the attributes. Here's a simple example:

    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    b.firstLineHeadIndent = 20;
    b.paragraphSpacing = 10.0;
    b.lineSpacing = 5.0;
    b.font = [UIFont fontWithName:@"Avenir-LightOblique" size:12.0];

    [b append:someText];
    
	self.label.attributedString = b.attributedString;
	
Appending NTAttr (and other) Attributes
---------------------------------------

Additionally, attributes maybe set by passing values to the append method. Append handles a several special objects:

 * `NSArray` - the contents of the array are expanded recursively. This is a great way to create "styles" - an array of other 
 settings.
 * `NSDictionary` - the contents of the dictionary are applies as attributes. Keys are the attribute name. Values are the attribute 
 value to set or NSNull to clear the attribute.
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

Installation
============

If you are using cocoapods, add 'pod NTAttributedStringBuilder' to your podfile. If you are doing things old school, copy the .m 
and .h files into your project and enjoy!
