//
//  Player.m
//  2PlayerMath
//
//  Created by Graeme Harrison on 2016-01-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _score = 3;
    }
    return self;
}

-(int)newScore {
    self.score = self.score - 1;
    return self.score;
}

@end
