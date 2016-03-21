//
//  LoginViewController.m
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

static NSString *URL_PASAPORTE = @"https://www.u-cursos.cl/upasaporte/login?servicio=";
static NSString *SERVICE_NAME = @"";
static NSString *URL_REDIRECT = @"";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self showUPasaporte];
}
- (void) showUPasaporte{
    [self.webview loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URL_PASAPORTE, SERVICE_NAME]]]];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"Loading: %@", request.URL.absoluteString);
    if([request.URL.absoluteString hasPrefix:URL_REDIRECT]){
        User *user = [[User alloc] init];
        NSString *query = request.URL.query;
        NSArray *entries = [query componentsSeparatedByString:@"&"];
        for (NSString *entry in entries) {
            NSArray *e = [entry componentsSeparatedByString:@"="];
            if ([e[0] isEqualToString:@"alias"])            user.alias  = [e[1] stringByReplacingPercentEscapesUsingEncoding:NSISOLatin1StringEncoding];
            if ([e[0] isEqualToString:@"img"])              user.avatar = [e[1] stringByReplacingPercentEscapesUsingEncoding:NSISOLatin1StringEncoding];
            if ([e[0] isEqualToString:@"PHPSESSID"])        user.sessionId = [e[1] stringByReplacingPercentEscapesUsingEncoding:NSISOLatin1StringEncoding];
        }
        if([user isValid]){
            self.parentController.user = user;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            [self showUPasaporte];
        }
        return NO;
    }
    return YES;
}
@end
