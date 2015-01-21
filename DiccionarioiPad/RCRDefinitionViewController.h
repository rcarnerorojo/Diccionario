//
//  RCRDefinitionViewController.h
//  DiccionarioiPad
//
//  Created by Ramón Carnero Rojo on 20/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRDiccionarioTableViewController.h"

@interface RCRDefinitionViewController : UIViewController<UISplitViewControllerDelegate, RCRDiccionarioTableViewControllerDelegate,UIWebViewDelegate>

@property (copy, nonatomic) NSString *wordModel;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
