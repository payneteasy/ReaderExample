//
//  ProcessingEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import "ProcessingEventTextProducer.h"
#import <PaynetStatusResponse.h>
#import <PNEProcessingEvent.h>

@implementation ProcessingEventTextProducer

- (NSString *)textFor:(PNEProcessingEvent *)aEvent {

    switch (aEvent.type) {
        case PNEProcessingEventType_EXCEPTION               : return NSLocalizedString(@"PNEProcessingEventType_EXCEPTION", nil);
        case PNEProcessingEventType_ADVICE_REQUIRED         : return NSLocalizedString(@"PNEProcessingEventType_ADVICE_REQUIRED", nil);
        case PNEProcessingEventType_ADVICE_RESPONSE_WAITING : return NSLocalizedString(@"PNEProcessingEventType_ADVICE_RESPONSE_WAITING", nil);
        case PNEProcessingEventType_ADVICE_SENDING          : return NSLocalizedString(@"PNEProcessingEventType_ADVICE_SENDING", nil);
        case PNEProcessingEventType_ERROR_3D_SECURE         : return NSLocalizedString(@"PNEProcessingEventType_ERROR_3D_SECURE", nil);
        case PNEProcessingEventType_SALE_SENDING            : return NSLocalizedString(@"PNEProcessingEventType_SALE_SENDING", nil);
        case PNEProcessingEventType_SALE_RESPONSE_WAITING   : return NSLocalizedString(@"PNEProcessingEventType_SALE_RESPONSE_WAITING", nil);
        case PNEProcessingEventType_RESULT                  : return [self result:aEvent.result];

        default:
            return NSLocalizedString(@"PNEProcessingEventType_UNKNOWN", nil);
    }

    return nil;
}

- (NSString *)result:(PaynetStatusResponse *)aResponse {
    switch (aResponse.status) {
        case PaynetStatusTypeApproved:
            return NSLocalizedString(@"PaynetStatusTypeApproved", nil);

        case PaynetStatusTypeDeclined:
            return NSLocalizedString(@"PaynetStatusTypeDeclined", nil);

        case PaynetStatusTypeError:
            return NSLocalizedString(@"PaynetStatusTypeError", nil);

        case PaynetStatusTypeFiltered:
            return NSLocalizedString(@"PaynetStatusTypeFiltered", nil);

        case PaynetStatusTypeProcessing:
            return NSLocalizedString(@"PaynetStatusTypeProcessing", nil);

        default:
            return NSLocalizedString(@"PaynetStatusTypeUnknown", nil);

    }
    return nil;
}
@end
