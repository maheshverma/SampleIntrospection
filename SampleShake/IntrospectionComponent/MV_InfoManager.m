//
//  MV_InfoManager.m
//  SampleAppIntrospection
//
//  Created by Mahesh on 26/05/14.
//  Copyright (c) 2014 Mahesh. All rights reserved.
//

#import "MV_InfoManager.h"
#import "MV_InfoView.h"

#define kSwipeTouchCount 1

@implementation MV_InfoManager{
    MV_InfoView *viewInfo;
}

+ (id)initializer {
    static MV_InfoManager *initializer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        initializer = [[self alloc] init];
    });
    return initializer;
}

- (id)init {
    if (self = [super init]) {
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"viewInfo" owner:self options:nil];
        viewInfo = [subviewArray objectAtIndex:0];
    }
    return self;
}

-(void)showAppInfo{
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeGesture.numberOfTouchesRequired = kSwipeTouchCount;
    swipeGesture.direction = (UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown);
    
    [[UIApplication sharedApplication].windows[0] addGestureRecognizer:swipeGesture];
    
}

-(void)handleSwipe:(id*)sender{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *build = infoDictionary[(NSString*)kCFBundleVersionKey];
    NSString *bundleName = infoDictionary[(NSString *)kCFBundleNameKey];
    NSString *strArchieveDate = [infoDictionary valueForKey:@"ArcheiveDate"];
    NSString *strDelevoper = [infoDictionary valueForKey:@"Developer"];
    
    [viewInfo.lblAppName setText:bundleName];
    [viewInfo.lblArchieveNo setText:build];
    [viewInfo.lblBuildDate setText:strArchieveDate];
    [viewInfo.lblDeveloper setText:strDelevoper];
    
//    UIView *SuperView = [[UIApplication sharedApplication]keyWindow];
//    [SuperView addSubview:viewInfo];
//    [SuperView bringSubviewToFront:viewInfo];
    
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:viewInfo];

}

@end
