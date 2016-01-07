//
//  RestartView.h
//  FlappyBird3
//
//  Created by sys on 16/1/6.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class RestartView;
@protocol RestartViewDelegate <NSObject>

- (void)restartView:(RestartView *)restartView didPressRestartButton:(SKSpriteNode *)restartButton;

@end

@interface RestartView : SKSpriteNode

@property (weak, nonatomic) id <RestartViewDelegate> delegate;

+ (RestartView *)getIngstanceWithSize:(CGSize)size;
- (void)dismiss;
- (void)showInScene:(SKScene *)scene;

@end
