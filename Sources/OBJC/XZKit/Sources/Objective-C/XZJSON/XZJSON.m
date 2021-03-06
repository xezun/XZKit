//
//  XZJSON.m
//  XZKit
//
//  Created by Xezun on 2021/2/14.
//

#import "XZJSON.h"

@implementation NSData (XZJSON)

+ (NSData *)xz_JSONWithObject:(id)object options:(NSJSONWritingOptions)options {
    if (object == nil) {
        return nil;
    }
    return [NSJSONSerialization dataWithJSONObject:object options:options error:nil];
}

+ (NSData *)xz_JSONWithObject:(id)object {
    return [self xz_JSONWithObject:object options:(NSJSONWritingFragmentsAllowed)];
}

@end


@implementation NSString (XZJSON)

+ (NSString *)xz_JSONWithObject:(id)object encoding:(NSStringEncoding)encoding options:(NSJSONWritingOptions)options {
    NSData *data = [NSData xz_JSONWithObject:object options:options];
    if (data == nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:encoding];
}

+ (NSString *)xz_JSONWithObject:(id)object encoding:(NSStringEncoding)encoding {
    return [self xz_JSONWithObject:object encoding:encoding options:(NSJSONWritingFragmentsAllowed)];
}

+ (NSString *)xz_JSONWithObject:(id)object options:(NSJSONWritingOptions)options {
    return [self xz_JSONWithObject:object encoding:NSUTF8StringEncoding options:options];
}

+ (NSString *)xz_JSONWithObject:(id)object {
    return [self xz_JSONWithObject:object encoding:NSUTF8StringEncoding options:(NSJSONWritingFragmentsAllowed)];
}

+ (NSString *)xz_stringWithJSON:(id)json options:(NSJSONReadingOptions)options {
    NSData *data = json;
    if ([data isKindOfClass:NSString.class]) {
        data = [(NSString *)data dataUsingEncoding:NSUTF8StringEncoding];
    } else if (![data isKindOfClass:NSData.class]) {
        return nil;
    }
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:options error:&error];
    if ([object isKindOfClass:NSString.class]) {
        return object;
    }
    return nil;
}

+ (NSString *)xz_stringWithJSON:(id)json {
    return [self xz_stringWithJSON:json options:(NSJSONReadingAllowFragments)];
}

@end


@implementation NSArray (XZJSON)

+ (NSArray *)xz_arrayWithJSON:(id)json options:(NSJSONReadingOptions)options {
    NSData *data = json;
    if ([data isKindOfClass:NSString.class]) {
        data = [(NSString *)data dataUsingEncoding:NSUTF8StringEncoding];
    } else if (![data isKindOfClass:NSData.class]) {
        return nil;
    }
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:options error:&error];
    if ([object isKindOfClass:NSArray.class]) {
        return object;
    }
    return nil;
}


+ (NSArray *)xz_arrayWithJSON:(id)json {
    return [self xz_arrayWithJSON:json options:(NSJSONReadingAllowFragments)];
}

@end


@implementation NSDictionary (XZJSON)

+ (NSDictionary *)xz_dictionaryWithJSON:(id)json options:(NSJSONReadingOptions)options {
    NSData *data = json;
    if ([data isKindOfClass:NSString.class]) {
        data = [(NSString *)data dataUsingEncoding:NSUTF8StringEncoding];
    } else if (![data isKindOfClass:NSData.class]) {
        return nil;
    }
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:options error:&error];
    if ([object isKindOfClass:NSDictionary.class]) {
        return object;
    }
    return nil;
}

+ (NSDictionary *)xz_dictionaryWithJSON:(id)json {
    return [self xz_dictionaryWithJSON:json options:(NSJSONReadingAllowFragments)];
}

@end
