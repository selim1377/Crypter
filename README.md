Crypter
=======

Reversable, custom key  string encryption

Crypter accepts keys no longer than 32 digits.

You can crypt strings with method:

-(NSString *)decryptCString:(char *)textToDecrypt withKey:(NSString *)key

by converting your NSString to char array.  (You can do it with NSString methods [NSString UTF8String])

All contributes are welcome.
