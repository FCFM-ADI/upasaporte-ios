//
//  LoginViewController.h
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface LoginViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (strong) ViewController *parentController;
@end
