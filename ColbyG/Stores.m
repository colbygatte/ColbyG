//
//  Stores.m
//  ColbyG
//
//  Created by Colby Gatte on 10/14/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "Stores.h"
// CURRENTLY NOT BEING USED
@implementation Stores

- (void) moveStoreFrom:(int)storeIndex1 to:(int)storeIndex2 {
    
    Store *store = self[storeIndex1];
    
    [self removeObjectAtIndex:storeIndex1];
    [self insertObject:store atIndex:storeIndex2];
}

/*
- (id) initWithCoder: (NSCoder *) decoder {
    if(self = [super init]) {
    
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder {
    [encoder encodeObject:self];
}


*/
@end
