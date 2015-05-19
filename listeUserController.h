//
//  listeUserController.h
//  ProjetWebService
//
//  Created by Bilel on 05/03/2015.
//  Copyright (c) 2015 Azerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listeUserController : UIViewController<NSURLConnectionDataDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *root;
    NSMutableData *donnee;
    
    
    __weak IBOutlet UITableView *listes;
    
}




@end
