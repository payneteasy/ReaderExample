//
//  PaymentPresenter.h
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPaymentView;
@class PaymentParameters;

@interface PaymentPresenter : NSObject<IPaymentPresenter>

- (instancetype)initWithView:(id<IPaymentView> )aView parameters:(PaymentParameters *)aPayment;

@end
