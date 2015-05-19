//
//  modification_user.h
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface modification_user : UIViewController <NSURLConnectionDataDelegate> {
    
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    __weak IBOutlet UIScrollView *scroll;
    
    __weak IBOutlet UITextField *txtNom;
    __weak IBOutlet UITextField *txtPrenom;
    __weak IBOutlet UITextField *txtMail;
    __weak IBOutlet UITextField *txtPassword;
    __weak IBOutlet UITextField *txtOption;
    __weak IBOutlet UITextField *oldPassword;
    
    
    
}

@end
