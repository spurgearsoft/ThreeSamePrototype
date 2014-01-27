//
//  MyScene.h
//  ThreeSamePrototype
//

//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IMapInfo.h"
#import "IBlock.h"

typedef enum {
    SGGDirectionUp,
    SGGDirectionDown,
    SGGDirectionLeft,
    SGGDirectionRight
} SGGDirection;

@interface MyScene : SKScene{
    IMapInfo *mapInfo;
    NSMutableDictionary *sprites;
    int touchCount;
    CGPoint touchStartPoint;
    SKSpriteNode *currentNode;
}

@end
