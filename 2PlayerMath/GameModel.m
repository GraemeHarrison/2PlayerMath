//
//  GameModel.m
//  2PlayerMath
//
//  Created by Graeme Harrison on 2016-01-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _x = 0;
//        _y = 0;
    }
    return self;
}

-(int)randomNum {
    return arc4random_uniform(19) + 1;
}

-(int)getAnswerX:(int)x plusY:(int)y {
    return x + y;
}

-(BOOL)gameOver:(Player *)playerScore {
    if (playerScore.score == 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
