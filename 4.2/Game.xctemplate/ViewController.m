//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___ViewController.h"

// Private parts
@interface ___VARIABLE_classPrefix:identifier___ViewController () {
}

@end

@implementation ___VARIABLE_classPrefix:identifier___ViewController
#pragma mark - Main entrypoints

- (void)initDisplayTree
{
    SPQuad* topLeft = [SPQuad quadWithWidth:10 height:10 color:0xff0000];
    SPQuad* topRight = [SPQuad quadWithWidth:10 height:10 color:0x00ff00];
    SPQuad* bottomRight = [SPQuad quadWithWidth:10 height:10 color:0x0000ff];
    SPQuad* bottomLeft = [SPQuad quadWithWidth:10 height:10 color:0xff00ff];
    SPQuad* center = [SPQuad quadWithWidth:100 height:100 color:0xffffff];
    SPTextField* top = [SPTextField textFieldWithWidth:100 height:14 text:@"Top" fontName:@"Helvetica" fontSize:14 color:0xffffff];
    SPTextField* bottom = [SPTextField textFieldWithWidth:100 height:14 text:@"Bottom" fontName:@"Helvetica" fontSize:14 color:0xffffff];
    
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
    
    top.x = (self.stage.width - top.width) / 2.0f;
    top.y = 0;
    
    bottom.x = (self.stage.width - bottom.width) / 2.0f;
    bottom.y = self.stage.height - bottom.height;

    // self.stage refers to the main stage container for this view.
    [self.stage addChild:topLeft];    
    [self.stage addChild:topRight];    
    [self.stage addChild:bottomLeft];    
    [self.stage addChild:bottomRight];    
    [self.stage addChild:center];
    [self.stage addChild:top];
    [self.stage addChild:bottom];
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

@end
