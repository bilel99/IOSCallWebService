//
//  addJeu.h
//  ProjetWebService
//
//  Created by Bilel on 12/02/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addJeu : UIViewController <NSURLConnectionDataDelegate> {
    
    
    __weak IBOutlet UIScrollView *sroll;
    
    
    
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    
    
    
    
    /*Text Field*/
    
    __weak IBOutlet UITextField *txCover;
    __weak IBOutlet UITextField *txNom;
    __weak IBOutlet UITextField *txEditeur;
    __weak IBOutlet UITextField *txGenre;
    __weak IBOutlet UITextField *txMulti;
    __weak IBOutlet UITextField *txPrix;
    __weak IBOutlet UITextField *txSupport;
    __weak IBOutlet UITextView *txDescription;
    
}

@end
