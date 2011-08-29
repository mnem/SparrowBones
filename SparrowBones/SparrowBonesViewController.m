//
//  SparrowBonesViewController.m
//  SparrowBones
//
//  Created by David Wagner on 29/08/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "SparrowBonesViewController.h"

@implementation SparrowBonesViewController

#pragma mark - Properties

@synthesize stage = _stage;

#pragma mark - Application state changes

- (void)applicationWillResignActiveNotification:(NSNotification*)notification
{
    [(SPView*)(self.view) stop];
}

- (void)applicationDidBecomeActiveNotification:(NSNotification*)notification
{
    [(SPView*)(self.view) start];
}

#pragma mark - Low memory

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    [SPPoint purgePool];
    [SPRectangle purgePool];
    [SPMatrix purgePool];    
}

#pragma mark - View lifecycle

- (void)loadView
{
    SP_CREATE_POOL(pool);
    
    [SPStage setSupportHighResolutions:YES];
    [SPAudioEngine start];
    
    _stage = [[SPStage alloc] init];        

    SPView* rootView = [[SPView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    rootView.stage = _stage;
    rootView.multipleTouchEnabled = NO;
    rootView.frameRate = 30.0f;
    
    self.view = rootView;
    
    [rootView release];
    [_stage release];
    
    [rootView start];

    SP_RELEASE_POOL(pool);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];

    [self initDisplayTree];
}

- (void)viewDidUnload
{
    /// FIXME: Don't think this is the correct place to do this
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self releaseDisplayTree];
    [SPAudioEngine stop];
    
    [super viewDidUnload];
}

#pragma mark - View rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - Main functions to override for Sparrow use

- (void)initDisplayTree
{
    SPQuad *quad = [SPQuad quadWithWidth:100 height:100];
    quad.color = 0xff0000;
    quad.x = 50;
    quad.y = 50;
    [_stage addChild:quad];
}

- (void)releaseDisplayTree
{
    [_stage removeAllChildren];
}

@end
