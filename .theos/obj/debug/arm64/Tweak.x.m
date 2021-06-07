#line 1 "Tweak.x"
#import <LocalAuthentication/LocalAuthentication.h>
#import <Authenticate/Authenticate.h>
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

#line 8 "Tweak.x"


static void _logos_method$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide(_LOGOS_SELF_TYPE_NORMAL SBUIPowerDownView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  [[Authenticate alloc] authenticate:@"reason" completed:^(BOOL success) {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
      if (success) {
        _logos_orig$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide(self, _cmd);
      }
    });
    
  }];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBUIPowerDownView = objc_getClass("SBUIPowerDownView"); { MSHookMessageEx(_logos_class$_ungrouped$SBUIPowerDownView, @selector(_powerDownSliderDidCompleteSlide), (IMP)&_logos_method$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide, (IMP*)&_logos_orig$_ungrouped$SBUIPowerDownView$_powerDownSliderDidCompleteSlide);}} }
#line 22 "Tweak.x"
