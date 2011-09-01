//
//  SparrowBonesAppDelegate.h
//  SparrowBones
//
//  Created by David Wagner on 29/08/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBoneViewController.h"

@interface SparrowBonesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow* window;

/**
 * This property defines what the main view class is. If you want the
 * initial view controller to be a different one, change the name
 * "GameBoneViewController" to your own view controller which subclasses
 * a SparrowBonesViewController.
 *
 * NOTE: don't forget to change the '#import "GameBoneViewController.h"' at
 * the top of the file to import the class you change it to. Also, in
 * MainWindow.xib change the View class to be your custom class.
 */
@property (nonatomic, retain) IBOutlet GameBoneViewController* viewController;

@end
