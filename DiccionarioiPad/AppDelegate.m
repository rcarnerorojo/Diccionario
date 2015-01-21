//
//  AppDelegate.m
//  DiccionarioiPad
//
//  Created by Ramón Carnero Rojo on 20/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AppDelegate.h"
#import "RCRDiccionarioTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        
    //Compruebo el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        //tableta
        [self configureForPad];
    }else{
        [self configureForPhone];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"iPad"
//                                                                 bundle: nil];
//        UISplitViewController *split =[mainStoryboard instantiateInitialViewController];
//        
//        // Set root view controller and make windows visible
//        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//        [_window setRootViewController:split];
//        [self.window makeKeyAndVisible];
//        
//    }else{
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"iPhone"
//                                                                 bundle: nil];
//        UINavigationController *nav = [mainStoryboard instantiateInitialViewController];
//        
//        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//        
//        [_window setRootViewController:nav];
//        [self.window makeKeyAndVisible];
//    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Configuration

-(void) configureForPad{
    
    /*
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"iPad"
                                                             bundle: nil];
    UISplitViewController *split =[mainStoryboard instantiateInitialViewController];
    
    // Set root view controller and make windows visible
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window setRootViewController:split];
    [self.window makeKeyAndVisible];
    */
    
    
    //Conseguimos el punto de inicio a la aplicación
    UISplitViewController *split = (UISplitViewController*)self.window.rootViewController;
    //Conseguimos el navegador secundario del split
    UINavigationController * navVC = [split.viewControllers lastObject];
    //Asignamos de delegado al DefinitionViewController
    split.delegate = (id)[navVC topViewController];
    
    
    UINavigationController * nVC = [split.viewControllers firstObject];
    RCRDiccionarioTableViewController *dTVC = (RCRDiccionarioTableViewController*)[nVC topViewController];
    dTVC.delegate = (id)[navVC topViewController];
}


-(void) configureForPhone{
    
    /*UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"iPhone"
                                                             bundle: nil];
    UINavigationController *nav = [mainStoryboard instantiateInitialViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [_window setRootViewController:nav];
    [self.window makeKeyAndVisible];*/
    
    /*
    //Conseguimos el punto de inicio a la aplicación
    UINavigationController *nVC = (UINavigationController*)self.window.rootViewController;
    //Conseguimos el tableView
    RCRDiccionarioTableViewController *tVC = [nVC.viewControllers lastObject];
    //Asignamos de delegado a nosotros mismos
    tVC.delegate = (id)tVC;*/
}

@end
