//
//  Crypter.h
//  GELDAUTOMATEN
//
//  Created by Benutzer1 on 07.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Crypter : NSObject {
}

+(Crypter *) sharedInstance;
-(NSString *)decryptCString:(char *)textToDecrypt withKey:(NSString *)key;
@end
