//
//  ALIAppDelegate.h
//  testeStickNFind
//
//  Created by Marcelo Garcia on 17/07/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <snfsdk/snfsdk.h>
#import "ALIViewController.h"

@interface ALIAppDelegate : UIResponder <UIApplicationDelegate,LeDeviceManagerDelegate,LeSnfDeviceDelegate>
{
    LeDeviceManager *leMgr;
    NSData *snfFirmwareData;        // firmware update data
    NSString *leFileName;           // file name for persistent storage dictionary
    NSMutableDictionary *leDict;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LeDeviceManager *leMgr;
@property (strong, nonatomic) ALIViewController *tabVC;
@end
