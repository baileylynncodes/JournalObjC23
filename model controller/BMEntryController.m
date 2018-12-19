//
//  BMEntryController.m
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMEntryController.h"

@implementation BMEntryController

+ (BMEntryController *) sharedInstance {
    static BMEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance =[BMEntryController new];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadToPersistentStorage];
    });
    return sharedInstance;
}

- (void) addEntry:(BMEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

-(void) removeEntry:(BMEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];

}

- (void) modifyEntry: (BMEntry *)entry withTitle:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    [self saveToPersistentStorage];
}

- (void) saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (BMEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadToPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        BMEntry *entry = [[BMEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

@end
