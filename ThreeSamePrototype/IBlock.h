//
//  IBlock.h
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "SGIntPoint.h"

@interface IBlock : NSObject{
    int type;
    SGIntPoint *point;
    BOOL isMove;
}

@property (nonatomic, readwrite) int type;
@property (nonatomic, retain) SGIntPoint *point;
@property (nonatomic, readwrite) BOOL isMove;

+(id)blockWithRandomTypeX:(int)ex y:(int)ey;
-(id)initWithType:(int)nType point:(SGIntPoint*)oPoint isMove:(BOOL)bIsMove;

@end
