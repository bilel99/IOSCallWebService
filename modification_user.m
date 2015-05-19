//
//  modification_user.m
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import "modification_user.h"

@interface modification_user ()

@end

@implementation modification_user

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
    // Permet d'avoir un scroll sur la vue
    
    scroll.frame = CGRectMake(0, 0, 320, 480);
    scroll.contentSize = CGSizeMake(320, 2080);
    
  
    
    
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


- (IBAction)modifier_user:(id)sender {
    
    /**
     ** Method de modification de l'utilisateur, envoie des champs et appel du web service PUT enfin connection et validation
     **/
    
     NSString *nom = [NSString stringWithFormat:@"%@", txtNom.text];
     NSString *prenom = [NSString stringWithFormat:@"%@", txtPrenom.text];
     NSString *mail = [NSString stringWithFormat:@"%@", txtMail.text];
     NSString *password = [NSString stringWithFormat:@"%@", txtPassword.text];
     NSString *option = [NSString stringWithFormat:@"%@", txtOption.text];
     NSString *oldPass = [NSString stringWithFormat:@"%@", oldPassword.text];
    
    
    // récupération des différent champs au format String
    NSString *body = [NSString stringWithFormat:@"method=users&nom=%@&prenom=%@&mail=%@&password=%@&option=%@&oldpassword=%@", nom, prenom, mail, password, option, oldPass];
    NSLog(@"========================>%@", body);
    
    
    // Conversion des donnée au format dataEncoding
    NSData *data   = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    
    // Création de l'url afin de posté les datas
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.gamenote.com/"];
    
    NSMutableURLRequest *requete = [[NSMutableURLRequest alloc]initWithURL:url];
    [requete setHTTPMethod:@"PUT"];
    [requete setHTTPBody:data];
    
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requete delegate:self];
    if(connection){
       donnee = [[NSMutableData alloc]init];
    }
    
    
    
    /*
     ** Fin modification user
     */
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
