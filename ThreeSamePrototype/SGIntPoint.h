//
//  SGIntPoint.h
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGIntPoint : NSObject{
    int x;
    int y;
}
@property (nonatomic, readwrite) int x;
@property (nonatomic, readwrite) int y;

+(id)pointMakeX:(int)ex y:(int)ey;
-(BOOL)isEqualToPoint:(SGIntPoint *)point;
@end
