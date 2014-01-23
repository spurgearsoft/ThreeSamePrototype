//
//  MyScene.h
//  ThreeSamePrototype
//

//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IMapInfo.h"
#import "IBlock.h"

@interface MyScene : SKScene{
    IMapInfo *mapInfo;
    NSMutableDictionary *sprites;
}

@end
