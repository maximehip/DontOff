#line 1 "Tweak.x"
#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>

@interface SBUIPowerDownView : UIView
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBUIPowerDownView; 
static void (*_logos_orig$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide)(_LOGOS_SELF_TYPE_NORMAL SBUIPowerDownView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide(_LOGOS_SELF_TYPE_NORMAL SBUIPowerDownView* _LOGOS_SELF_CONST, SEL); 

#line 7 "Tweak.x"


static void _logos_method$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide(_LOGOS_SELF_TYPE_NORMAL SBUIPowerDownView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	LAContext *context = [[LAContext alloc] init];
	NSError *error = nil;
	NSString *reason = @"Please authenticate using TouchID/FaceID.";

	if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
        localizedReason:reason
        reply:^(BOOL success, NSError *error)
        {
          dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
          {
            dispatch_async(dispatch_get_main_queue(), ^(void)
            {
              if (success) {
                _logos_orig$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide(self, _cmd);
              }
            });
          });
        }];
    	} else {
         NSLog(@"active auth");
      }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBUIPowerDownView = objc_getClass("SBUIPowerDownView"); { MSHookMessageEx(_logos_class$_ungrouped$SBUIPowerDownView, @selector(_powerDownSliderDidCompleteSlide), (IMP)&_logos_method$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide, (IMP*)&_logos_orig$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide);}} }
#line 35 "Tweak.x"
