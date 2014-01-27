//
//  IMapInfo.h
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBlock.h"

@interface IMapInfo : NSObject {
    int width;
    int height;
    NSMutableArray *objects;
}

@property (nonatomic, readwrite) int width;
@property (nonatomic, readwrite) int height;
@property (nonatomic, retain) NSMutableArray *objects;

+(id)mapWithWidth:(int)nWidth height:(int)nHeight;
-(id)initWithWidth:(int)nWidth height:(int)nHeight;
-(void)fillBlock;
-(CGPoint)pointToCGPointX:(int)ex y:(int)ey;
-(NSMutableArray *)checkEmptyBlock;
-(BOOL)isEmptyBlockX:(int)ex y:(int)ey;
-(IBlock *)findBlockFromCGPoint:(CGPoint)iPoint;
-(IBlock *)findBlockFromPointX:(int)ex y:(int)ey;

@end
