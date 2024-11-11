//
//  NeiryClientObjc.h
//  NeiryFramework
//
//  Created by Александр Асиненко on 10.09.2024.
//

#import <Foundation/Foundation.h>
#include <NeiryKit/NeiryDevice.h>
#import <NeiryKit/NeiryMEMSData.h>
#import <NeiryKit/NeiryEEGData.h>
#import <NeiryKit/NeiryPPGData.h>
#import <NeiryKit/NeiryChannel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NeiryClientObjcDelegate <NSObject>
- (void)onError:(int)error;
- (void)onErrorMessage:(NSString *)error;
- (void)onConnected:(NeiryDevice*) device channels:(NSArray<NeiryChannel*>*)channels;
- (void)onDisconnected;
- (void)onBattery:(int)level;
- (void)onLog:(NSString *)message;

- (void)onDevices:(NSArray<NeiryDevice*>*) devices;
- (void)onMEMSData:(NSArray<NeiryMEMSData*>*) samples;
- (void)onEEGData:(NSArray<NeiryEEGData*>*) samples;
- (void)onPPGData:(NSArray<NeiryPPGData*>*) samples;

@end

@interface NeiryClientObjc : NSObject

@property(nonatomic, weak) id<NeiryClientObjcDelegate> delegate;

+ (NSString *) getClientVersion;
- (void) createClientWithName:(NSString *)name address:(NSString *)address deviceType:(NeiryDeviceType)type;

- (NSString *) getErrorByNumber:(int)error;
-(void) connectTo:(NeiryDevice *) neiryDevice;
-(void) disconnect;

-(int) getBatteryLevel;
-(void) requestDevices;

@end

NS_ASSUME_NONNULL_END
