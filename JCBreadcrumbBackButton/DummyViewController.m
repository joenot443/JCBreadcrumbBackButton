//
//  DummyViewController.m
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-16.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import "DummyViewController.h"
#import "BreadCrumbBarButtonItem.h"

@interface DummyViewController ()

@end

@implementation DummyViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *colourNames = @[@"Red", @"Blue", @"Green", @"Yellow", @"Black", @"White"];
        NSArray *animalNames = @[@"Elephant", @"Tiger", @"Cat", @"Dog", @"Lemur", @"Monkey"];
        self.title = [[colourNames objectAtIndex:arc4random()%colourNames.count] stringByAppendingString:[animalNames objectAtIndex:arc4random()%animalNames.count]];
    }
    return self;
}

- (void)viewDidLoad {
    BreadCrumbBarButtonItem *breadCrumBarButton = [[BreadCrumbBarButtonItem alloc] initBreadCrumbBarButtonItem];
    breadCrumBarButton.parentController = self;
    self.navigationItem.leftBarButtonItems = @[breadCrumBarButton];
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *generateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [generateButton setTitle:@"Give us another!" forState:UIControlStateNormal];
    generateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [generateButton addTarget:self action:@selector(generateDummyViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:generateButton];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:@"I'm a dummy view controller!"];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];
    
    NSLayoutConstraint *centerXButtonConstraint = [NSLayoutConstraint constraintWithItem:generateButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *centerYButtonConstraint = [NSLayoutConstraint constraintWithItem:generateButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *centerXTitleConstraint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *centerYTitleConstraint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-30.0f];
    [self.view addConstraints:@[centerXButtonConstraint, centerYButtonConstraint, centerXTitleConstraint, centerYTitleConstraint]];
    
    [super viewDidLoad];
}


- (void)generateDummyViewController {
    DummyViewController *newDummy = [[DummyViewController alloc] init];
    [self.navigationController pushViewController:newDummy animated:YES];
}


@end
