//
//  detail_user.h
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detail_user : UIViewController <NSURLConnectionDataDelegate, UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    
    __weak IBOutlet UIScrollView *scroll;
    
    
    __weak IBOutlet UILabel *id_user;
    __weak IBOutlet UILabel *nom;
    __weak IBOutlet UILabel *prenom;
    __weak IBOutlet UILabel *mail;
    __weak IBOutlet UILabel *moyen_post;
    __weak IBOutlet UILabel *moyen_graphist_post;
    __weak IBOutlet UILabel *moyen_gameplay_post;
    __weak IBOutlet UILabel *moyen_timelife_post;
    __weak IBOutlet UILabel *num_note;
    __weak IBOutlet UILabel *update;
    
    
    __weak IBOutlet UITextField *password_user;
    

}

@property (strong, nonatomic) NSDictionary *dictionnaire;

@end
