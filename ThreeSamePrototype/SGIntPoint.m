//
//  SGIntPoint.m
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import "SGIntPoint.h"

@implementation SGIntPoint

+(id)pointMakeX:(int)ex y:(int)ey{
    SGIntPoint *point = [SGIntPoint new];
    point.x = ex;
    point.y = ey;
    return point;
}
-(BOOL)isEqualToPoint:(SGIntPoint *)point{
    return self.x == point.x && self.y == point.y;
}

@end
