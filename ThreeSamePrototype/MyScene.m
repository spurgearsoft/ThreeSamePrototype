//
//  MyScene.m
//  ThreeSamePrototype
//
//  Created by 흰둥이 on 2014. 1. 22..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        mapInfo = [IMapInfo mapWithWidth:8 height:8];
        [mapInfo fillBlock];
        sprites = [NSMutableDictionary new];
        [self makeSprites];
        [self spriteAnimate];
    }
    return self;
}
-(void)makeSprites{
    for (int i=0; i<mapInfo.objects.count; i++) {
        IBlock *oBlock = [mapInfo.objects objectAtIndex:i];
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%d", oBlock.type+1]];
        NSString *sName = [self stringFromPointX:oBlock.point.x y:oBlock.point.y];
        [sprite setName:sName];
        sprite.position = [mapInfo pointToCGPointX:oBlock.point.x y:0];
        [sprite setAnchorPoint:CGPointMake(0, 0)];
        [sprites setObject:sprite forKey:sName];
        [self addChild:sprite];
    }
}
-(NSString *)stringFromPointX:(int)ex y:(int)ey{
    return [NSString stringWithFormat:@"%d_%d",ex, ey];
}

-(void)spriteAnimate{
    for (NSString *k in sprites) {
        int ax = [[k substringToIndex:1] intValue];
        int ay = [[k substringFromIndex:2] intValue];
        SKSpriteNode *sp = [sprites objectForKey:k];
        CGPoint point = [mapInfo pointToCGPointX:ax y:ay];
        SKAction *action = [SKAction moveTo:point duration:0.5];
        [sp runAction:action];
    }
}

-(void)refreshMapInfo{
    if (mapInfo == nil) return;
    if (sprites == nil) return;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (touches.count == 1) {
        UITouch *touch = [touches anyObject];
        touchStartPoint = [touch locationInNode:self];
        touchCount = 0;
        [self selectBlock:touchStartPoint];
    }
//    for (UITouch *touch in touches) {
//
//    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (touchCount > 5) {
        touchCount = 0;
        
    } else {
        touchCount++;
    }
}
-(void)selectBlock:(CGPoint)iPoint{
    if (currentNode != nil){
        [currentNode removeAllActions];
        [currentNode setAlpha:1];
    }
    currentNode = [self findSpriteFromCGPoint:iPoint];
    SKAction *blinkActon = [SKAction sequence:@[[SKAction fadeOutWithDuration:0.5],
                                                [SKAction fadeInWithDuration:0.5]]];
    SKAction *blinkForeverAction = [SKAction repeatActionForever:blinkActon];
    [currentNode runAction:blinkForeverAction];

}

-(SKSpriteNode *)findSpriteFromCGPoint:(CGPoint)iPoint{
    IBlock *iBlock = [mapInfo findBlockFromCGPoint:iPoint];
    NSLog(@"block:%d/%d", iBlock.point.x, iBlock.point.y);
    return [self findSpriteFromPointX:iBlock.point.x y:iBlock.point.y];
}
-(SKSpriteNode *)findSpriteFromPointX:(int)ex y:(int)ey{
    NSString *k = [self stringFromPointX:ex y:ey];
    return [sprites objectForKey:k];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
