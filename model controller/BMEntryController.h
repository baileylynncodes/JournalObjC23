//
//  BMEntryController.h
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface BMEntryController : NSObject

+ (BMEntryController *)sharedInstance;

@property (nonatomic, strong) NSMutableArray *entries;

- (void) addEntry: (BMEntry *)entry;
- (void) removeEntry: (BMEntry *) entry;
- (void) modifyEntry:(BMEntry *)entry withTitle:(NSString *)title
                text:(NSString *)text;

- (void) saveToPersistentStorage;

-(void) loadToPersistentStorage;


@end

NS_ASSUME_NONNULL_END
