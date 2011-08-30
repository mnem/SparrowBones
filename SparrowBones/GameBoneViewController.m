//
//  GameBoneViewController.m
//  SparrowBones
//
//  Created by David Wagner on 30/08/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "GameBoneViewController.h"

@implementation GameBoneViewController

#pragma mark - Main entrypoints

- (void)initDisplayTree
{
    SPQuad* topLeft = [SPQuad quadWithWidth:10 height:10 color:0xff0000];
    SPQuad* topRight = [SPQuad quadWithWidth:10 height:10 color:0x00ff00];
    SPQuad* bottomRight = [SPQuad quadWithWidth:10 height:10 color:0x0000ff];
    SPQuad* bottomLeft = [SPQuad quadWithWidth:10 height:10 color:0xff00ff];
    SPQuad* center = [SPQuad quadWithWidth:100 height:100 color:0xffffff];
    
    topLeft.x = 0;
    topLeft.y = 0;

    topRight.x = self.stage.width - topRight.width;
    topRight.y = 0;

    bottomLeft.x = 0;
    bottomLeft.y = self.stage.height - bottomLeft.height;

    bottomRight.x = self.stage.width - bottomRight.width;
    bottomRight.y = self.stage.height - bottomRight.height;

    center.x = (self.stage.width - center.width) / 2.0f;
    center.y = (self.stage.height - center.height) / 2.0f;

    // self.stage refers to the main stage container for this view.
    [self.stage addChild:topLeft];    
    [self.stage addChild:topRight];    
    [self.stage addChild:bottomLeft];    
    [self.stage addChild:bottomRight];    
    [self.stage addChild:center];    
}


#pragma mark -  Class Lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc 
{
    // Deallocation code here
    
    [super dealloc];
}

@end
