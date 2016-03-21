//
//  ViewController.m
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void) viewDidAppear:(BOOL)animated{
    if(self.user!=nil){
        self.name.text = self.user.alias;
        self.sessionId.text = self.user.sessionId;
        [[[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.user.avatar]]
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                            if(error) return;
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                self.image.image = [UIImage imageWithData:data];
                                            });
                                        }] resume];

    }
    else {
        LoginViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"login_view"];
        loginController.parentController = self;
        [self presentViewController:loginController animated:YES completion:nil];
    }
}


@end
