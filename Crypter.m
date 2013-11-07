//
//  Crypter.m
//  GELDAUTOMATEN
//
//  Created by Benutzer1 on 07.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Crypter.h"


@implementation Crypter

static Crypter * crypter = nil;


+(Crypter *) sharedInstance
{
	if (!crypter) {
		crypter = [[Crypter alloc] init];
	}
	
	return crypter;
}

-(id)init
{
	if ((self = [super init])) {
		
	}
    return self;
}

-(NSString *)decryptCString:(char *)textToDecrypt withKey:(NSString *)key
{
	
	
	// check if the key is empty
	if ([key isEqualToString:@""]) {
		return @"Key can not be empty";
	}
	
	//Remove spaces
	key = [key stringByReplacingOccurrencesOfString:@" "
										 withString:@""];
	// Check key length
	if ([key length]<8) {
		return @"Key length can not be less than 8";
	}
	
	
	// fix key length to 32
	int key_len = [key length];
	if (key_len > 32) {
		key_len = 32;
	}
	
	// create a key array
	NSMutableArray *k = [[NSMutableArray alloc] initWithCapacity:key_len];	
	
	const char* keyChars =  [key UTF8String];
    
	// fill key array with  bitwiseAND of ith key char and 0x1F
	for (int i =0; i<key_len; i++) {
		int produced = keyChars[i];
		int bitwiseAnded = produced & 0x1F;		
		[k addObject: [NSNumber numberWithInt:bitwiseAnded]];
		
	}
	
	//perform encryption decryption
	char* textToDecryptChars = textToDecrypt;
	
	for (int i=0, j=0; i<strlen(textToDecryptChars); ++i) {
		
		int e = textToDecryptChars[i];
		
		if (e < 0) {
			e += 256;
		}
		
		int bitwiseAND = e & 0xE0;
		
		int kchr = [[k objectAtIndex:j] intValue];
		
		
		if (bitwiseAND) {
			textToDecryptChars[i] = e ^ kchr;
			
		}
		
		j = (j+1) % key_len;
	}
	
	
	NSString *returnString = @"";
	[k release];
	
	returnString = [NSString stringWithCString:textToDecryptChars encoding:NSUTF8StringEncoding];
	return returnString;
}
@end
