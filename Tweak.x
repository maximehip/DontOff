#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>

@interface SBUIPowerDownView : UIView
@end

%hook SBUIPowerDownView

-(void)_powerDownSliderDidCompleteSlide {
	LAContext *context = [[LAContext alloc] init];
	NSError *error = nil;

	if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
        localizedReason:@"Please authenticate to power down"
        reply:^(BOOL success, NSError *error)
        {
          dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
          {
            dispatch_async(dispatch_get_main_queue(), ^(void)
            {
              if (success) {
                %orig();
              }
            });
          });
        }];
    	} else {
         NSLog(@"active auth");
      }
}

%end