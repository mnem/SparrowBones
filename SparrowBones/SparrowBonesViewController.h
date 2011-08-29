//
//  SparrowBonesViewController.h
//  SparrowBones
//
//  Created by David Wagner on 29/08/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SparrowBonesViewController : UIViewController

@property (nonatomic, retain, readonly) SPStage* stage;

/**
 * Called to construct the initial display tree
 * on the stage. You should override this method
 * but NOT call [super initDisplayTree], otherwise
 * you'll get the hello world red quad of doom on
 * your stage.
 */
- (void)initDisplayTree;

/**
 * Called to release all display tree objects. By
 * default, this removes all children on the stage,
 * so you don't need to override it unless you have
 * specific non-visual resources to release
 */
- (void)releaseDisplayTree;

@end
