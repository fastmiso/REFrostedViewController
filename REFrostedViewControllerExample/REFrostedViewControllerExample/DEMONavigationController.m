//
//  DEMONavigationController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMONavigationController.h"
#import "DEMOMenuViewController.h"

@interface DEMONavigationController ()

@property (strong, readwrite, nonatomic) DEMOMenuViewController *leftMenuViewController;

@property (strong, readwrite, nonatomic) DEMOMenuViewController *rightMenuViewController;

@end

@implementation DEMONavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.leftMenuViewController = [[DEMOMenuViewController alloc] init];
    self.leftMenuViewController.navigationController = self;
	self.leftMenuViewController.edgeType = REFrostedViewConrollerEdgeSourceTypeLeft;
	UIPanGestureRecognizer *leftGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftGestureRecognized:)];
    [self.view addGestureRecognizer:leftGesture];

    self.rightMenuViewController = [[DEMOMenuViewController alloc] init];
    self.rightMenuViewController.navigationController = self;
	self.rightMenuViewController.edgeType = REFrostedViewConrollerEdgeSourceTypeRight;
	UIScreenEdgePanGestureRecognizer *rightGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(rightGestureRecognized:)];
	rightGesture.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:rightGesture];
}

- (void)showMenu
{
    [self.leftMenuViewController presentFromViewController:self animated:YES completion:nil];
}

#pragma mark -
#pragma mark Rotation handling

- (BOOL)shouldAutorotate
{
    return self.leftMenuViewController.hidden && self.rightMenuViewController.hidden;
}

#pragma mark -
#pragma mark Gesture recognizers

- (void)leftGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.leftMenuViewController presentFromViewController:self panGestureRecognizer:sender];
}

- (void)rightGestureRecognized:(UIScreenEdgePanGestureRecognizer *)sender
{
    [self.rightMenuViewController presentFromViewController:self panGestureRecognizer:sender];
}

@end
