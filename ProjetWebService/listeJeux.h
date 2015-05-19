//
//  listeJeux.h
//  ProjetWebService
//
//  Created by Azerty on 05/02/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listeJeux : UIViewController <NSURLConnectionDataDelegate, UITableViewDataSource, UITableViewDelegate>{
    
    NSMutableArray *root;
    NSMutableData *donnee;
    
    
    
    __weak IBOutlet UITableView *listes;
    
}

@end
