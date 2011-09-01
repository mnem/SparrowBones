//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * At the moment SparrowBones only supports Landscape xor Portrait 
 * orientations - it doesn't support both simultaneously. This is
 * because moving from landscape -> portrait (or vice versa) would
 * require re-creating the view and the OpenGLES surfaces, which is slow.
 *
 * Stick in a issue at github if you want me to start supporting this (or
 * if you want me to support it as a configurable setting per view controller
 * instance rather than per application)
 *
 *    https://github.com/mnem/SparrowBones/issues
 *
 * TL;DR - only set one of these to true.
 */
#define VIEW_ORIENTATION_LANDSCAPE true
#define VIEW_ORIENTATION_PORTRAIT false



@interface SparrowBonesViewController : UIViewController

/// The stage container this view controls.
@property (nonatomic, retain, readonly) SPStage* stage;

/// The stage container this view controls.
@property (nonatomic, retain, readonly) SPView* spview;

/**
 * Called to construct the initial display tree
 * on the stage. You should override this method
 * in order to display your initial scene
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
