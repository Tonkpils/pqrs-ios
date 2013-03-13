//
//  UBLViewController.h
//  pqrs
//
//  Created by Jason Clary on 3/12/13.
//  Copyright (c) 2013 Jason Clary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@interface UBLViewController : UIViewController

@property (nonatomic, strong) REMenu *menu;
-(void)shouldPresentMenuView:(id)sender;
@end
