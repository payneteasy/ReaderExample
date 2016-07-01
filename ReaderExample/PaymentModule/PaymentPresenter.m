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
#import <PNEReaderInfo.h>
#import <PNEProcessingEvent.h>
#import <PNEReaderManager.h>
#import <PNEProcessingContinuation.h>
#import <PNECard.h>
#import <PNEConfigurationContinuation.h>
#import "PaymentContract.h"
#import "PaymentParameters.h"
#import "PaymentPresenter.h"
#import "ReaderEventTextProducer.h"
#import "ProcessingEventTextProducer.h"
#import "ErrorEventTextProducer.h"

@interface PaymentPresenter () <PNEReaderPresenter>
@end

@implementation PaymentPresenter {
           id <PNEReaderManager>         _manager;
    __weak id <IPaymentView>             _view;
           ReaderEventTextProducer     * _readerEventTextProducer;
           ProcessingEventTextProducer * _processingEventTextProducer;
           ErrorEventTextProducer      * _errorEventTextProducer;
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
    PNEReaderInfo *reader = [PNEReaderInfo infoWithType:PNEReaderType_MIURA_OR_SPIRE];
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

    if(aEvent.state == PNEReaderState_NOT_CONNECTED) {
        [_view showError:text];
    } else {
        [_view showStatus:text];
    }
}

- (PNEProcessingContinuation *)onCard:(PNECard *)aCard {

    [_view showStatus:[NSString stringWithFormat:@"%@ %@ *** %@", aCard.scheme, aCard.panFirstDigits, aCard.panLastDigits]];

    return [PNEProcessingContinuation
            continuationWithBaseUrl: _payment.processingBaseUrl
                      merchantLogin: _payment.merchantLogin
                        merchantKey: _payment.merchantKey
                 merchantEndPointId: _payment.merchantEndPointId
                 orderInvoiceNumber:[[NSUUID UUID] UUIDString]
    ];
}

- (void)onCardError:(PNECardError *)aError {
    [_view showError:[_errorEventTextProducer textForError:aError]];
}

- (void)onProcessingEvent:(PNEProcessingEvent *)aEvent {
    NSString * text = [_processingEventTextProducer textFor:aEvent];
    [_view showStatus:text];
}

- (PNEConfigurationContinuation *)onConfiguration {
    return [[PNEConfigurationContinuation alloc]
            initWithBaseUrl:_payment.configurationBaseUrl
              merchantLogin:_payment.merchantLogin
                merchantKey:_payment.merchantKey
         merchantEndPointId:_payment.merchantEndPointId
               merchantName:_payment.merchantName
    ];
}


@end
