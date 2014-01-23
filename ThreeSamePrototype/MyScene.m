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
        sprite.position = [mapInfo pointToCGPointX:oBlock.point.x y:0];
        NSLog(@"x:%d y:%d %@", oBlock.point.x, oBlock.point.y, NSStringFromCGPoint(sprite.position));
        [sprites setObject:sprite forKey:[NSString stringWithFormat:@"%d_%d",oBlock.point.x, oBlock.point.y]];
        [self addChild:sprite];
    }
}

-(void)spriteAnimate{
    for (NSString *k in sprites) {
        int ax = [[k substringToIndex:1] intValue];
        int ay = [[k substringFromIndex:2] intValue];
        NSLog(@"%d %d", ax, ay);
        SKSpriteNode *sp = [sprites objectForKey:k];
        SKAction *action = [SKAction moveTo:[mapInfo pointToCGPointX:ax y:ay] duration:0.5];
        [sp runAction:[SKAction repeatActionForever:action]];
    }
}

-(void)refreshMapInfo{
    if (mapInfo == nil) return;
    if (sprites == nil) return;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
