#import <Foundation/Foundation.h>

@class PaymentParameters;

@interface PaymentParametersBuilder : NSObject

+ (instancetype)paymentParameters;

+ (instancetype)paymentParametersFromExistingPaymentParameters:(PaymentParameters *)existingPaymentParameters;

- (PaymentParameters *)build;

- (instancetype)withConfigurationBaseUrl:(NSString *)configurationBaseUrl;

- (instancetype)withProcessingBaseUrl:(NSString *)processingBaseUrl;

- (instancetype)withMerchantLogin:(NSString *)merchantLogin;

- (instancetype)withMerchantKey:(NSString *)merchantKey;

- (instancetype)withMerchantEndPointId:(int64_t)merchantEndPointId;

- (instancetype)withMerchantName:(NSString *)merchantName;

- (instancetype)withAmount:(NSDecimalNumber *)amount;

- (instancetype)withCurrency:(NSString *)currency;

@end

