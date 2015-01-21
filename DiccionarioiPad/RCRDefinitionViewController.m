//
//  RCRDefinitionViewController.m
//  DiccionarioiPad
//
//  Created by Ramón Carnero Rojo on 20/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRDefinitionViewController.h"

@interface RCRDefinitionViewController ()

@end

@implementation RCRDefinitionViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Asignamos delegado
    self.browser.delegate = self;
    
    //sincronizar la vista
    [self syncViewWithModel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id) initWithModel:(NSString *) aModel{
 
    if (self = [super initWithNibName:nil bundle:nil]){
        
        _wordModel = aModel;
    }
    
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - RCRWordsTableViewControllerDelegate

-(void) wordsTableViewController:(RCRDiccionarioTableViewController *)wVC didWord:(NSString *)word{
    
    self.wordModel = word;
    [self syncViewWithModel];
    self.title = word;
    
    //    [self syncWithModel];
    //sincronizar la vista
    //[self.browser loadRequest:[self definitionRequestForWord:self.wordModel]];
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    //decirle al activityView que pare. Se ocultará sólo por haber marcado la opción
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}

#pragma mark - SplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden){
        
        //Hay que poner el botón en mi barra de navegación
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
        
    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        //Hay que quitar el botón de la barra de navegación
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark - Utils

-(void) syncViewWithModel{
    
    //Mostrar el activiy
    self.activityIndicator.hidden = NO;
    
    //Empezar la animación
    [self.activityIndicator startAnimating];
    
    //Cargar la url
    NSURLRequest *r = [self definitionRequestForWord:self.wordModel];
    [self.browser loadRequest:r];
}

-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord{
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}

@end
