#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreLocation/CoreLocation.h>



@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet CLLocationManager *locationManager;
-(IBAction)setMapType:(UISegmentedControl *)sender;
//- (IBAction)zoomToCurrentLocation:(UIBarButtonItem *)sender;

//- (IBAction)setMaptype:(id)sender;

@end

