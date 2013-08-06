//
//  ViewController.m
//  AutoAnimations
//
//  Created by Brandon King on 8/5/13.
//  Copyright (c) 2013 King's Cocoa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView *viewToAnimate;
@property (nonatomic, assign) BOOL containerIsOpen;
@end


@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.containerIsOpen = NO;
}

#pragma mark - Interface Actions

- (IBAction)moveButtonTouched
{
    if (self.containerIsOpen) {
        [self replaceTopConstraintOnView:self.viewToAnimate withConstant:-220.0];
    } else {
        [self replaceTopConstraintOnView:self.viewToAnimate withConstant:0.0];
    }
    
    [self animateConstraints];
    self.containerIsOpen = !self.containerIsOpen;
}

#pragma mark - Helper Methods

- (void)replaceTopConstraintOnView:(UIView *)view withConstant:(float)constant
{
    [self.view.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if ((constraint.firstItem == view) && (constraint.firstAttribute == NSLayoutAttributeTop)) {
            constraint.constant = constant;
        }
    }];
}

- (void)animateConstraints
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
