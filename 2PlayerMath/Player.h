//
//  Player.h
//  2PlayerMath
//
//  Created by Graeme Harrison on 2016-01-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) int score;
@property (nonatomic, assign) BOOL turn;
@property (nonatomic, assign) int answer;

-(int)newScore;

@end
