//
//  SpireEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import "SpireEventTextProducer.h"

#import "SpireStatusReport49Event.h"

@implementation SpireEventTextProducer

- (NSString *)statusReport:(id)aMessage {

    if(![aMessage isKindOfClass:[SpireStatusReport49Event class]]) {
        return [NSString stringWithFormat:@"Unknown class: %@", aMessage];
    }

    SpireStatusReport49Event * status = aMessage;
    
    switch (status.status) {
        case SpireStatusType_CardEntryPrompted                : return NSLocalizedString(@"SpireStatusType_CardEntryPrompted", nil);
        case SpireStatusType_SmartcardInserted                : return NSLocalizedString(@"SpireStatusType_SmartcardInserted", nil);
        case SpireStatusType_SmartcardRemovePrompted          : return NSLocalizedString(@"SpireStatusType_SmartcardRemovePrompted", nil);
        case SpireStatusType_SmartcardRemoved                 : return NSLocalizedString(@"SpireStatusType_SmartcardRemoved", nil);
        case SpireStatusType_CardEntryBypassed                : return NSLocalizedString(@"SpireStatusType_CardEntryBypassed", nil);
        case SpireStatusType_CardEntryTimedOut                : return NSLocalizedString(@"SpireStatusType_CardEntryTimedOut", nil);
        case SpireStatusType_CardEntryAborted                 : return NSLocalizedString(@"SpireStatusType_CardEntryAborted", nil);
        case SpireStatusType_CardSwiped                       : return NSLocalizedString(@"SpireStatusType_CardSwiped", nil);
        case SpireStatusType_CardSwipeError                   : return NSLocalizedString(@"SpireStatusType_CardSwipeError", nil);
        case SpireStatusType_ContactlessCardTapped            : return NSLocalizedString(@"SpireStatusType_ContactlessCardTapped", nil);
        case SpireStatusType_ContactlessCardTapError          : return NSLocalizedString(@"SpireStatusType_ContactlessCardTapError", nil);
        case SpireStatusType_ApplicationSelectionStarted      : return NSLocalizedString(@"SpireStatusType_ApplicationSelectionStarted", nil);
        case SpireStatusType_ApplicationSelectionCompleted    : return NSLocalizedString(@"SpireStatusType_ApplicationSelectionCompleted", nil);
        case SpireStatusType_PinEntryStarted                  : return NSLocalizedString(@"SpireStatusType_PinEntryStarted", nil);
        case SpireStatusType_PinEntryCompleted                : return NSLocalizedString(@"SpireStatusType_PinEntryCompleted", nil);
        case SpireStatusType_PinEntryAborted                  : return NSLocalizedString(@"SpireStatusType_PinEntryAborted", nil);
        case SpireStatusType_PinEntryBypassed                 : return NSLocalizedString(@"SpireStatusType_PinEntryBypassed", nil);
        case SpireStatusType_PinEntryTimedOut                 : return NSLocalizedString(@"SpireStatusType_PinEntryTimedOut", nil);
        case SpireStatusType_LastPinEntry                     : return NSLocalizedString(@"SpireStatusType_LastPinEntry", nil);
        case SpireStatusType_AmountConfirmationStarted        : return NSLocalizedString(@"SpireStatusType_AmountConfirmationStarted", nil);
        case SpireStatusType_AmountConfirmationCompleted      : return NSLocalizedString(@"SpireStatusType_AmountConfirmationCompleted", nil);
        case SpireStatusType_AmountConfirmationAborted        : return NSLocalizedString(@"SpireStatusType_AmountConfirmationAborted", nil);
        case SpireStatusType_AmountConfirmationBypassed       : return NSLocalizedString(@"SpireStatusType_AmountConfirmationBypassed", nil);
        case SpireStatusType_AmountConfirmationTimedOut       : return NSLocalizedString(@"SpireStatusType_AmountConfirmationTimedOut", nil);
        case SpireStatusType_DCCSelectionStarted              : return NSLocalizedString(@"SpireStatusType_DCCSelectionStarted", nil);
        case SpireStatusType_DCCCardholderCurrencySelected    : return NSLocalizedString(@"SpireStatusType_DCCCardholderCurrencySelected", nil);
        case SpireStatusType_DCCCardholderCurrencyNotSelected : return NSLocalizedString(@"SpireStatusType_DCCCardholderCurrencyNotSelected", nil);
        case SpireStatusType_DCCSelectionTimedOut             : return NSLocalizedString(@"SpireStatusType_DCCSelectionTimedOut", nil);
        case SpireStatusType_GratuityEntryStarted             : return NSLocalizedString(@"SpireStatusType_GratuityEntryStarted", nil);
        case SpireStatusType_GratuityEntered                  : return NSLocalizedString(@"SpireStatusType_GratuityEntered", nil);
        case SpireStatusType_GratuityNotEntered               : return NSLocalizedString(@"SpireStatusType_GratuityNotEntered", nil);
        case SpireStatusType_GratuityEntryTimedOut            : return NSLocalizedString(@"SpireStatusType_GratuityEntryTimedOut", nil);

        default:
            return NSLocalizedString(@"SpireStatusType_Unknown", nil);
    }
}
@end
