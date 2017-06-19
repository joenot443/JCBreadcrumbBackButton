//
//  BreadCrumbBarButtonItem.m
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-18.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import "JCBreadCrumbBarButtonItem.h"
#import "JCBreadCrumbMenuTableViewController.h"

@interface JCBreadCrumbBarButtonItem()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation JCBreadCrumbBarButtonItem

- (instancetype)initBreadCrumbBarButtonItem {
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[[UIImage imageNamed:@"BackButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.backButton setTitle:@"  Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:self.backButton.tintColor forState:UIControlStateNormal];
    [self.backButton setFrame:CGRectMake(0, 0, 110, 25)];
    UILongPressGestureRecognizer *breadCrumbRecognizerLongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(buttonLongPress:)];
    breadCrumbRecognizerLongPress.minimumPressDuration = 0.5;
    UITapGestureRecognizer *breadCrumbRecognizerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    [self.backButton addGestureRecognizer:breadCrumbRecognizerLongPress];
    [self.backButton addGestureRecognizer:breadCrumbRecognizerTap];
    
    self = [super initWithCustomView:self.backButton];
    return self;
}

- (void)buttonLongPress: (UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self showBreadCrumbMenu];
    }
}

- (void)buttonTapped: (UIGestureRecognizer *)sender {
    [self.parentController.navigationController popViewControllerAnimated:YES];
}

- (void)showBreadCrumbMenu {
    JCBreadCrumbMenuTableViewController *tableViewController = [[JCBreadCrumbMenuTableViewController alloc] initWithViewControllerStack:self.parentController.navigationController.viewControllers];
    tableViewController.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *presentationController = [tableViewController popoverPresentationController];
    presentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    presentationController.sourceView = self.customView;
    presentationController.sourceRect = self.customView.frame;
    [presentationController setDelegate:(UIViewController <UIPopoverPresentationControllerDelegate> *)self.parentController.navigationController];
    tableViewController.parentNavigationController = self.parentController.navigationController;
    [self.parentController presentViewController:tableViewController animated:YES completion:nil];
    
}

@end
