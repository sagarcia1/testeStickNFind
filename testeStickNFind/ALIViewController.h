//
//  ALIViewController.h
//  testeStickNFind
//
//  Created by Marcelo Garcia on 17/07/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <snfsdk/snfsdk.h>
@interface ALIViewController : UIViewController<MKMapViewDelegate,LeBlutrackerDeviceDelegate>

- (void) connectOperation;
@property (weak, nonatomic) IBOutlet UIImageView *imgRadar;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance2;
@property (weak, nonatomic) IBOutlet MKMapView *mapinha;
@property (nonatomic,strong)LeBlutrackerDevice *pinoblu;


@end
