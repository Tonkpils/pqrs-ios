//
//  UBLNavigationController.m
//  pqrs
//
//  Created by Jason Clary on 3/12/13.
//  Copyright (c) 2013 Jason Clary. All rights reserved.
//

#import "UBLNavigationController.h"
#import "REMenu.h"
#import "UBLScanViewController.h"
#import "UBLCreatePQRViewController.h"
#import "UBLHistoryViewController.h"

@interface UBLNavigationController ()

@property (nonatomic,strong) REMenu *menu;
@end

@implementation UBLNavigationController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationBar.tintColor = [UIColor colorWithRed:0.821 green:0.638 blue:1.000 alpha:1.000];
    }
    return self;
}

-(void)viewDidLoad{
    self.navigationBar.tintColor = [UIColor colorWithRed:0.821 green:0.638 blue:1.000 alpha:1.000];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(shouldPresentMenuView)];
    [self.navigationItem setLeftBarButtonItem:settingsButton];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    [super pushViewController:viewController animated:animated];
//    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings"
//                                                                      style:UIBarButtonItemStylePlain
//                                                                     target:self
//                                                                     action:@selector(shouldPresentMenuView)];
//    [viewController.navigationItem setLeftBarButtonItem: settingsButton];
}

-(void)shouldPresentMenuView:(UINavigationController *)sender{
    if (self.menu.isOpen)
        return [self.menu close];

    [self setUpMenu];
}

-(void)setUpMenu{


    // Sample icons from http://icons8.com/download-free-icons-for-ios-tab-bar
    //

    REMenuItem *scanItem = [[REMenuItem alloc] initWithTitle:@"Scan"
                                                    subtitle:@"Scan a QR Code"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [self popToViewControllerWithStoryboardIdentifier:@"scanViewController"];
                                                      }];

    REMenuItem *createItem = [[REMenuItem alloc] initWithTitle:@"Create"
                                                       subtitle:@"Create a new PQR"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             [self popToViewControllerWithStoryboardIdentifier:@"createViewController"];
                                                         }];

    REMenuItem *historyItem = [[REMenuItem alloc] initWithTitle:@"History"
                                                        subtitle:@"See what QR's you've created and scanned"
                                                           image:nil
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              [self popToViewControllerWithStoryboardIdentifier:@"historyViewController"];
                                                          }];

    scanItem.tag = 0;
    createItem.tag = 1;
    historyItem.tag = 2;

    self.menu = [[REMenu alloc] initWithItems:@[scanItem,createItem,historyItem]];
    self.menu.cornerRadius = 4;
    self.menu.shadowColor = [UIColor blackColor];
    self.menu.shadowOffset = CGSizeMake(0, 1);
    self.menu.shadowOpacity = 1;
    self.menu.imageOffset = CGSizeMake(5, -1);

    [self.menu showFromNavigationController:self];
}

-(void)popToViewControllerWithStoryboardIdentifier:(NSString *)identifier{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    [self popToRootViewControllerAnimated:NO];
    UBLScanViewController *svc = [storyBoard instantiateViewControllerWithIdentifier:identifier];
    [self popToViewController:svc animated:YES];
}

@end
