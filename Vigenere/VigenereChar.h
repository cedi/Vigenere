#import <Foundation/Foundation.h>

@interface VigenereChar : NSObject

- (id) initWithChars: (NSString*) plain : (NSString*) key;
- (NSString*) calculate;

@end
