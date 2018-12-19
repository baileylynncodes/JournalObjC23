//
//  BMEntry.h
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMEntry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) NSDictionary *dictionaryRepresentation;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

- (instancetype) initWithTitle:(NSString *)title text:(NSString *)text timestamp: (NSDate *)timestamp;


@end

NS_ASSUME_NONNULL_END
