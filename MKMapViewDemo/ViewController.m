//
//  ViewController.m
//  MKMapViewDemo
//
//  Created by KHATTRA on 08/12/14.
//  Copyright (c) 2014 xenon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView.mapType=MKMapTypeHybrid;
    self.mapView.zoomEnabled=YES;
    self.mapView.scrollEnabled=NO;
   // NSLog(@ " % ", self.mapView.userLocation.title);
    NSLog(@ " % ",self.mapView.userLocation.location.coordinate.latitude);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType=MKMapTypeSatellite;
            break;
        case 1:
            self.mapView.mapType=MKMapTypeStandard;
            break;
        case 2:
            self.mapView.mapType=MKMapTypeHybrid;
            break;
        default:
            break;
    }
}
@end
