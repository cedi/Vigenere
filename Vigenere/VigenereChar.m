#import "VigenereChar.h"

@implementation VigenereChar
{
    NSString* keyChar;
    NSString* plainChar;
}

- (id) initWithChars: (NSString*) plain : (NSString*) key
{
    // Mich erstmal erstellen
    self = [super init];
    
    // Variablen zuweisen
    self->plainChar = plain;
    self->keyChar = key;
    
    // mich zurück geben
    return self;
}

/*
 * Das verschlüssete Zeichen berechnen
 */
- (NSString*) calculate
{
    // Index holen
    const char* plain = [self->plainChar UTF8String];
    const char* key = [self->keyChar UTF8String];
    
    int plainIdx = (int) plain[0];
    int keyIdx = (int) key[0];
    
    if((char)plainIdx == ' ')
        return @"";
    
    // und -A rechnen um auf 1, 2, 3, ... zu kommen
    plainIdx -= (int)'A';
    keyIdx -= (int)'A';
    
    int calculated = plainIdx + keyIdx;
    
    if(calculated > 26)
        calculated -= 26;
    
    return [NSString stringWithFormat:@"%c", (char)(calculated + 'A' - 1)];
}

@end
