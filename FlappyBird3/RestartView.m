//
//  RestartView.m
//  FlappyBird3
//
//  Created by sys on 16/1/6.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "RestartView.h"
#import "Constant.h"

#define NODENAME_BUTTON @"button"

@interface RestartView()

@property (strong, nonatomic) SKSpriteNode *button;
@property (strong, nonatomic) SKLabelNode *labelNode;

@end

@implementation RestartView

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size
{
    if (self = [super initWithColor:color size:size]) {
        self.userInteractionEnabled = self;
        
        self.button = [SKSpriteNode spriteNodeWithColor:color(17, 39, 57, 1) size:CGSizeMake(100, 60)];
        _button.position = CGPointMake(size.width / 2.0f, size.height - 400);
        _button.name = NODENAME_BUTTON;
        [self addChild:_button];
        
        self.labelNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        _labelNode.text = @"Restart";
        _labelNode.fontSize = 20.0f;
        _labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        _labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        _labelNode.position = CGPointMake(0, 0);
        _labelNode.fontColor = [UIColor whiteColor];
        [_button addChild:_labelNode];
    }
    return self;
}

+(RestartView *)getIngstanceWithSize:(CGSize)size
{
    RestartView *restartView = [RestartView spriteNodeWithColor:color(255,255,255,0.6) size:size];
    restartView.anchorPoint = CGPointMake(0, 0);
    return restartView;
}

-(void)showInScene:(SKScene *)scene
{
    self.alpha = 0;
    [scene addChild:self];
    [self runAction:[SKAction fadeInWithDuration:0.3f]];
}

-(void)dismiss
{
    [self runAction:[SKAction fadeOutWithDuration:0.3f] completion:^{
        [self removeFromParent];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    SKNode *touchNode = [self nodeAtPoint:[touch locationInNode:self]];
    
    if (touchNode == _button || touchNode == _labelNode) {
        if ([_delegate respondsToSelector:@selector(restartView:didPressRestartButton:)]) {
            [_delegate restartView:self didPressRestartButton:_button];
        }
    }
}

@end
