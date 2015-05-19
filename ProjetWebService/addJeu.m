//
//  addJeu.m
//  ProjetWebService
//
//  Created by Bilel on 12/02/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import "addJeu.h"

@interface addJeu ()

@end

@implementation addJeu

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
    
    
    
    sroll.frame = CGRectMake(0, 0, 320, 480);
    sroll.contentSize = CGSizeMake(320, 2080);
    
    
    
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




/**
 ** Fermeture du clavier, en appuayant sur une touche ou en fermant le clavier manuellement.
 **/

/*
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [txNom resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [txNom resignFirstResponder];
    
}
*/






- (IBAction)valider:(id)sender {
    
    
    
    // Enregistement du jeux video en bdd a partir des champs rentré, attention aucune vérif cotés client
    //, obligatoire cover et nom doivent être différent attention la description doit comporter un certain nombre de mot et les champs genre support prix editeur sont des id clée étrangere tester avec le nbr=5,
    // le cover et une image et le multi est un booleen 0 aucun multi et 1 multi
    
    
    NSString *editeur = [NSString stringWithFormat:@"%@", txEditeur.text];
    NSString *genre = [NSString stringWithFormat:@"%@", txGenre.text];
    NSString *support = [NSString stringWithFormat:@"%@", txSupport.text];
    NSString *nom = [NSString stringWithFormat:@"%@", txNom.text];
    NSString *description = [NSString stringWithFormat:@"%@", txDescription.text];
    NSString *multi = [NSString stringWithFormat:@"%@", txMulti.text];
    NSString *cover = [NSString stringWithFormat:@"%@", txCover.text];
    NSString *prix = [NSString stringWithFormat:@"%@", txPrix.text];
    
    
    // récupération des différent champs au format String
    NSString *body = [NSString stringWithFormat:@"method=jeux&id_editeurs=%@&id_genres=%@&id_supports=%@&nom=%@&description=%@&multijoueur=%@&cover=%@&prix=%@", editeur, genre, support, nom, description, multi, cover, prix];
    
    
    // Conversion des donnée au format dataEncoding
    NSData *data   = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    
    // Création de l'url afin de posté les datas
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/"];
    
    NSMutableURLRequest *requete = [[NSMutableURLRequest alloc]initWithURL:url];
    [requete setHTTPMethod:@"POST"];
    [requete setHTTPBody:data];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requete delegate:self];
    if(connection){
        donnee = [[NSMutableData alloc]init];
    }
    
    
    
    /*
     ** Fin Ajout d'un jeu-video
     */
    
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
