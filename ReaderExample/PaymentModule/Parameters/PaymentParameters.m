/**
 * This file is generated using the remodel generation script.
 * The name of the input file is PaymentParameters.value
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "PaymentParameters.h"

@implementation PaymentParameters

- (instancetype)initWithConfigurationBaseUrl:(NSString *)configurationBaseUrl processingBaseUrl:(NSString *)processingBaseUrl merchantLogin:(NSString *)merchantLogin merchantKey:(NSString *)merchantKey merchantEndPointId:(int64_t)merchantEndPointId merchantName:(NSString *)merchantName amount:(NSDecimalNumber *)amount currency:(NSString *)currency
{
  if ((self = [super init])) {
    _configurationBaseUrl = [configurationBaseUrl copy];
    _processingBaseUrl = [processingBaseUrl copy];
    _merchantLogin = [merchantLogin copy];
    _merchantKey = [merchantKey copy];
    _merchantEndPointId = merchantEndPointId;
    _merchantName = [merchantName copy];
    _amount = [amount copy];
    _currency = [currency copy];
  }

  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t configurationBaseUrl: %@; \n\t processingBaseUrl: %@; \n\t merchantLogin: %@; \n\t merchantKey: %@; \n\t merchantEndPointId: %lld; \n\t merchantName: %@; \n\t amount: %@; \n\t currency: %@; \n", [super description], _configurationBaseUrl, _processingBaseUrl, _merchantLogin, _merchantKey, _merchantEndPointId, _merchantName, _amount, _currency];
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_configurationBaseUrl hash], [_processingBaseUrl hash], [_merchantLogin hash], [_merchantKey hash], ABS(_merchantEndPointId), [_merchantName hash], [_amount hash], [_currency hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 8; ++ii) {
    unsigned long long base = (((unsigned long long)result) << 32 | subhashes[ii]);
    base = (~base) + (base << 18);
    base ^= (base >> 31);
    base *=  21;
    base ^= (base >> 11);
    base += (base << 6);
    base ^= (base >> 22);
    result = base;
  }
  return result;
}

- (BOOL)isEqual:(PaymentParameters *)object
{
  if (self == object) {
    return YES;
  } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    _merchantEndPointId == object->_merchantEndPointId &&
    (_configurationBaseUrl == object->_configurationBaseUrl ? YES : [_configurationBaseUrl isEqual:object->_configurationBaseUrl]) &&
    (_processingBaseUrl == object->_processingBaseUrl ? YES : [_processingBaseUrl isEqual:object->_processingBaseUrl]) &&
    (_merchantLogin == object->_merchantLogin ? YES : [_merchantLogin isEqual:object->_merchantLogin]) &&
    (_merchantKey == object->_merchantKey ? YES : [_merchantKey isEqual:object->_merchantKey]) &&
    (_merchantName == object->_merchantName ? YES : [_merchantName isEqual:object->_merchantName]) &&
    (_amount == object->_amount ? YES : [_amount isEqual:object->_amount]) &&
    (_currency == object->_currency ? YES : [_currency isEqual:object->_currency]);
}

@end

