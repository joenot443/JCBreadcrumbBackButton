//
//  MainNavigationController.m
//  JCBreadcrumbBackButton
//
//  Created by Joe Crozier on 2017-06-14.
//  Copyright © 2017 Joe Crozier. All rights reserved.
//

#import "MainNavigationController.h"
#import "DummyViewController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Push an initial DummyVC
    DummyViewController *dummyVC = [[DummyViewController alloc] init];
    [self pushViewController:dummyVC animated:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view.}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}

@end
