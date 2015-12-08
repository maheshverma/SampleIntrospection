//
//  MV_InfoView.m
//  SampleAppIntrospection
//
//  Created by Mahesh on 26/05/14.
//  Copyright (c) 2014 Mahesh. All rights reserved.
//

#import "MV_InfoView.h"

@implementation MV_InfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)handleDone:(id)sender {
    [self removeFromSuperview];
}
@end
