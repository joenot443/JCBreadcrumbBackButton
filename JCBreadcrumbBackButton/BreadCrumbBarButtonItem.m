//
//  BreadCrumbBarButtonItem.m
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-18.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import "BreadCrumbBarButtonItem.h"
#import "BreadCrumbMenuTableViewController.h"

@interface BreadCrumbBarButtonItem()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation BreadCrumbBarButtonItem

- (instancetype)initBreadCrumbBarButtonItem {
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[[UIImage imageNamed:@"BackButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [self.backButton setTitle:@"  Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:self.backButton.tintColor forState:UIControlStateNormal];
    [self.backButton setFrame:CGRectMake(0, 0, 110, 50)];
    UILongPressGestureRecognizer *breadCrumbRecognizerLongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(buttonLongPress:)];
    breadCrumbRecognizerLongPress.minimumPressDuration = 0.5;
    UITapGestureRecognizer *breadCrumbRecognizerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    [self.backButton addGestureRecognizer:breadCrumbRecognizerLongPress];
    [self.backButton addGestureRecognizer:breadCrumbRecognizerTap];
    
    self = [super initWithCustomView:self.backButton];
    return self;
}

- (void)buttonLongPress: (UIGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Long press started");
            [self showBreadCrumbMenu];
            break;
        default:
            break;
    }
}

- (void)buttonTapped: (UIGestureRecognizer *)sender {
    [self.parentController.navigationController popViewControllerAnimated:YES];
}

- (void)showBreadCrumbMenu {
    BreadCrumbMenuTableViewController *tableViewController = [[BreadCrumbMenuTableViewController alloc] initWithViewControllerStack:self.parentController.navigationController.viewControllers];
    tableViewController.modalPresentationStyle = UIModalPresentationPopover;
    [self.parentController presentViewController:tableViewController animated:YES completion:nil];
    tableViewController.parentNavigationController = self.parentController.navigationController;
    tableViewController.popoverPresentationController.sourceRect = self.customView.frame;
    tableViewController.popoverPresentationController.sourceView = self.customView;
}

@end
