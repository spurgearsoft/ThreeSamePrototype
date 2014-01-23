//
//  IBlock.m
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import "IBlock.h"

@implementation IBlock
@synthesize type,point,isMove;
+(id)blockWithRandomTypeX:(int)ex y:(int)ey{
    return [[IBlock alloc]initWithType:(int)random()%6 point:[SGIntPoint pointMakeX:ex y:ey] isMove:NO];
}
-(id)initWithType:(int)nType point:(SGIntPoint*)oPoint isMove:(BOOL)bIsMove{
    self = [super init];
    if (self) {
        self.type = nType;
        self.point = oPoint;
        self.isMove = bIsMove;
    }
    return self;
}

@end
