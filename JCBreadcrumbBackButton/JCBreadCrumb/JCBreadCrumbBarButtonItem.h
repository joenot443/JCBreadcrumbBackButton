//
//  BreadCrumbBarButtonItem.h
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-18.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCBreadCrumbBarButtonItem : UIBarButtonItem

@property (nonatomic, weak) UIViewController *parentController;

- (instancetype)initBreadCrumbBarButtonItem;

@end
