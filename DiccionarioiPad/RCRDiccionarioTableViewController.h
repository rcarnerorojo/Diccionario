//
//  RCRDiccionarioTableViewController.h
//  DiccionarioiPad
//
//  Created by Ramón Carnero Rojo on 20/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRWordsModel.h"

@class RCRDiccionarioTableViewController;

@protocol RCRDiccionarioTableViewControllerDelegate <NSObject>

@optional

-(void)wordsTableViewController:(RCRDiccionarioTableViewController*)wVC
                        didWord:(NSString*) word;

@end

@interface RCRDiccionarioTableViewController : UITableViewController

@property (weak,nonatomic) id <RCRDiccionarioTableViewControllerDelegate> delegate;
@property (strong, nonatomic) RCRWordsModel* model;

@end
