//
//  detail_jeux.h
//  ProjetWebService
//
//  Created by Bilel on 06/02/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detail_jeux : UIViewController <NSURLConnectionDataDelegate, UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    __weak IBOutlet UIScrollView *scroll;
    
    
    
    __weak IBOutlet UIImageView *lb_img;
    __weak IBOutlet UILabel *lb_nom;
    __weak IBOutlet UILabel *lb_editeur;
    __weak IBOutlet UILabel *lb_genre;
    __weak IBOutlet UILabel *lb_multijoueur;
    __weak IBOutlet UILabel *lb_prix;
    __weak IBOutlet UILabel *lb_support;
    __weak IBOutlet UILabel *lb_update;
    __weak IBOutlet UITextView *description;
    __weak IBOutlet UILabel *id_jeux;
    
    
}

@property (strong, nonatomic) NSDictionary *dictionnaire;

@end
