#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
//@synthesize annotaionImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
   self.mapView.zoomEnabled=YES;
    
    //annotation
    CLLocationCoordinate2D annotationCoord;

    annotationCoord.latitude = 30.2506;
    annotationCoord.longitude =75.8442;
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
   // MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustom annotation"];
    //annotationView.enabled=YES;
    //annotationView.canShowCallout=YES;
    //annotationView.image = [UIImageView  ];
    //annotationPoint.coordinate = annotationCoord;
    //annotationPoint.title = @"sangrur";
    //annotationPoint.subtitle = @"my birth place";
    //[_mapView addAnnotation:annotationPoint];
    annotationPoint.coordinate = CLLocationCoordinate2DMake(30.2506, 75.8442);
    annotationPoint.title = @"Matthews Pizza";
    annotationPoint.subtitle = @"Best Pizza in Town";
    [self.mapView addAnnotation:annotationPoint];
    
    //ravi
    
    
    
    
    //end parm
    
    
    
    //current location display setup
    _locationManager =[[CLLocationManager alloc]init];
    [_locationManager requestWhenInUseAuthorization];
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if(authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse ||
       authorizationStatus == kCLAuthorizationStatusAuthorizedAlways)
    {
        [_locationManager startUpdatingLocation];
        _mapView.showsUserLocation=YES;
    }
    else
    {
        NSLog(@"device is not allowed to use the current location service");
    }
    
    
}
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSLog(@"Clicked Pizza Shop");
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Disclosure Pressed" message:@"Click Cancel to Go Back" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
   // UIImageView *annotationImage;
//#define kHeight 36
//#define kWidth 36
//#define kBorder 0
  //  annotationImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    // If it's the user location, just return nil.
    NSLog(@"viewForAnnotation is called");
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
           
           // UIImage *image = [UIImage imageNamed:@"santa-claus-7.png" ];// scale:0.2 orientation:0];
            NSString *str=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"santa-claus-7.png" ];
            NSLog(@"Path: %@", str);
            
            NSData *dataImage = [NSData dataWithContentsOfFile:str];
        
            UIImage *image = [UIImage imageWithData:dataImage scale:10];
                             // ];// scale:0.2 orientation:0];          // image.scale = 0.2;
           // image.scale = 0.2;
           // [image resizingMode:0.2];
            pinView.image = image;
            
            pinView.calloutOffset = CGPointMake(0, 32);
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pizza_slice_32.png"]];
            pinView.leftCalloutAccessoryView = iconView;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateLocations called, Location %@",locations);
    //   MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locations.coordinate, 800, 800);
    // [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
}

- (void)mapView:(MKMapView *)mapView
regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"regionWillChangeAnimated called");
    // MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_locationManager.location, 800, 800);
    
}


///

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType=MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType=MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType=MKMapTypeHybrid;
            break;
        default:
            break;
    }
}
@end
