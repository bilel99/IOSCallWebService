//
//  detail_user.m
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import "detail_user.h"

@interface detail_user ()


@end

@implementation detail_user
@synthesize dictionnaire;

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
    
    
    scroll.frame = CGRectMake(0, 0, 320, 480);
    scroll.contentSize = CGSizeMake(320, 2080);
    
    
    
    
    // Affichage des donnée en bdd sur les UILabel
    NSLog(@"%@", dictionnaire);
    
    
    id_user.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"id"]];
    nom.text = [dictionnaire objectForKey:@"nom"];
    prenom.text = [dictionnaire objectForKey:@"prenom"];
    mail.text = [dictionnaire objectForKey:@"mail"];
    moyen_post.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"moyen_post"]];
    moyen_graphist_post.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"moyen_graphist_post"]];
    moyen_gameplay_post.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"moyen_gameplay_post"]];
    moyen_timelife_post.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"moyen_timelife_post"]];
    num_note.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"num_note"]];
    update.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"update"]];
    
    
    
    
    root = [[NSMutableArray alloc]init];
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com"];
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
    
    //////////////////
    
    
    
    /////////////////
    
}








- (IBAction)supprimer:(id)sender {
    
    // suppression d'un utilisateurs
    // Récupération de l'id
    //NSString *id_user = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"id"]];
    
    
    // récupération du password TextField
    NSString *password = [NSString stringWithFormat:@"%@", password_user.text];
    
    // récupération des différent champs au format String
    NSString *body = [NSString stringWithFormat:@"method=users&password=%@", password];
    NSLog(@"=====================================================>%@", password);
    NSLog(@"====body ====> %@", body);
    
    // Conversion des donnée au format dataEncoding
    NSData *data   = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    
    // Création de l'url afin de posté les datas
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/"];
    
    NSMutableURLRequest *requete = [[NSMutableURLRequest alloc]initWithURL:url];
    [requete setHTTPMethod:@"DELETE"];
    [requete setHTTPBody:data];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requete delegate:self];
    if(connection){
        donnee = [[NSMutableData alloc]init];
    }
    
    
    
    /*
     ** Fin suppression d'un utilisateurs
     */
    

    
}


- (IBAction)modifier:(id)sender {
    
}







-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [root count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
