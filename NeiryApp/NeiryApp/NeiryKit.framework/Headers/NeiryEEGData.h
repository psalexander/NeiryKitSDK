//
//  EEGData.h
//  NeiryKit
//
//  Created by Александр on 22.10.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NeiryEEGData : NSObject

@property(nonatomic) uint64_t timepoint;
@property(nonatomic, strong) NSArray<NSNumber *>* data;

@end

NS_ASSUME_NONNULL_END
