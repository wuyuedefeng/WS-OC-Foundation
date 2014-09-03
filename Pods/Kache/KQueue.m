//
//  KQueue.m
//  KacheDemo
//
//  Created by jiajun on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KConfig.h"
#import "KHolder.h"
#import "KObject.h"
#import "KQueue.h"
#import "KUtil.h"

@interface KQueue ()

@property (strong, nonatomic)   KHolder               *holder;
@property (assign, nonatomic)   NSInteger             offset;
@property (strong, atomic)      NSMutableArray        *queue;

- (void)cleanExpiredObjects;

@end

@implementation KQueue

@synthesize holder              = _holder;
@synthesize name                = _name;
@synthesize offset              = _offset;
@synthesize queue               = _queue;
@synthesize size                = _size;

#pragma mark - init

- (KQueue *)initWithHolder:(KHolder *)aHolder
{
    self = [super init];
    
    if (self) {
        self.holder = aHolder;
        self.queue  = [[NSMutableArray alloc] init];
        self.size   = KACHE_DEFAULT_QUEUE_SIZE;
        self.offset = 0;
        
        return self;
    }
    
    return nil;
}

#pragma mark - private

- (void)cleanExpiredObjects
{
    if (self.queue && 0 < [self.queue count]) {
        for (int i = 0; i < [self.queue count] - 1; i ++) {
            NSString *tmpKey = [self.queue objectAtIndex:i];
            KObject *leftObject = [self.holder objectForKey:tmpKey];
            if ([leftObject expiredTimestamp] < [KUtil nowTimestamp]) {
                [self.queue removeObject:tmpKey];
            }
            else {
                break;
            }
        }
    }
}

#pragma mark - public

- (void)push:(id)data
{
    NSString *key = [NSString stringWithFormat:@"QUEUE_%@_%ld", self.name, (long)self.offset];
    self.offset ++;
    [self.holder setValue:data forKey:key expiredAfter:0];

    [self cleanExpiredObjects];
    
    if (self.size <= [self.queue count]) {
        [self.holder removeObjectForKey:[self.queue objectAtIndex:0]];
        [self.queue removeObjectAtIndex:0];
    }

    [self.queue addObject:key];
}

- (id)pop
{
    if (0 < [self.queue count]) {
        NSString *key = [self.queue objectAtIndex:0];
        [self.queue removeObjectAtIndex:0];
        KObject *object = [self.holder objectForKey:key];
        [self.holder removeObjectForKey:key];
        return [object value];
    }
    
    return nil;
}

// Convert object to NSDictionary.
- (NSDictionary *)serialize
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [NSString stringWithFormat:@"%ld", (long)self.size],   @"size",
            self.name,                                      @"name",
            self.queue,                                     @"queue",
            [NSString stringWithFormat:@"%ld", (long)self.offset], @"offset",
            nil];
}

// Convert NSDictionary to object.
- (void)unserializeFrom:(NSDictionary *)dict
{
    if ([[dict allKeys] containsObject:@"size"]
        && [[dict allKeys] containsObject:@"name"]
        && [[dict allKeys] containsObject:@"queue"]
        && [[dict allKeys] containsObject:@"offset"]) {
        self.size   = [[dict objectForKey:@"size"] intValue];
        self.name   = [NSString stringWithFormat:@"%@", [dict objectForKey:@"name"]];
        self.queue  = [[dict objectForKey:@"queue"] mutableCopy];
        self.offset = [[dict objectForKey:@"offset"] intValue];
    }
}

@end
