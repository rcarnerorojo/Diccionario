//
//  RCRDiccionarioTableViewController.m
//  DiccionarioiPad
//
//  Created by Ramón Carnero Rojo on 20/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRDiccionarioTableViewController.h"
#import "RCRDefinitionViewController.h"

@interface RCRDiccionarioTableViewController ()

@end

@implementation RCRDiccionarioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _model = [[RCRWordsModel alloc]init];
    self.title = @"Diccionary";

    NSString *wordSelected = [[NSUserDefaults standardUserDefaults] objectForKey:@"WordSelected"];
    
    if (wordSelected == nil){
        [[NSUserDefaults standardUserDefaults] setObject:@"Starship" forKey:@"WordSelected"];
        wordSelected = @"Starship";
    }
    
    //Notificar al delegado para primera palabra en DefinitionViewController
    if ([self.delegate respondsToSelector:@selector(wordsTableViewController:didWord:)]){
        //Entiende el mensaje que le mando
        [self.delegate wordsTableViewController:self didWord:wordSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [[self.model letters] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[self.model wordsAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Reuse Id
    
    static NSString *cellId = @"DiccionaryCell";
    
    //Averiguar la palabra
    NSInteger indexWord = indexPath.section;
    NSString *word = [self.model wordAtIndex:indexPath.row inLetterAtIndex:indexWord];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil){//no hay celdas de este tipo en caché
        //tengo que crear la celda a pelo
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //sincronizar modelo (personaje) -> vista (celda)
    cell.textLabel.text = word;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.model letterAtIndex:section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        //Averiguar la palabra
        NSInteger indexWord = indexPath.section;
        NSString *word = [self.model wordAtIndex:indexPath.row inLetterAtIndex:indexWord];
        [[NSUserDefaults standardUserDefaults] setObject:word forKey:@"WordSelected"];
        
        //Notificar al delegado
        if ([self.delegate respondsToSelector:@selector(wordsTableViewController:didWord:)]){
            //Entiende el mensaje que le mando
            [self.delegate wordsTableViewController:self didWord:word];
        }
//    }else{
//        [self performSegueWithIdentifier:@"showMeaning" sender:self];
//    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"showMeaning"]){
        // buscamos palabra a mostrar y su significado
        NSIndexPath *anIndexpath = [self.tableView indexPathForSelectedRow];
        
        //Averiguar la palabra
        NSInteger indexWord = anIndexpath.section;
        NSString *word = [self.model wordAtIndex:anIndexpath.row inLetterAtIndex:indexWord];

        //asignar datos al viewcontroller destino del segue
        RCRDefinitionViewController *destination = [segue destinationViewController];
        destination.wordModel = word;
    }
    
}

@end
