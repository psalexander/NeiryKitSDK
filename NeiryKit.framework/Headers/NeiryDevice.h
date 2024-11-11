//
//  NeiryDevice.h
//  NeiryKit
//
//  Created by Александр on 22.10.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum NeiryDeviceType: NSUInteger {
    TYPE_HEADBAND,
    TYPE_HEADPHONES,
    TYPE_BUDS,
    TYPE_IMPULSE,
    TYPE_ANY,
    TYPE_SINWAVE,
    TYPE_NOISE,
    TYPE_LSL,
    TYPE_FILE
} NeiryDeviceType;

typedef enum NeiryDeviceMode: NSUInteger {
    MODE_RESISTANCE,
    MODE_IDLE,
    MODE_POWERDOWN,
    MODE_SIGNAL,
    MODE_STARTMEMS,
    MODE_STOPMEMS,
    MODE_STARTPPG,
    MODE_STOPPPG,
    MODE_SIGNALANDRESIST
} NeiryDeviceMode;

@interface NeiryDevice : NSObject

@property(nonatomic, strong) NSString* deviceID;
@property(nonatomic, strong) NSString* deviceDescription;
@property(nonatomic, strong) NSString* deviceName;
@property(nonatomic) NeiryDeviceType deviceType;
@property(nonatomic) int index;


// для подключенного устройства
@property(nonatomic, strong) NSString* firmwareVersion;
@property(nonatomic) NeiryDeviceMode deviceMode;


@end

NS_ASSUME_NONNULL_END

//public func getName() -> String {
//    switch self {
//    case .headband: return "Neiry Band"
//    case .headphones : return "Neiry Headphones"
//    case .buds : return "Neiry Buds"
//    case .impulse : return "Neiry Impulse"
//    case .any : return "Neiry Any"
//    case .sinwave : return "DevOnly SinWave"
//    case .noise : return "DevOnly Noise"
//    case .lsl : return "DevOnly LSL"
//    case .file : return "DevOnly File"
//    case .undefined : return "Undefined type"
//    default : return "Undefined type"
//    }
//}
