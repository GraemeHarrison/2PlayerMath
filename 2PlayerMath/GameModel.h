//
//  GameModel.h
//  2PlayerMath
//
//  Created by Graeme Harrison on 2016-01-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, assign) int answer;
@property (nonatomic, strong) Player *score;

-(int)randomNum;
-(int)getAnswerX:(int)x plusY:(int)y;

-(BOOL)gameOver:(Player *)playerScore;

@end
