//
//  ReaderEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PaynetEasyReader/PNEReaderEvent.h>
#import "ReaderEventTextProducer.h"
#import "MiuraEventTextProducer.h"
#import "SpireEventTextProducer.h"


@implementation ReaderEventTextProducer {
    MiuraEventTextProducer * _miura;
    SpireEventTextProducer * _spire;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _miura = [[MiuraEventTextProducer alloc] init];
        _spire = [[SpireEventTextProducer alloc] init];
    }

    return self;
}

- (NSString *) textFor:(PNEReaderEvent *)aEvent {
    switch (aEvent.state) {
        case PNEReaderState_STARTED:
            return NSLocalizedString(@"PNEReaderState_STARTED", nil);

        case PNEReaderState_CONNECTING:
            return NSLocalizedString(@"PNEReaderState_CONNECTING", nil);

        case PNEReaderState_CONNECTED:
            return NSLocalizedString(@"PNEReaderState_CONNECTED", nil);

        case PNEReaderState_NOT_CONNECTED:
            return NSLocalizedString(@"PNEReaderState_NOT_CONNECTED", nil);

        case PNEReaderState_MIURA_DEVICE_INFO:
            return [_miura deviceInfo:aEvent.message];

        case PNEReaderState_MIURA_CARD_STATUS:
            return [_miura miuraCardStatus:aEvent.message];

        case PNEReaderState_MIURA_DEVICE_STATUS_CHANGE:
            return [_miura miuraDeviceStatus:aEvent.message];

        case PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE:
            return [_miura battery:aEvent.message];

        case PNEReaderState_CONFIGURATION_DOWNLOADING:
            return NSLocalizedString(@"PNEReaderState_CONFIGURATION_DOWNLOADING", nil);

        case PNEReaderState_CONFIGURATION_UPLOADING:
            return NSLocalizedString(@"PNEReaderState_CONFIGURATION_UPLOADING", nil);

        case PNEReaderState_CONFIGURATION_COMPLETE:
            return NSLocalizedString(@"PNEReaderState_CONFIGURATION_COMPLETE", nil);

        case PNEReaderState_SENDING_SALE:
            return NSLocalizedString(@"PNEReaderState_SENDING_SALE", nil);

        case PNEReaderState_SENDING_EMF_FINAL_ADVICE:
            return NSLocalizedString(@"PNEReaderState_SENDING_EMF_FINAL_ADVICE", nil);

        case PNEReaderState_SPIRE_COMPLETE_TRANSACTION:
            return NSLocalizedString(@"PNEReaderState_SPIRE_COMPLETE_TRANSACTION", nil);

        case PNEReaderState_SPIRE_GET_AMOUNT:
            return NSLocalizedString(@"PNEReaderState_SPIRE_GET_AMOUNT", nil);

        case PNEReaderState_SPIRE_GET_SWIPED_DATA:
            return NSLocalizedString(@"PNEReaderState_SPIRE_GET_SWIPED_DATA", nil);

        case PNEReaderState_SPIRE_GET_TRANSACTION_DATA:
            return NSLocalizedString(@"PNEReaderState_SPIRE_GET_TRANSACTION_DATA", nil);

        case PNEReaderState_SPIRE_GO_ONLINE:
            return NSLocalizedString(@"PNEReaderState_SPIRE_GO_ONLINE", nil);

        case PNEReaderState_SPIRE_PROCESS_SWIPED_DATA:
            return NSLocalizedString(@"PNEReaderState_SPIRE_PROCESS_SWIPED_DATA", nil);

        case PNEReaderState_SPIRE_TERMINATE_TRANSACTION:
            return NSLocalizedString(@"PNEReaderState_SPIRE_TERMINATE_TRANSACTION", nil);

        case PNEReaderState_SPIRE_INIT_TRANSACTION:
            return NSLocalizedString(@"PNEReaderState_SPIRE_INIT_TRANSACTION", nil);

        case PNEReaderState_SPIRE_STATUS_REPORT:
            return [_spire statusReport:aEvent.message];

        default:
            return aEvent.description;
    }
    return nil;
}


@end
