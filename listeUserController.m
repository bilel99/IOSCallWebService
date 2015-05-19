//
//  listeUserController.m
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import "listeUserController.h"
#import "detail_user.h"

@interface listeUserController ()

@end

@implementation listeUserController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Affichage de l'utilisateur avec id = 5 (un plus pas utile pour le post, le put le delete et le get,
    root = [[NSMutableArray alloc]init];
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/?method=user&id=5"];
    NSURLRequest *requete = [[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requete delegate:self];
    
    if(connection){
        donnee = [[NSMutableData alloc]init];
    }
    
    
}






/**
 *  Methode à mettre pour utilisé un certificat HTTPS (connection HTTPS)
 */


// Accepte le certificat
-(BOOL) connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
    
}



// Création du certificat pour (l'application)
-(void) connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

/**
 *  FIN CONNECTION
 */










-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [donnee setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [donnee appendData:data];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Erreur de connection");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // Stockage des donnée dans un NSDictionnary
    NSDictionary *allJSON = [NSJSONSerialization JSONObjectWithData:donnee options:0 error:nil];
    NSLog(@"%@", allJSON);
    
    NSDictionary *liste = [allJSON objectForKey:@"response"];
    
    
    for (NSDictionary *user in liste) {
        NSMutableDictionary *value = [[NSMutableDictionary alloc]init];
        
        
        
        NSString *id_user = [user objectForKey:@"id"];
        NSString *nom = [user objectForKey:@"nom"];
        NSString *prenom = [user objectForKey:@"prenom"];
        NSString *mail = [user objectForKey:@"mail"];
        NSString *moyenne_post = [user objectForKey:@"moyenne_post"];
        NSString *moyenne_graphism_post = [user objectForKey:@"moyenne_graphism_post"];
        NSString *moyenne_gameplay_post = [user objectForKey:@"moyenne_gameplay_post"];
        NSString *moyenne_timelife_post = [user objectForKey:@"moyenne_timelife_post"];
        NSString *num_note = [user objectForKey:@"num_note"];
        NSString *update = [user objectForKey:@"update"];
        
        
        
        [value setObject:id_user forKey:@"id"];
        [value setObject:nom forKey:@"nom"];
        [value setObject:prenom forKey:@"prenom"];
        [value setObject:mail forKey:@"mail"];
        [value setObject:moyenne_post forKey:@"moyenne_post"];
        [value setObject:moyenne_graphism_post forKey:@"moyenne_graphism_post"];
        [value setObject:moyenne_gameplay_post forKey:@"moyenne_gameplay_post"];
        [value setObject:moyenne_timelife_post forKey:@"moyenne_timelife_post"];
        [value setObject:num_note forKey:@"num_note"];
        [value setObject:update forKey:@"update"];
        
        [root addObject:value];
    }
    
    NSLog(@"%@", root);
    
    [listes reloadData];
    
    
    
}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [root count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Affichage des donnée nom et update dans la cell
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [[root objectAtIndex:indexPath.row] objectForKey:@"nom"];
    cell.detailTextLabel.text = [[root objectAtIndex:indexPath.row] objectForKey:@"update"];
    
    return cell;
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Envoie des données dans une vue, envoie du NSDictionnary dans la vue detail_user
    NSIndexPath *indexPath = [listes indexPathForSelectedRow];
    
    
    
    detail_user *otherView = [segue destinationViewController];
    [otherView setDictionnaire:[root objectAtIndex:indexPath.row]];
    
}










- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
