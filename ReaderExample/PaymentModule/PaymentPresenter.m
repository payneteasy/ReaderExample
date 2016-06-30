//
//  PaymentPresenter.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PNEReaderPresenter.h>
#import <PNEReaderFactory.h>
#import <PNEReaderEvent.h>
#import <PNECardError.h>
#import "PaymentContract.h"
#import "PaymentParameters.h"
#import <PNEReaderInfo.h>
#import <PNEProcessingEvent.h>
#import <PNEReaderManager.h>
#import <PNEProcessingContinuation.h>
#import "PaymentPresenter.h"
#import "PaymentContract.h"
#import "ReaderEventTextProducer.h"
#import "ProcessingEventTextProducer.h"
#import "PNECard.h"
#import "PaymentParameters.h"

@interface PaymentPresenter () <PNEReaderPresenter>
@end

@implementation PaymentPresenter {
           id <PNEReaderManager>         _manager;
    __weak id <IPaymentView>             _view;
           ReaderEventTextProducer     * _readerEventTextProducer;
           ProcessingEventTextProducer * _processingEventTextProducer;
           PaymentParameters           * _payment;
}

#pragma mark - IPaymentPresenter

- (instancetype)initWithView:(id<IPaymentView> )aView parameters:(PaymentParameters *)aPayment{
    self = [super init];
    if (self) {
        _view = aView;
        _readerEventTextProducer = [[ReaderEventTextProducer alloc] init];
        _processingEventTextProducer = [[ProcessingEventTextProducer alloc] init];
        _payment = aPayment;
    }
    return self;
}


- (void)startPayment {
    PNEReaderFactory *factory = [[PNEReaderFactory alloc] init];
    PNEReaderInfo *reader = [PNEReaderInfo infoWithType:PNEReaderType_MIURA];
    _manager = [factory createManager:reader
                               amount:_payment.amount
                             currency:_payment.currency
                            presenter:self];
    [_manager start];
}

- (void)stopPayment {
    [_manager stop];
}

#pragma mark - PNEReaderPresenter

- (void)stateChanged:(PNEReaderEvent *)aEvent {
    NSString *text = [_readerEventTextProducer textFor:aEvent];
    [_view showStatus:text];
}

- (PNEProcessingContinuation *)onCard:(PNECard *)aCard {

    [_view showStatus:[NSString stringWithFormat:@"%@ %@ *** %@", aCard.scheme, aCard.panFirstDigits, aCard.panLastDigits]];

    return [PNEProcessingContinuation
            continuationWithBaseUrl: _payment.baseUrl
                      merchantLogin: _payment.merchantLogin
                        merchantKey: _payment.merchantKey
                 merchantEndPointId: _payment.merchantEndPointId
                 orderInvoiceNumber:[[NSUUID UUID] UUIDString]
    ];
}

- (void)onCardError:(PNECardError *)aError {
    [_view showStatus:aError.description];
}

- (void)onProcessingEvent:(PNEProcessingEvent *)aEvent {
    NSString * text = [_processingEventTextProducer textFor:aEvent];
    [_view showStatus:text];
}


@end
