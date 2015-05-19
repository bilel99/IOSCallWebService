//
//  detail_jeux.m
//  ProjetWebService
//
//  Created by Bilel on 06/02/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import "detail_jeux.h"

@interface detail_jeux ()

@end

@implementation detail_jeux
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
    
    
    
    
    
    NSLog(@"%@", dictionnaire);
    
    
    /*
     * Récupération d'une image JSON, Attention ici l'émulateur n'affichera pas l'image, par contre le téléphone (oui) a cause du ScrollView !!!!!!!!!! TESTER sur un Iphone 5S en entreprise
     */
    
     NSString *img = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"cover"]];
    
    
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"https://api.gamenote.com/data/images/%@", img]];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *images = [UIImage imageWithData:data];
    
    lb_img.image = images;
    
    /*
     * Fin récupération Image
     */
    
    
    
    // récupération des donnée du tableau Dictionnary et affichage sur des UILabel
    lb_nom.text = [dictionnaire objectForKey:@"nom"];
    lb_editeur.text = [dictionnaire objectForKey:@"editeur"];
    lb_genre.text = [dictionnaire objectForKey:@"genre"];
    lb_multijoueur.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"multijoueur"]];
    lb_prix.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"prix"]];
    lb_support.text = [dictionnaire objectForKey:@"support"];
    lb_update.text = [NSString stringWithFormat:@"%@", [dictionnaire objectForKey:@"update"]];
    description.text = [dictionnaire objectForKey:@"description"];
    
    
    
    
    
    /**
            ICI deux fois method url faire une fonction asynchrone pour utiliser ses deux method ! dans la même vue (NSURL)
    
    root = [[NSMutableArray alloc]init];
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/"];
    NSURLRequest *requete = [[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requete delegate:self];
    
    if(connection){
        donnee = [[NSMutableData alloc]init];
    }
     **/
    
    
    
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
    
    // en construction
}



- (IBAction)modifier:(id)sender {
    
    // en construction
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
