//
//  Constant.h
//  FlappyBird3
//
//  Created by sys on 15/12/23.
//  Copyright © 2015年 sys. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define HERO_SIZE CGSizeMake(40, 30)
#define WALL_WIDTH 40

#define NODENAME_HERO @"heronode"
#define NODENAME_BRICK @"brick"
#define NODENAME_WALL @"wall"
#define NODENAME_HOLE @"hole"
#define NODENAME_DUST @"dust"

#define ACTIONKEY_ADDWALL @"addwall"
#define ACTIONKEY_MOVEWALL @"movewall"
#define ACTIONKEY_FLY @"fly"
#define ACTIONKEY_ADDDUST @"adddust"
#define ACTIONKEY_MOVEHEAD @"movehead"

#define GROUND_HEIGHT 20.0f

#define TIMEINTERVAL_ADDWALL 2.0f
#define TIMEINTERVAL_MOVEWALL 4.0f

#define DUST_WIDTH 20.0f
#define DUST_HEIGHT 1.0f
#define DUSTWIDTH_MIN 2
#define DUSTWIDTH_MAX 5

#define COLOR_HERO  [SKColor colorWithRed:244/255. green:118/255. blue:148/255. alpha:1]
#define COLOR_BG    [UIColor whiteColor]
#define COLOR_WALL  [SKColor colorWithRed:34/255. green:166/255. blue:159/255. alpha:1]
#define COLOR_LABEL [SKColor colorWithRed:17/255. green:39/255. blue:57/255. alpha:1]

#define DEVICE_BOUNDS [[UIScreen mainScreen] applicationFrame]
#define DEVICE_SIZE [[UIScreen mainScreen] applicationFrame].size
#define WINDOW_SIZE [[UIApplication sharedApplication] keyWindow].frame.size
#define DELTA_Y ( DEVICE_OS_VERSION >= 7.0f? 20.0f:0.0f)

#define color(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define DEVICE_OS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#endif /* Constant_h */
