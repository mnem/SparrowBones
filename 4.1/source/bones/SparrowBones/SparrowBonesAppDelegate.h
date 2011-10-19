//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___PACKAGENAMEASIDENTIFIER___ViewController.h"

@interface SparrowBonesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow* window;

/**
 * This property defines what the main view class is. If you want the
 * initial view controller to be a different one, change the name
 * "___PACKAGENAMEASIDENTIFIER___ViewController" to your own view controller
 * which subclasses a SparrowBonesViewController.
 *
 * NOTE: don't forget to change
 * 
 *    #import "___PACKAGENAMEASIDENTIFIER___ViewController.h"
 *
 * at the top of the file to import the class you change it to. Also, in
 * MainWindow.xib change the View class to be your custom class.
 */
@property (nonatomic, retain) IBOutlet ___PACKAGENAMEASIDENTIFIER___ViewController* viewController;

@end
