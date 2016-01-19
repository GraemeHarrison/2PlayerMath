//
//  ViewController.m
//  2PlayerMath
//
//  Created by Graeme Harrison on 2016-01-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *player1Label;
@property (strong, nonatomic) IBOutlet UILabel *player2Label;
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, strong) NSMutableArray *answerArray;
@property (nonatomic, assign) int answer;
@property (nonatomic, assign) int userAnswer;
@property (nonatomic, strong) GameModel *game;
@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.game = [[GameModel alloc] init];

    self.player1 = [[Player alloc] init];
    self.player1.turn = YES;
    self.player2 = [[Player alloc] init];
    self.player2.turn = NO;
    
    self.game.x = [self.game randomNum];
    self.game.y = [self.game randomNum];
    self.game.answer = [self.game getAnswerX:self.game.x plusY:self.game.y];
    
    self.answerArray = [[NSMutableArray alloc] init];
    
    self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %d + %d = ?", self.game.x ,self.game.y];
    self.player1Label.text = [NSString stringWithFormat:@"Player 1 Score: %d", self.player1.score];
    self.player2Label.text = [NSString stringWithFormat:@"Player 2 Score: %d", self.player2.score];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)num1:(UIButton *)sender {
    [self.answerArray addObject:@"1"];
}
- (IBAction)num2:(UIButton *)sender {
    [self.answerArray addObject:@"2"];
}
- (IBAction)num3:(UIButton *)sender {
    [self.answerArray addObject:@"3"];
}
- (IBAction)num4:(UIButton *)sender {
    [self.answerArray addObject:@"4"];
}
- (IBAction)num5:(UIButton *)sender {
    [self.answerArray addObject:@"5"];
}
- (IBAction)num6:(UIButton *)sender {
    [self.answerArray addObject:@"6"];
}
- (IBAction)num7:(UIButton *)sender {
    [self.answerArray addObject:@"7"];
}
- (IBAction)num8:(UIButton *)sender {
    [self.answerArray addObject:@"8"];
}
- (IBAction)num9:(UIButton *)sender {
    [self.answerArray addObject:@"9"];
}
- (IBAction)num0:(UIButton *)sender {
    [self.answerArray addObject:@"0"];
}

- (IBAction)enter:(UIButton *)sender {
    NSString *preAnswer = [[NSString alloc]init];
    
    for (NSString *num in self.answerArray) {
        preAnswer = [preAnswer stringByAppendingString:num];
    }
    // Next time use components joined by string
    if ([preAnswer rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location != NSNotFound)
    {
        self.userAnswer = [preAnswer intValue];
        NSLog(@"game answer: %d", self.game.answer);
        NSLog(@"user answer: %d", self.userAnswer);
    }

    if (self.player1.turn == YES) {
        // Player1's turn
        if (self.userAnswer != self.game.answer) {
            NSLog(@"Sorry no good!");
            [self.player1 newScore];
            self.player1Label.text = [NSString stringWithFormat:@"Player 1 Score: %d", self.player1.score];
        } else {
            NSLog(@"Congratz!");
        }
        [self.answerArray removeAllObjects];
        self.game.x = [self.game randomNum];
        self.game.y = [self.game randomNum];
        self.game.answer = [self.game getAnswerX:self.game.x plusY:self.game.y];
        self.questionLabel.text = [NSString stringWithFormat:@"Player 2: %d + %d = ?", self.game.x ,self.game.y];
        self.player1.turn = NO;
        self.player2.turn =YES;
        if ([self.game gameOver:self.player1]) {
            self.questionLabel.text = [NSString stringWithFormat:@"Game over! Player 2 wins!"];
        }
    } else {
        // Player2's turn
        if (self.userAnswer != self.game.answer) {
            NSLog(@"Sorry no good!");
            [self.player2 newScore];
            } else {
                NSLog(@"Congratz!");
            }
        [self.answerArray removeAllObjects];
        self.game.x = [self.game randomNum];
        self.game.y = [self.game randomNum];
        self.game.answer = [self.game getAnswerX:self.game.x plusY:self.game.y];
        self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %d + %d = ?", self.game.x ,self.game.y];
        self.player2Label.text = [NSString stringWithFormat:@"Player 2 Score: %d", self.player2.score];
        self.player2.turn = NO;
        self.player1.turn =YES;
        if ([self.game gameOver:self.player2]) {
            self.questionLabel.text = [NSString stringWithFormat:@"Game over! Player 1 wins!"];
        }

    }
}

@end

//    for (int i = 0; i < [self.answerArray count]; i++) {
//        if ([[self.answerArray objectAtIndex:i ] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location != NSNotFound)
//        {
//            num = [[self.answerArray objectAtIndex:i ] intValue];
//        }
//        answer = [NSString]
//        NSLog(@"answer: %d", answer);
//    }

//    // Multiply each number except last by 10 then add together
//    int answer = 0;
//    int sumtimes10 = 0;
//    for (int i = 0; i < [self.answerArray count]; i++) {
//        sumtimes10 += [[self.answerArray objectAtIndex:i] intValue] * (10 ^ i);
//        NSLog(@"sumtimes10: %d", sumtimes10);
//    }
//
//    answer = sumtimes10 + [[self.answerArray lastObject] intValue];
//    NSLog(@"answer: %d", answer);
