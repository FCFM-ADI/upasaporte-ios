//
//  ViewController.h
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface ViewController : UIViewController
@property (strong) User *user;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sessionId;


@end

