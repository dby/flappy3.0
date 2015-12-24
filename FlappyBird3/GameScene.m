//
//  GameScene.m
//  FlappyBird3
//
//  Created by sys on 15/12/23.
//  Copyright (c) 2015年 sys. All rights reserved.
//

#import "GameScene.h"

static const uint32_t heroCategory = 0x1 << 0;
static const uint32_t wallCategory = 0x1 << 1;
static const uint32_t holeCategory = 0x1 << 2;
static const uint32_t groundCategory = 0x1 << 3;
static const uint32_t edgeCategory = 0x1 << 4;

@interface GameScene () <SKPhysicsContactDelegate>

@property (nonatomic, strong) SKSpriteNode *hero;
@property (nonatomic, strong) SKSpriteNode *ground;
@property (nonatomic, strong) SKLabelNode *labelNode;

@property (nonatomic, strong) SKAction *moveWallAction;
@property (nonatomic, strong) SKAction *moveHeadAction;

@property BOOL isGameOver;
@property BOOL isGameStart;

@end

@implementation GameScene

-(void)initalize
{
    [super initalize];
    
    self.backgroundColor = COLOR_BG;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = edgeCategory;
    self.physicsWorld.contactDelegate = self;
    
    self.moveWallAction = [SKAction moveToX:-WALL_WIDTH duration:TIMEINTERVAL_MOVEWALL];
    
    SKAction *upHeadAction = [SKAction rotateToAngle:M_PI / 6 duration:0.2f];
    SKAction *downHeadAction = [SKAction rotateToAngle:-M_PI / 2 duration:0.8f];
    self.moveHeadAction = [SKAction sequence:@[upHeadAction, downHeadAction]];
    
    
    [self addGroundNode];
    [self addHeroNode];
    [self addResultLabelNode];
    
    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[
                                                                       [SKAction performSelector:@selector(addDust) onTarget:self],
                                                                       [SKAction waitForDuration:0.3f],
                                                                       ]
                                                   ]] withKey:ACTIONKEY_ADDDUST];
    
}

#pragma mark - 添加SKSpriteNode
- (void)addResultLabelNode
{
    self.labelNode = [SKLabelNode labelNodeWithFontNamed:@"Chaskduster"];
    _labelNode.text = @"0";
    _labelNode.fontSize = 30.0f;
    _labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    _labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeTop;
    _labelNode.position = CGPointMake(10, self.frame.size.height - 20);
    _labelNode.fontColor = [SKColor blackColor];
    [self addChild:_labelNode];
}

- (void)addHeroNode
{
    self.hero = [SKSpriteNode spriteNodeWithColor:COLOR_HERO size:HERO_SIZE];
    _hero.anchorPoint = CGPointMake(0.5, 0.5);
    _hero.position = CGPointMake(self.frame.size.width / 3, CGRectGetMidY(self.frame));
    _hero.name = NODENAME_HERO;
    _hero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_hero.size center:CGPointMake(0, 0)];
    _hero.physicsBody.categoryBitMask = heroCategory;
    _hero.physicsBody.collisionBitMask = wallCategory | groundCategory;
    _hero.physicsBody.contactTestBitMask = holeCategory | wallCategory | groundCategory;
    _hero.physicsBody.dynamic = YES;
    _hero.physicsBody.affectedByGravity = NO;
    _hero.physicsBody.allowsRotation = YES;
    _hero.physicsBody.restitution = 0;
    _hero.physicsBody.usesPreciseCollisionDetection = YES;
    [self addChild:_hero];
    
    [_hero runAction:[SKAction repeatActionForever:[self getFlyAction]] withKey:ACTIONKEY_FLY];
}

- (void)addGroundNode
{
    self.ground = [SKSpriteNode spriteNodeWithColor:COLOR_WALL size:CGSizeMake(self.frame.size.width, GROUND_HEIGHT)];
    _ground.anchorPoint = CGPointMake(0, 0);
    _ground.position = CGPointMake(0, 0);
    _ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_ground.size center:CGPointMake(_ground.size.width / 2.0f, _ground.size.height / 2.0f)];
    _ground.physicsBody.categoryBitMask = groundCategory;
    _ground.physicsBody.dynamic = NO;
    [self addChild:_ground];
    
}

#pragma mark - method

- (SKAction *)getFlyAction
{
    SKAction *flyUp = [SKAction moveToY:_hero.position.y + 10 duration:0.3f];
    flyUp.timingMode = SKActionTimingEaseOut;
    SKAction *flyDown = [SKAction moveToY:_hero.position.y - 10 duration:0.3f];
    flyDown.timingMode = SKActionTimingEaseOut;
    SKAction *fly = [SKAction sequence:@[flyUp, flyDown]];
    return fly;
}

- (void)addDust
{
    CGFloat dustWidth = (arc4random() % (DUSTWIDTH_MAX - DUSTWIDTH_MIN + 1) + DUSTWIDTH_MIN) * DUST_WIDTH;
    SKSpriteNode *dustNode = [SKSpriteNode spriteNodeWithColor:color(230, 230, 230, 1) size:CGSizeMake(dustWidth, DUST_HEIGHT)];
    dustNode.anchorPoint = CGPointMake(0, 0);
    dustNode.name = NODENAME_DUST;
    dustNode.position = CGPointMake(self.frame.size.width, arc4random() % (int)(self.frame.size.height / 3) + self.frame.size.height / 3);
    
    [dustNode runAction:[SKAction moveToX:-dustWidth duration:1.0f]];
    
    [self addChild:dustNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
