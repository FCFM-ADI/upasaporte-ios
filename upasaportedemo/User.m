//
//  User.m
//  upasaportedemo
//
//  Created by Alfredo Cádiz on 3/21/16.
//  Copyright © 2016 ADI -FCFM -UChile. All rights reserved.
//

#import "User.h"

@implementation User
- (BOOL) isValid{
    return self.alias!=nil && self.avatar!=nil;
}
@end
