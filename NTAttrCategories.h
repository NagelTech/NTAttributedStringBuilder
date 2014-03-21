//
//  NTAttrCategories.h
//
//  Created by Ethan Nagel on 3/20/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAttributedStringBuilderElement.h"


@interface UIFont (NTAttr) <NTAttributedStringBuilderElement>
@end


@interface UIColor (NTAttr) <NTAttributedStringBuilderElement>
@end


@interface NSParagraphStyle (NTAttr) <NTAttributedStringBuilderElement>
@end

