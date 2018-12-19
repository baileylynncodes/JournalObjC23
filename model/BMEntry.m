//
//  BMEntry.m
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMEntry.h"

@implementation BMEntry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self){
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *text = dictionary[@"text"];
    NSDate *timestamp = dictionary[@"timestamp"];
    
    return [self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             @"title": self.title,
             @"text" : self.text,
             @"timestamp": self.timestamp
             };
}
@end
