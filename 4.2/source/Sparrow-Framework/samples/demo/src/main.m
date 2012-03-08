//
//  main.m
//  Demo
//
//  Created by Daniel Sperl on 25.07.09.
//  Copyright 2011 Gamua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoAppDelegate.h"

int main(int argc, char *argv[]) 
{    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([DemoAppDelegate class]));
    [pool release];
    return retVal;
}
