//
//  BreadCrumbMenuTableViewController.h
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-16.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCBreadCrumbMenuTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *viewControllerStack;
@property (nonatomic, strong) UINavigationController *parentNavigationController;

- (instancetype)initWithViewControllerStack: (NSArray *)viewControllerStack;

@end
