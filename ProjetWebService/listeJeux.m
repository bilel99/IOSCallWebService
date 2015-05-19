//
//  listeJeux.m
//  ProjetWebService
//
//  Created by Bilel on 05/02/2015.
//  Copyright (c) 2015 Bilel. All rights reserved.
//

#import "listeJeux.h"
#import "detail_jeux.h"

@interface listeJeux ()

@end

@implementation listeJeux

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
    
    
    
    // Connection vers l'adresse ci dessous
    root = [[NSMutableArray alloc]init];
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/?method=jeux"];
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
    
    // Recherche des donnée et stockage des donnée dans un tableau Dictionnary
    
    NSDictionary *allJSON = [NSJSONSerialization JSONObjectWithData:donnee options:0 error:nil];
    NSLog(@"%@", allJSON);
    
    NSDictionary *liste = [allJSON objectForKey:@"response"];
    
    
    for (NSDictionary *film in liste) {
        NSMutableDictionary *value = [[NSMutableDictionary alloc]init];
        
        
        
        NSString *id_jeux = [film objectForKey:@"id_jeux"];
        
        NSString *nom = [film objectForKey:@"nom"];
        
        NSString *description = [film objectForKey:@"description"];
        
        NSString *genre = [film objectForKey:@"genre"];
        
        NSString *editeur = [film objectForKey:@"editeur"];
        
        NSString *support = [film objectForKey:@"support"];
        
        NSString *prix = [film objectForKey:@"prix"];

        NSString *moyenne = [film objectForKey:@"moyenne"];
        
        NSString *moyenne_graphism = [film objectForKey:@"moyenne_graphism"];
        
        NSString *moyenne_gameplay = [film objectForKey:@"moyenne_gameplay"];
        
        NSString *moyenne_timelife = [film objectForKey:@"moyenne_timelife"];
        
        NSString *multijoueur = [film objectForKey:@"multijoueur"];
        
        NSString *num_users_note = [film objectForKey:@"num_users_note"];
        
        NSString *update = [film objectForKey:@"update"];
        
        NSString *cover = [film objectForKey:@"cover"];
        
        
        
        [value setObject:id_jeux forKey:@"id_jeux"];
        
        [value setObject:nom forKey:@"nom"];
        
        [value setObject:description forKey:@"description"];
        
        [value setObject:genre forKey:@"genre"];
        
        [value setObject:editeur forKey:@"editeur"];
        
        [value setObject:support forKey:@"support"];
        
        [value setObject:prix forKey:@"prix"];
        
        [value setObject:moyenne forKey:@"moyenne"];
        
        [value setObject:moyenne_graphism forKey:@"moyenne_graphism"];
        
        [value setObject:moyenne_gameplay forKey:@"moyenne_gameplay"];
        
        [value setObject:moyenne_timelife forKey:@"moyenne_timelife"];
        
        [value setObject:multijoueur forKey:@"multijoueur"];
        
        [value setObject:num_users_note forKey:@"num_users_note"];
        
        [value setObject:update forKey:@"update"];
        
        [value setObject:cover forKey:@"cover"];
        
         
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
    
    // Affichage de certaine donnée dans la cell
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [[root objectAtIndex:indexPath.row] objectForKey:@"nom"];
    cell.detailTextLabel.text = [[root objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    return cell;
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Transfer des données d'une vue à l'autre grace au PUSH
    NSIndexPath *indexPath = [listes indexPathForSelectedRow];
    
    
    
    detail_jeux *otherView = [segue destinationViewController];
    
    [otherView setDictionnaire:[root objectAtIndex:indexPath.row]];
    
    
    
}











- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
