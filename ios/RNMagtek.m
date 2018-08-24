#import "RNMagtek.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation RNMagtek

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"onDeviceConnectionDidChange", @"onDataReceived"];
}
    
- (void) devConnStatusChange {
    BOOL isDeviceConnected = [self.lib isDeviceConnected];
    BOOL isDeviceOpenend = [self.lib isDeviceOpened];
    if (!isDeviceConnected && !isDeviceOpenend) {
        [self.lib closeDevice];
    }
    [self sendEventWithName:@"onDeviceConnectionDidChange" body:@{@"isDeviceOpenend": @(isDeviceOpenend), @"isDeviceConnected": @(isDeviceConnected)}];
}

- (void) onDeviceConnectionDidChange:(MTSCRADeviceType)deviceType connected:(BOOL)connected instance:(id)instance
{
    [self devConnStatusChange];
}

- (void) onDataReceived:(MTCardData *)cardDataObj instance:(id)instance {
    NSObject *data = @{
       @"sessionID": cardDataObj.encrypedSessionID,
       @"track1": @{
           @"masked": cardDataObj.maskedTrack1,
           @"encrypted": cardDataObj.encryptedTrack1
       },
       @"track2": @{
           @"masked": cardDataObj.maskedTrack2,
           @"encrypted": cardDataObj.encryptedTrack2
       },
       @"track3": @{
           @"masked": cardDataObj.maskedTrack3,
           @"encrypted": cardDataObj.encryptedTrack3
       },
       @"card": @{
           @"pan": cardDataObj.cardPAN,
           @"name": cardDataObj.cardName,
           @"last4": cardDataObj.cardLast4,
           @"expDate": cardDataObj.cardExpDate,
           @"expDate": cardDataObj.cardExpDate,
           @"expDateMonth": cardDataObj.cardExpDateMonth,
           @"expDateYear": cardDataObj.cardExpDateYear,
       },
       @"device": @{
           @"SN": cardDataObj.deviceSerialNumber,
           @"KSN": cardDataObj.deviceKSN,
           @"magnetPrint": cardDataObj.encryptedMagneprint,
           @"magnePrintStatus": cardDataObj.magneprintStatus,
       }
    };
    
    [self sendEventWithName:@"onDataReceived" body:data];
}

RCT_EXPORT_METHOD(connect:(RCTResponseSenderBlock)callback) {
    // Init MTSCRA lib
    if (self.lib == nil) {
        self.lib = [MTSCRA new];
        self.lib.delegate = self;
        
        [self.lib setDeviceType:MAGTEKIDYNAMO];
        [self.lib setDeviceProtocolString:@"com.magtek.idynamo"];

        // Init observers (for audio port)
        // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(devConnStatusChange) name:@"devConnectionNotification" object:nil];
    }

    // Set type
    // [self.lib setDeviceType:MAGTEKAUDIOREADER];
    
    // Open device
    if (!self.lib.isDeviceOpened) {
        [self.lib openDevice];
    }
    if (self.lib.getDeviceType == MAGTEKAUDIOREADER) {
        MPMusicPlayerController *musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
        musicPlayer.volume = 1.0f;
    }
    callback(@[@{@"isDeviceOpenend": @([self.lib isDeviceOpened]), @"isDeviceConnected": @([self.lib isDeviceConnected])}]);
}

@end
