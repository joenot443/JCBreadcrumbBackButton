//
//  BreadCrumbMenuTableViewController.m
//  Breadcrumb Back Button
//
//  Created by Joe on 2016-08-16.
//  Copyright © 2016 Joe Crozier. All rights reserved.
//

#import "JCBreadCrumbMenuTableViewController.h"

@interface JCBreadCrumbMenuTableViewController ()

@end

@implementation JCBreadCrumbMenuTableViewController

static NSString * const breadCrumbReuseIdentifier = @"BreadCrumbReuse";
static const CGFloat CellHeight     = 50.0f;
static const CGFloat CellXPadding   = 32.0f;
static const CGFloat FontSize       = 16.0f;

- (instancetype)initWithViewControllerStack: (NSArray *)viewControllerStack {
    self = [super init];
    if (self) {
        NSMutableArray *mutableStack = [[[viewControllerStack reverseObjectEnumerator] allObjects] mutableCopy];
        [mutableStack removeObjectAtIndex:0];
        self.viewControllerStack = [mutableStack copy];
        
        //Set the width to be the max width of the view controller labels
        CGFloat maxWidth = 0;
        for (UIViewController *viewController in self.viewControllerStack) {
            maxWidth = MAX([viewController.title sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:FontSize]}].width, maxWidth);
        }
        
        CGFloat maxHeight = CellHeight * (self.viewControllerStack.count);
        //Set the max height to be either half the height of the screen, or the total height of the cells
        if (maxHeight > [[[UIApplication sharedApplication] delegate] window].frame.size.height / 2.0f) {
            maxHeight = [[[UIApplication sharedApplication] delegate] window].frame.size.height / 2.0f;
            self.tableView.scrollEnabled = YES;
        }
        self.preferredContentSize = CGSizeMake(maxWidth + CellXPadding, maxHeight);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllerStack.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:breadCrumbReuseIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    UIViewController *stackItemViewController = self.viewControllerStack[indexPath.row];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setText:stackItemViewController.title];
    [cell.textLabel setFont:[UIFont systemFontOfSize:FontSize]];
    [cell.textLabel setTextColor:[UIColor grayColor]];
    return cell;
    
}

#pragma mark - Table view   delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.parentNavigationController popToViewController:self.viewControllerStack[indexPath.row] animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
