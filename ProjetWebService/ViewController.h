//
//  ViewController.h
//  ProjetWebService
//
//  Created by Azerty on 05/02/2015.
//  Copyright (c) 2015 Bilel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate> {
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    __weak IBOutlet UITextField *mail;
    __weak IBOutlet UITextField *password;
    
    
}

@end
