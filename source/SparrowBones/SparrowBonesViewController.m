//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "SparrowBonesViewController.h"

#if VIEW_ORIENTATION_LANDSCAPE && VIEW_ORIENTATION_PORTRAIT
#error Only one of VIEW_ORIENTATION_LANDSCAPE or VIEW_ORIENTATION_PORTRAIT can be true!
#endif

#if !VIEW_ORIENTATION_LANDSCAPE && !VIEW_ORIENTATION_PORTRAIT
#error You must set one of VIEW_ORIENTATION_LANDSCAPE or VIEW_ORIENTATION_PORTRAIT to true!
#endif

@implementation SparrowBonesViewController

#pragma mark - Properties

@synthesize stage = _stage;

- (SPView*)spview
{
    return (SPView*)(self.view);
}

#pragma mark - Application state changes

- (void)applicationWillResignActiveNotification:(NSNotification*)notification
{
    [self.spview stop];
}

- (void)applicationDidBecomeActiveNotification:(NSNotification*)notification
{
    [self.spview start];
}

#pragma mark - View lifecycle

- (CGRect)getScreenBounds
{
    CGRect screenFrame = [UIScreen mainScreen].applicationFrame;

#if VIEW_ORIENTATION_LANDSCAPE
    if(screenFrame.size.width < screenFrame.size.height)
    {
        // Force landscape
        float oldWidth = screenFrame.size.width;
        screenFrame.size.width = screenFrame.size.height;
        screenFrame.size.height = oldWidth;
    }
#endif // VIEW_ORIENTATION_LANDSCAPE

#if VIEW_ORIENTATION_PORTRAIT
    if(screenFrame.size.width > screenFrame.size.height)
    {
        // Force portrait
        float oldWidth = screenFrame.size.width;
        screenFrame.size.width = screenFrame.size.height;
        screenFrame.size.height = oldWidth;
    }
#endif // VIEW_ORIENTATION_PORTRAIT
    
    return screenFrame;
}

- (void)loadView
{
    SP_CREATE_POOL(pool);

    // Create the root view
    CGRect screenFrame = [self getScreenBounds];
    SPView* rootView = [[SPView alloc] initWithFrame:screenFrame];

    rootView.contentMode = UIViewContentModeTopLeft;
    
    rootView.stage = _stage;
    rootView.multipleTouchEnabled = NO;
    rootView.frameRate = 30.0f;
    
    self.view = rootView;
    
    // Release the root view because the controller has it's reference now.
    [rootView release];

    SP_RELEASE_POOL(pool);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create the stage
    [SPStage setSupportHighResolutions:YES];
    
#if VIEW_ORIENTATION_LANDSCAPE
    _stage = [[SPStage alloc] initWithWidth:480 height:320];        
#endif // VIEW_ORIENTATION_LANDSCAPE
    
#if VIEW_ORIENTATION_PORTRAIT
    _stage = [[SPStage alloc] initWithWidth:320 height:480];        
#endif // VIEW_ORIENTATION_PORTRAIT
        
    self.spview.stage = _stage;
    self.spview.multipleTouchEnabled = NO;
    self.spview.frameRate = 30.0f;
    
    // Listen out for Application state changes so we can pause and resume
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];

    // Start the audio
    [SPAudioEngine start];
    
    // Start the view
    [self.spview start];

    // Setup the initial display tree
    [self initDisplayTree];
}

- (void)didReceiveMemoryWarning
{
    // Stop listenting for Application state cahnges
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    // Stop the SPView and audio and remove the stage
    [self.spview stop];
    [SPAudioEngine stop];
    self.spview.stage = nil;

    // Release any cached data, images, etc that aren't in use.
    [SPPoint purgePool];
    [SPRectangle purgePool];
    [SPMatrix purgePool];    

    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    // Release the display tree
    [self releaseDisplayTree];
    
    // Release the stage
    [_stage release];
    
    [super viewDidUnload];
}

#pragma mark - View rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
#if VIEW_ORIENTATION_LANDSCAPE
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
#endif // VIEW_ORIENTATION_LANDSCAPE
    
#if VIEW_ORIENTATION_PORTRAIT
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
#endif // VIEW_ORIENTATION_PORTRAIT
}

#pragma mark - Main functions to override for Sparrow use

- (void)initDisplayTree
{
}

- (void)releaseDisplayTree
{
    [_stage removeAllChildren];
}

@end
