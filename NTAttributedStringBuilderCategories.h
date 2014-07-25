//
//  NTAttributedStringBuilderCategories.h
//
//  Copyright (c) 2014 Ethan Nagel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAttributedStringBuilderElement.h"


@interface UIFont (NTAttributedStringBuilder) <NTAttributedStringBuilderElement>
@end


@interface UIColor (NTAttributedStringBuilder) <NTAttributedStringBuilderElement>
@end


@interface NSParagraphStyle (NTAttributedStringBuilder) <NTAttributedStringBuilderElement>
@end


@interface NSURL (NTAttributedStringBuilder) <NTAttributedStringBuilderElement>

@end