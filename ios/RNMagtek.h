#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <React/RCTEventEmitter.h>
#import "Magtek/MTSCRA.h"

@interface RNMagtek : RCTEventEmitter <RCTBridgeModule>

@property(nonatomic, strong) MTSCRA *lib;

- (void) connect:(RCTResponseSenderBlock)callback;
- (void) devConnStatusChange;

@end
