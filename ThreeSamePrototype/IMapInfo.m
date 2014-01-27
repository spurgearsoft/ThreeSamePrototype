//
//  IMapInfo.m
//  ThreeSamePrototype
//
//  Created by khjung on 2014. 1. 23..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import "IMapInfo.h"

static const CGFloat mapLeft = 0;
static const CGFloat mapTop = 150;
static const CGFloat mapBlockWidth = 40;

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
    return CGPointMake((ex * mapBlockWidth) + mapLeft, ((self.height - ey) * mapBlockWidth) + mapTop);
}
-(IBlock *)findBlockFromCGPoint:(CGPoint)iPoint{
    int ex = (int)floor((iPoint.x - mapLeft) / mapBlockWidth);
    int ey = self.height - (int)floor((iPoint.y - mapTop) / mapBlockWidth);
    return [self findBlockFromPointX:ex y:ey];
}
-(IBlock *)findBlockFromPointX:(int)ex y:(int)ey{
    for (int i=0; i<objects.count; i++) {
        IBlock *iBlock = [objects objectAtIndex:i];
        if([iBlock.point isEqualToPoint:[SGIntPoint pointMakeX:ex y:ey]]) return iBlock;
    }
    return nil;
}

-(void)fillBlock{
    for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
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
