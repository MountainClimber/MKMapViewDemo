//
//  ViewController.h
//  MKMapViewDemo
//
//  Created by KHATTRA on 08/12/14.
//  Copyright (c) 2014 xenon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
//@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)setMapType:(UISegmentedControl *)sender;

//- (IBAction)setMaptype:(id)sender;

@end

