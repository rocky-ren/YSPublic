#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (id)objectForKeyNotNull:(id)aKey {
    id object = [self objectForKey:aKey];
    if (object == [NSNull null]) {
        object = nil;
    }
    
    return object;
}

- (id)objectForKeyNotNil:(id)aKey
{
    if (self == nil) {
        return nil;
    }
    
    id object = [self objectForKey:aKey];
    
    if (object == [NSNull null]) {
        object = nil;
    }
    
    return object;
}

- (id)strForKeyNotNilNull:(id)aKey
{
    if (self == nil) {
        return @"";
    }
    
    id object = [self objectForKey:aKey];
    
    if (object == nil) {
        return @"";
    }
    
    if (object == [NSNull null]) {
        object = @"";
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    
    return [NSString stringWithFormat:@"%@", object];
}

@end
