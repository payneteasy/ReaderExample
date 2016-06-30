#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "PaymentParameters.h"
#import "PaymentParametersBuilder.h"

@implementation PaymentParametersBuilder
{
  NSString *_baseUrl;
  NSString *_merchantLogin;
  NSString *_merchantKey;
  int64_t _merchantEndPointId;
  NSString *_merchantName;
  NSDecimalNumber *_amount;
  NSString *_currency;
}

+ (instancetype)paymentParameters
{
  return [[PaymentParametersBuilder alloc] init];
}

+ (instancetype)paymentParametersFromExistingPaymentParameters:(PaymentParameters *)existingPaymentParameters
{
  return [[[[[[[[PaymentParametersBuilder paymentParameters]
                withBaseUrl:existingPaymentParameters.baseUrl]
               withMerchantLogin:existingPaymentParameters.merchantLogin]
              withMerchantKey:existingPaymentParameters.merchantKey]
             withMerchantEndPointId:existingPaymentParameters.merchantEndPointId]
            withMerchantName:existingPaymentParameters.merchantName]
           withAmount:existingPaymentParameters.amount]
          withCurrency:existingPaymentParameters.currency];
}

- (PaymentParameters *)build
{
  return [[PaymentParameters alloc] initWithBaseUrl:_baseUrl merchantLogin:_merchantLogin merchantKey:_merchantKey merchantEndPointId:_merchantEndPointId merchantName:_merchantName amount:_amount currency:_currency];
}

- (instancetype)withBaseUrl:(NSString *)baseUrl
{
  _baseUrl = [baseUrl copy];
  return self;
}

- (instancetype)withMerchantLogin:(NSString *)merchantLogin
{
  _merchantLogin = [merchantLogin copy];
  return self;
}

- (instancetype)withMerchantKey:(NSString *)merchantKey
{
  _merchantKey = [merchantKey copy];
  return self;
}

- (instancetype)withMerchantEndPointId:(int64_t)merchantEndPointId
{
  _merchantEndPointId = merchantEndPointId;
  return self;
}

- (instancetype)withMerchantName:(NSString *)merchantName
{
  _merchantName = [merchantName copy];
  return self;
}

- (instancetype)withAmount:(NSDecimalNumber *)amount
{
  _amount = [amount copy];
  return self;
}

- (instancetype)withCurrency:(NSString *)currency
{
  _currency = [currency copy];
  return self;
}

@end

