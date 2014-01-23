//
//  IMapInfo.m
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import "IMapInfo.h"
#import "IBlock.h"

@implementation IMapInfo

@synthesize width,height,objects;

+(id)mapWithWidth:(int)nWidth height:(int)nHeight{
    return [[IMapInfo alloc] initWithWidth:nWidth height:nHeight];
}

-(id)initWithWidth:(int)nWidth height:(int)nHeight{
    self = [super init];
    if (self) {
        self.width = nWidth;
        self.height = nHeight;
        objects = [NSMutableArray new];
    }
    return self;
}
-(CGPoint)pointToCGPointX:(int)ex y:(int)ey{
    CGFloat left = 30;
    CGFloat top = 150;
    CGFloat mwidth = 30;
    return CGPointMake((ex * mwidth) + left, ((self.height - ey) * mwidth) + top);
}
-(void)fillBlock{
    for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
            if (x == 0 && y == 0) continue;
            if ([self isEmptyBlockX:x y:y]) {
                [self.objects addObject:[IBlock blockWithRandomTypeX:x y:y]];
            }
        }
    }
}

-(NSMutableArray *)checkEmptyBlock{
    NSMutableArray *emptyBlock = [NSMutableArray new];
    if (objects == nil) objects = [NSMutableArray new];
    for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
            if ([self isEmptyBlockX:x y:y]) {
                [emptyBlock addObject:[SGIntPoint pointMakeX:x y:y]];
            }
        }
    }
    return emptyBlock;
}
-(BOOL)isEmptyBlockX:(int)ex y:(int)ey{
    for (int i=0; i<objects.count; i++) {
        IBlock *block = [objects objectAtIndex:i];
        if (ex == block.point.x && ey == block.point.y ) {
            return NO;
        }
    }
    return YES;
}

@end
