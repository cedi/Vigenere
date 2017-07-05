#import "Vigenere.h"
#import "VigenereChar.h"

@implementation Vigenere

+ (NSString*) encrypt : (NSString*) plainText : (NSString*) key
{
    plainText = [plainText uppercaseString];
    key = [key uppercaseString];
    
    NSString* longKey = key;
    
    // Den Schlüssel auf die richtige Länge bringen
    while (longKey.length < plainText.length)
        longKey = [longKey stringByAppendingString:key];
    
    // Jetzt noch den rest abscheniden und dann sind beide Strings gleich lang
    longKey = [longKey substringToIndex:plainText.length];
    
    assert(longKey.length == plainText.length); // Wieso haben die unterschiedliche längen?
    
    NSMutableString* cypperText = [[NSMutableString alloc]init];
    
    for (int nIdx = 0; nIdx < plainText.length; nIdx++)
    {
        char p = [ plainText characterAtIndex:nIdx];
        char k = [ longKey characterAtIndex:nIdx];
        
        VigenereChar* vigChar = [[VigenereChar alloc]initWithChars:[NSString stringWithFormat:@"%c", p] :[NSString stringWithFormat:@"%c", k]];
        
        NSString* cypper = [vigChar calculate];
        
        [cypperText appendString:cypper];
    }
    
    return cypperText;
}

@end
