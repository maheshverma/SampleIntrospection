//
//  MV_InfoView.h
//  SampleAppIntrospection
//
//  Created by Mahesh on 26/05/14.
//  Copyright (c) 2014 Mahesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MV_InfoView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lblAppName;
@property (weak, nonatomic) IBOutlet UILabel *lblArchieveNo;
@property (weak, nonatomic) IBOutlet UILabel *lblBuildDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDeveloper;
- (IBAction)handleDone:(id)sender;
@end
