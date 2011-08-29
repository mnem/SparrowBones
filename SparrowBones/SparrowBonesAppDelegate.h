//
//  SparrowBonesAppDelegate.h
//  SparrowBones
//
//  Created by David Wagner on 29/08/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SparrowBonesViewController;

@interface SparrowBonesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet SparrowBonesViewController* viewController;

@end
