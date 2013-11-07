//
//  NSString+Crypter.m
//  Pods
//
//  Created by Selim Bakdemir on 07.11.13.
//
//

#import "NSString+Crypter.h"
#import "Crypter.h"

@implementation NSString (Crypter)

-(NSString *)crypt:(NSString *)key
{
    Crypter *crypter = [Crypter sharedInstance];
    const char *chars      = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSString *crypted = [crypter decryptCString:chars withKey:key];
    return crypted;
}

@end
