#import <Foundation/Foundation.h>
#import "Vigenere.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString* cypperText = [Vigenere encrypt:@"Hallo Welt" : @"AAAAAAAAAA" ];
        
        NSLog(@"%@", cypperText);
        
    }
    return 0;
}
