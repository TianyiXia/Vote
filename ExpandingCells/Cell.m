//
//  Cell.m
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import "Cell.h"


@implementation Cell



@synthesize b0Function;
@synthesize b1Function;
@synthesize index;
@synthesize cellName;




-(int)getHeight
{
	return [self frame].size.height;
}




-(void)expand
{
	 CGRect	oldFrame = [self frame];
	 
	 [self setFrame:CGRectMake(	oldFrame.origin.x,
					oldFrame.origin.y,
					oldFrame.size.width,
					oldFrame.size.height * 3)];
}




-(void)contract
{
	CGRect	oldFrame = [self frame];
						 
	[self setFrame:CGRectMake(	oldFrame.origin.x,
					oldFrame.origin.y,
					oldFrame.size.width,
					oldFrame.size.height / 3)];
}




#pragma mark IBActions

-(IBAction)buttonWasPressed:(id)sender
{
    
	ButtonPressBlock	f0	= [self b0Function];
    f0();
	
}




/*
	Keep in mind that this function won't be called for these cells -- we're loading them
	from a NIB, so you'll have to do any setup elsewhere
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
	return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
	
{	[super setSelected:selected animated:animated];
}

- (void)dealloc {
    [_yobutton release];
    [_eventDetail release];
    [super dealloc];
}
@end
