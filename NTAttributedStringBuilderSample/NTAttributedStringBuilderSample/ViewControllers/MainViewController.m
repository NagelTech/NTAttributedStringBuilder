//
//  MainViewController.m
//  NTAttributedStringBuilderSample
//
//  Created by Ethan Nagel on 3/19/14.
//  Copyright (c) 2014 NagelTech. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;

@property (nonatomic) int sampleIndex;
@property (nonatomic) NSArray *samples;

@end



@implementation MainViewController

- (id)init
{
    self = [super initWithNibName:NSStringFromClass(self.class) bundle:nil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}


#pragma mark - UIViewControllerOverrides

-(NSAttributedString *)sample0
{
    UIFont *normalFont = [UIFont fontWithName:@"Futura-Medium" size:14.0];
    UIFont *codeFont = [UIFont fontWithName:@"Courier-Bold" size:14.0];
    
    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    // Set up some parahraph options...
    
    b.firstLineHeadIndent = 20;
    b.paragraphSpacing = 10.0;
    b.lineSpacing = 5.0;
    
    b.font = normalFont;

    [b append:@"This sample uses the most basic approach to creating attributed strings with "];
    
    b.font = codeFont;
    [b append:@"NTAttributedStringBuilder"];
    b.font = normalFont;

    [b append:@". Properties are pre-defined for just about any attributed you can set. You can change the "];
    
    b.foregroundColor = [UIColor redColor];
    [b append:@"foregroundColor"];
    b.foregroundColor = [UIColor blackColor];
    
    [b append:@", "];
    
    b.underlineStyle = NSUnderlineStyleSingle;
    b.underlineColor = [UIColor blueColor];
    [b append:@"underline style"];
    b.underlineStyle = NSUnderlineStyleNone;
    b.underlineColor = nil;
    
    [b append:@" or just about anything else. It's best for setting attributes that span the entire string, such as "];
    [b append:@"paragraph settings. As you can see in this example, it can get a little long-winded when applying changes "];
    [b append:@"to individual pieces of text.\n"];
    
    b.fontSize = 12.0;
    b.headIndent = 20.0;
    b.tailIndent = -20.0;
    b.alignment = NSTextAlignmentJustified; // note firstLineHeadIndent must be set to non-zero for justified to work because of an iOS 7 bug :(
    [b append:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce consequat lacus vel urna imperdiet iaculis. Donec elementum elit sapien, a tristique diam scelerisque eu. Integer vel molestie eros, fringilla gravida sem. Proin ac ligula cursus, auctor lacus at, congue eros. Nulla porttitor venenatis cursus. Morbi ultricies tempus leo, sit amet sodales lectus pellentesque id. Nulla non purus nec nulla facilisis feugiat. Vivamus nec elit interdum, pellentesque arcu non, fermentum ante. Nam eget tristique velit, id ullamcorper lacus. Nam bibendum, orci ac facilisis volutpat, quam diam ullamcorper mi, nec vehicula felis massa eu nulla. Maecenas at lacus in nisi suscipit hendrerit. Cras et diam gravida, pulvinar neque at, imperdiet justo. Maecenas enim urna, ultricies a dictum vitae, fermentum quis eros. Praesent erat lacus, ornare id sapien et, pretium accumsan eros."];
    
    return b.attributedString;
}

-(NSAttributedString *)sample1
{
    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    b.lineHeightMultiple = 1.10;
    b.paragraphSpacing = 1.0;
    
    NSArray *headerStyle = @[[UIFont fontWithName:@"Chalkduster" size:24.0], [UIColor blackColor]];
    NSArray *noteStyle = @[[UIFont fontWithName:@"Avenir-LightOblique" size:12.0], [UIColor colorWithWhite:0.20 alpha:1.0]];
    NSArray *normalStyle = @[[UIFont fontWithName:@"Avenir-Medium" size:16.0], [UIColor colorWithWhite:0.20 alpha:1.0]];
    NSArray *boldStyle = @[[UIFont fontWithName:@"Avenir-Heavy" size:16.0], [UIColor blackColor]];
    
    [b append:@[headerStyle, @"Notes\n", normalStyle]];
    
    [b append:@[noteStyle, @"This example shows how you can use the more advanced features of NTAttributedStringBuilder create reusable styles. This leverages [NTAttributtedStringBuilder append:]'s ability to expand the contents of arrays and parse the objects passed to it to change attributes.\n", normalStyle]];
    
    [b append:@[headerStyle, @"Example\n", normalStyle]];
    
    b.alignment = NSTextAlignmentCenter;

    // http://listofrandomnames.com/, yes it does exist ;)
    
    NSArray *names = @[ @"Dotty", @"Janiece", @"Pinkie", @"Nichole", @"Alta",
                        @"Kandis", @"Dusty", @"Hollis", @"Daren", @"Candelaria",
                        @"Delmy", @"Karina", @"Matha", @"Maryalice", @"Marth",
                        @"Sherlene", @"Sunni", @"Ronnie", @"Nona", @"Lakisha"];

    
    [b append:normalStyle];
    
    [b append:@"You are here with "];
    
    for(int index=0; index<names.count; index++)
    {
        if ( index == 0 )
            ; // nothing
        
        else if ( index == names.count - 1)
            [b append:@" and "];
        
        else
            [b append:@", "];
        
        if ( (index % 5) == 4 )
            [b append:[NTAttr strikethroughStyle:NSUnderlineStyleSingle]];  // strikethrough every 5th item

        [b append:@[boldStyle, names[index], normalStyle, [NTAttr strikethroughStyle:NSUnderlineStyleNone]]];
    }
    
    [b append:@"."];
    
    return b.attributedString;
}


-(NSAttributedString *)sample2
{
    int numFonts = 10;
    
    NSMutableArray *fontNames = [NSMutableArray array];
    
    for(NSString *familyName in [UIFont familyNames])
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName])
            [fontNames addObject:fontName];
    
    NTAttributedStringBuilder *b = [[NTAttributedStringBuilder alloc] init];
    
    // Set some defaults that won't change...
    
    b.lineSpacing = 5.0;
    
    // Some initial text...
    
    [b appendFormat:@"The following is a random sampling of %d fonts:\n", numFonts];
    
    // And now list our fonts...
    
    for(int index=0; index<numFonts; index++)
    {
        NSString *fontName = fontNames[arc4random() % fontNames.count];

        int indent = (index<(numFonts/2)) ? index : (numFonts - index) - 1;
        b.headIndent = indent * 20;
        b.firstLineHeadIndent = b.headIndent;
    
        [b append:@[[UIFont fontWithName:fontName size:14.0], [UIColor blackColor], fontName, @"\n"]];
    }
    
    return b.attributedString;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"NTAttributedStringBuilder";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(doNext:)];
    
    self.samples = @[[self sample0], [self sample1], [self sample2]];
    
    self.sampleLabel.attributedText = self.samples[self.sampleIndex];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions


-(IBAction)doNext:(id)sender
{
    ++self.sampleIndex;
    
    if ( self.sampleIndex >= self.samples.count )
        self.sampleIndex = 0;
    
    self.sampleLabel.attributedText = self.samples[self.sampleIndex];
}


@end
