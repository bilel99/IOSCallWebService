//
//  ViewController.m
//  ProjetWebService
//
//  Created by Azerty on 05/02/2015.
//  Copyright (c) 2015 Bilel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    ////////////////// log du JSON de la variable root
    
    NSDictionary *allJSON = [NSJSONSerialization JSONObjectWithData:donnee options:0 error:nil];
    NSLog(@"%@", allJSON);
    
    NSLog(@"%@", root);
    
    /////////////////
    
}




- (IBAction)connection_user:(id)sender {
    
    // Connection user (Authentification)
    NSString *mailuser = [NSString stringWithFormat:@"%@", mail.text];
    NSString *passworduser = [NSString stringWithFormat:@"%@", password.text];
    
    NSString *url1 = [NSString  stringWithFormat: @"https://api.gamenote.com/?method=login&mail=%@&password=%@", mailuser, passworduser];
    NSLog(@"=======auth===============>%@", url1);
    
    NSURLRequest *requete1 = [NSURLRequest requestWithURL: [NSURL URLWithString:url1]];
    NSURLConnection *connection1 = [NSURLConnection connectionWithRequest:requete1 delegate:self];
    if(connection1){
        donnee = [[NSMutableData alloc]init];
    }
    
    
    
    /*
     ** Fin connection user
     */

    
    
}














- (IBAction)listeJeux:(id)sender {
    
}




- (IBAction)postJeux:(id)sender {
    
}











- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
