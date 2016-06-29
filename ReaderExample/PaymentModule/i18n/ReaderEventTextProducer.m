//
//  ReaderEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PaynetEasyReader/PNEReaderEvent.h>
#import "ReaderEventTextProducer.h"

@implementation ReaderEventTextProducer

- (NSString *) textFor:(PNEReaderEvent *)aEvent {
    switch (aEvent.state) {
        case PNEReaderState_STARTED                        : return NSLocalizedString(@"PNEReaderState_STARTED", nil);
        case PNEReaderState_CONNECTING                     : return NSLocalizedString(@"PNEReaderState_CONNECTING", nil);
        case PNEReaderState_CONNECTED                      : return NSLocalizedString(@"PNEReaderState_CONNECTED", nil);
        case PNEReaderState_NOT_CONNECTED                  : return NSLocalizedString(@"PNEReaderState_NOT_CONNECTED", nil);
        case PNEReaderState_MIURA_DEVICE_INFO              : return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO", nil);
        case PNEReaderState_MIURA_CARD_STATUS              : return NSLocalizedString(@"PNEReaderState_MIURA_CARD_STATUS", nil);
        case PNEReaderState_MIURA_DEVICE_STATUS_CHANGE     : return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_STATUS_CHANGE", nil);
        case PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE  : return NSLocalizedString(@"PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE", nil);

        default:
            return aEvent.description;
    }
    return nil;
}

@end
