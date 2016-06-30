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
#import <PNEReaderInfo.h>
#import <PNEProcessingEvent.h>
#import <PNEReaderManager.h>
#import <PNEProcessingContinuation.h>
#import "PaymentPresenter.h"
#import "PaymentContract.h"
#import "ReaderEventTextProducer.h"
#import "ProcessingEventTextProducer.h"
#import "PNECard.h"

@interface PaymentPresenter () <PNEReaderPresenter>
@end

@implementation PaymentPresenter {
           id <PNEReaderManager>         _manager;
    __weak id <IPaymentView>             _view;
           ReaderEventTextProducer     * _readerEventTextProducer;
           ProcessingEventTextProducer * _processingEventTextProducer;
}

#pragma mark - IPaymentPresenter

- (instancetype)initWithView:(id<IPaymentView> )aView {
    self = [super init];
    if (self) {
        _view = aView;
        _readerEventTextProducer = [[ReaderEventTextProducer alloc] init];
        _processingEventTextProducer = [[ProcessingEventTextProducer alloc] init];
    }
    return self;
}


- (void)startPayment {
    PNEReaderFactory *factory = [[PNEReaderFactory alloc] init];
    PNEReaderInfo *reader = [PNEReaderInfo infoWithType:PNEReaderType_MIURA];
    _manager = [factory createManager:reader
                               amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]
                             currency:@"RUB"
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
            continuationWithBaseUrl: @"https://paynet-qa.clubber.me/paynet"
                      merchantLogin: @"paynet-demo"
                        merchantKey: @"5D0BB936-46BB-11E5-A54A-735A47388A3F"
                 merchantEndPointId: 1
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
