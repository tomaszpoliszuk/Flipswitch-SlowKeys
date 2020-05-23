#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface SlowKeysSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSSlowKeysEnabled();
extern "C" void _AXSSetSlowKeysEnabled(BOOL);

@implementation SlowKeysSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSSlowKeysEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetSlowKeysEnabled(newState == FSSwitchStateOn);
}

@end
