//
//  User.h
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong) NSString *alias;
@property (strong) NSString *avatar;
@property (strong) NSString *sessionId;
- (BOOL) isValid;
@end
