#import "RNMagtek.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation RNMagtek

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"devConnectionNotification"];
}
    
- (void) devConnStatusChange {
    BOOL isDeviceConnected = [self.lib isDeviceConnected];
    [self sendEventWithName:@"devConnectionNotification" body:@{@"isDeviceConnected": @(isDeviceConnected)}];
}

RCT_EXPORT_METHOD(connect:(RCTResponseSenderBlock)callback) {
    // Init MTSCRA lib
    if (self.lib == nil) {
        self.lib = [[MTSCRA alloc] init];
        // Init observers
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(devConnStatusChange) name:@"devConnectionNotification" object:nil];
    }
    // Set type
    [self.lib setDeviceType:MAGTEKAUDIOREADER];
    // Open device
    if (!self.lib.isDeviceOpened ) {
        [self.lib openDevice];
    } else {
        [self.lib closeDevice];
    }
    if (self.lib.getDeviceType == MAGTEKAUDIOREADER) {
        MPMusicPlayerController *musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
        musicPlayer.volume = 1.0f;
    }
    callback(@[@{@"isDeviceOpenend": @([self.lib isDeviceOpened]), @"isDeviceConnected": @([self.lib isDeviceConnected])}]);
}

@end
