#import <Authenticate/Authenticate.h>
#import <UIKit/UIKit.h>

@interface SBUIPowerDownView : UIView
@end

%hook SBUIPowerDownView

-(void)_powerDownSliderDidCompleteSlide {
  [[Authenticate alloc] authenticate:@"Turn off" completed:^(BOOL success) {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
      if (success) {
        %orig;
      }
    });
    
  }];
}

%end