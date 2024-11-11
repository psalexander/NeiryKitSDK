//
//  MEMSData.h
//  NeiryKit
//
//  Created by Александр on 22.10.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NeiryMEMSData : NSObject

@property(nonatomic) float x;
@property(nonatomic) float y;
@property(nonatomic) float z;
@property(nonatomic) float gyroX;
@property(nonatomic) float gyroY;
@property(nonatomic) float gyroZ;
@property(nonatomic) uint64_t timepoint;

@end

NS_ASSUME_NONNULL_END
