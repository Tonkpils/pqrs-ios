//
//  UBLViewController.m
//  pqrs
//
//  Created by Jason Clary on 3/12/13.
//  Copyright (c) 2013 Jason Clary. All rights reserved.
//

#import "UBLViewController.h"
#import "UBLScanViewController.h"

@implementation UBLViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(shouldPresentMenuView)];
    [self.navigationItem setLeftBarButtonItem:settingsButton];
}

-(void)shouldPresentMenuView:(id)sender{
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
                                                          [self popToViewControllerWithStoryboardIdentifier:@"scanViewNavController"];
                                                      }];

    REMenuItem *createItem = [[REMenuItem alloc] initWithTitle:@"Create"
                                                      subtitle:@"Create a new PQR"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [self popToViewControllerWithStoryboardIdentifier:@"createViewNavController"];
                                                        }];

    REMenuItem *historyItem = [[REMenuItem alloc] initWithTitle:@"History"
                                                       subtitle:@"See what QR's you've created and scanned"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             [self popToViewControllerWithStoryboardIdentifier:@"historyViewNavController"];
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

    [self.menu showFromNavigationController:self.navigationController];
}

-(void)popToViewControllerWithStoryboardIdentifier:(NSString *)identifier{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    [self.navigationController popToRootViewControllerAnimated:NO];
    id vc = [storyBoard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController popToViewController:vc animated:YES];
}

@end
