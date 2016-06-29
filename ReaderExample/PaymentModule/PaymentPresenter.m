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
#import "PaymentPresenter.h"
#import "PaymentContract.h"
#import "ReaderEventTextProducer.h"

@interface PaymentPresenter () <PNEReaderPresenter>
@end

@implementation PaymentPresenter {
           id <PNEReaderManager>     _manager;
    __weak id <IPaymentView>         _view;
           ReaderEventTextProducer * _readerEventTextProducer;
}

#pragma mark - IPaymentPresenter

- (instancetype)initWithView:(id<IPaymentView> )aView {
    self = [super init];
    if (self) {
        _view = aView;
        _readerEventTextProducer = [[ReaderEventTextProducer alloc] init];
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
    return nil;
}

- (void)onCardError:(PNECardError *)aError {
    [_view showStatus:aError.description];
}

- (void)onProcessingEvent:(PNEProcessingEvent *)aEvent {
    [_view showStatus:aEvent.description];
}


@end
