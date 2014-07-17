//
//  ALIViewController.m
//  testeStickNFind
//
//  Created by Marcelo Garcia on 17/07/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import "ALIViewController.h"
#import "ALIAppDelegate.h"
#import <snfsdk/snfsdk.h>
#include <objc/message.h>

@interface ALIViewController ()
{
    ALIAppDelegate *appDelegate;
}
@end

@implementation ALIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appDelegate = (ALIAppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.tabVC = self;
    [self refreshDistance];
    
    self.pinoblu = [[LeBlutrackerDevice alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)deviceList
{
    return appDelegate.leMgr.devList;
}

-(void)connectOperation
{
    LeDevice *dev = [[self deviceList]objectAtIndex:0];
    if (dev.shouldBeConnected) {
        NSLog(@"bombou");
    }
    else
    {
        NSLog(@"Nao bombou");
        [dev connect];
    }
}

-(void)refreshDistance
{
    if ([self deviceList].count == 0)
        return;
    
    LeDevice  *dev = [[self deviceList ] objectAtIndex:0];
    NSString *distance;
    
    NSLog(@"GPS - %@",self.pinoblu);
    
    if ([dev isKindOfClass:[LeSnfDevice class]]) {
        distance = [objc_getAssociatedObject(dev, @"temp")substringFromIndex:2];
        if (nil != distance) {
            self.lblDistance.text = distance;
            NSLog(@"Temperatura %@",distance);
            if ([distance floatValue]>0.7 || [distance floatValue] < 0) {
                self.imgRadar.image = [UIImage imageNamed:@"Signal-02"];
           
            }
                else if ([distance floatValue] > 0.2 && [distance floatValue] < 0.7)
                    self.imgRadar.image = [UIImage imageNamed:@"Signal-03"];
                else
                    self.imgRadar.image = [UIImage imageNamed:@"Signal-04"];
            }
            else
                self.lblDistance.text = @"";
        }else
            self.lblDistance2.text = @"";

       }
@end
