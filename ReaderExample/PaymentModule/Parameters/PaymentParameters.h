/**
 * This file is generated using the remodel generation script.
 * The name of the input file is PaymentParameters.value
 */

#import <Foundation/Foundation.h>

@interface PaymentParameters : NSObject <NSCopying>

/**
 * reader configuration service base url. For example: https://gate.payneteasy.com/paynet
 */
@property (nonatomic, readonly, copy) NSString *baseUrl;
/**
 * merchant login
 */
@property (nonatomic, readonly, copy) NSString *merchantLogin;
/**
 * merchant control key
 */
@property (nonatomic, readonly, copy) NSString *merchantKey;
/**
 * end point id
 */
@property (nonatomic, readonly) int64_t merchantEndPointId;
/**
 * merchant name, some readers can display it on its display
 */
@property (nonatomic, readonly, copy) NSString *merchantName;
@property (nonatomic, readonly, copy) NSDecimalNumber *amount;
@property (nonatomic, readonly, copy) NSString *currency;

- (instancetype)initWithBaseUrl:(NSString *)baseUrl merchantLogin:(NSString *)merchantLogin merchantKey:(NSString *)merchantKey merchantEndPointId:(int64_t)merchantEndPointId merchantName:(NSString *)merchantName amount:(NSDecimalNumber *)amount currency:(NSString *)currency;

@end

