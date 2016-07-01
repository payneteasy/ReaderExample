//
//  ErrorEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 01/07/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PaynetEasyReader/PNECardError.h>
#import "ErrorEventTextProducer.h"

@implementation ErrorEventTextProducer

-(NSString *) textForError:(PNECardError *)aError {
    switch (aError.type) {
        case PNECardErrorType_PARSE_PACKET_ERROR                                   : return NSLocalizedString(@"PNECardErrorType_PARSE_PACKET_ERROR", nil);

        case PNECardErrorType_PARSE_TRACK_ERROR                                    : return NSLocalizedString(@"PNECardErrorType_PARSE_TRACK_ERROR", nil);

        case PNECardErrorType_EMPTY_CARD_INFO                                      : return NSLocalizedString(@"PNECardErrorType_EMPTY_CARD_INFO", nil);

        case PNECardErrorType_UNKNOWN_CARD_TYPE                                    : return NSLocalizedString(@"PNECardErrorType_UNKNOWN_CARD_TYPE", nil);

        case PNECardErrorType_CARD_NOT_VALID                                       : return NSLocalizedString(@"PNECardErrorType_CARD_NOT_VALID", nil);

        case PNECardErrorType_SKIP                                                 : return NSLocalizedString(@"PNECardErrorType_SKIP", nil);

        case PNECardErrorType_BAD_PACKET_LRC                                       : return NSLocalizedString(@"PNECardErrorType_BAD_PACKET_LRC", nil);

        case PNECardErrorType_ERROR_DOWNLOADING_CONFIGURATION                      : return NSLocalizedString(@"PNECardErrorType_ERROR_DOWNLOADING_CONFIGURATION", nil);

        case PNECardErrorType_NO_CONFIGURATION_CONTINUATION                        : return NSLocalizedString(@"PNECardErrorType_NO_CONFIGURATION_CONTINUATION", nil);

        case PNECardErrorType_NOT_SRED_READY                                       : return NSLocalizedString(@"PNECardErrorType_NOT_SRED_READY", nil);

        case PNECardErrorType_INVALID_DATA_IN_COMMAND_APDU                         : return NSLocalizedString(@"PNECardErrorType_INVALID_DATA_IN_COMMAND_APDU", nil);

        case PNECardErrorType_TERMINAL_NOT_READY                                   : return NSLocalizedString(@"PNECardErrorType_TERMINAL_NOT_READY", nil);

        case PNECardErrorType_NO_SMART_CARD_IN_SLOT                                : return NSLocalizedString(@"PNECardErrorType_NO_SMART_CARD_IN_SLOT", nil);

        case PNECardErrorType_INVALID_CARD                                         : return NSLocalizedString(@"PNECardErrorType_INVALID_CARD", nil);

        case PNECardErrorType_TRANSACTION_ALREADY_IN_PROGRESS                      : return NSLocalizedString(@"PNECardErrorType_TRANSACTION_ALREADY_IN_PROGRESS", nil);

        case PNECardErrorType_DATA_MISSING_FROM_COMMAND_APDU                       : return NSLocalizedString(@"PNECardErrorType_DATA_MISSING_FROM_COMMAND_APDU", nil);

        case PNECardErrorType_UNSUPPORTED_CARD                                     : return NSLocalizedString(@"PNECardErrorType_UNSUPPORTED_CARD", nil);

        case PNECardErrorType_MISSING_FILE                                         : return NSLocalizedString(@"PNECardErrorType_MISSING_FILE", nil);

        case PNECardErrorType_ICC_READ_ERROR                                       : return NSLocalizedString(@"PNECardErrorType_ICC_READ_ERROR", nil);

        case PNECardErrorType_INVALID_ISSUER_PUBLIC_KEY                            : return NSLocalizedString(@"PNECardErrorType_INVALID_ISSUER_PUBLIC_KEY", nil);

        case PNECardErrorType_USER_CANCELLED                                       : return NSLocalizedString(@"PNECardErrorType_USER_CANCELLED", nil);

        case PNECardErrorType_TRANSACTION_TIMED_OUT                                : return NSLocalizedString(@"PNECardErrorType_TRANSACTION_TIMED_OUT", nil);

        case PNECardErrorType_TRANSACTION_ABORTED_BY_INSERTED                      : return NSLocalizedString(@"PNECardErrorType_TRANSACTION_ABORTED_BY_INSERTED", nil);

        case PNECardErrorType_TRANSACTION_ABORTED_BY_SWIPED                        : return NSLocalizedString(@"PNECardErrorType_TRANSACTION_ABORTED_BY_SWIPED", nil);

        case PNECardErrorType_NO_APPLICATIONS                                      : return NSLocalizedString(@"PNECardErrorType_NO_APPLICATIONS", nil);

        case PNECardErrorType_TRANSACTION_NOT_POSSIBLE                             : return NSLocalizedString(@"PNECardErrorType_TRANSACTION_NOT_POSSIBLE", nil);

        case PNECardErrorType_USE_ICC                                              : return NSLocalizedString(@"PNECardErrorType_USE_ICC", nil);

        case PNECardErrorType_HARDWARE_ERROR                                       : return NSLocalizedString(@"PNECardErrorType_HARDWARE_ERROR", nil);

        case PNECardErrorType_SPIRE_GENERAL_FAILURE                                : return NSLocalizedString(@"PNECardErrorType_SPIRE_GENERAL_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_APPLICATION_SELECTION_FAILURE             : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_APPLICATION_SELECTION_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_INITIATE_APPLICATION_PROCESSING_FAILURE   : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_INITIATE_APPLICATION_PROCESSING_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_READ_APPLICATION_DATA_FAILURE             : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_READ_APPLICATION_DATA_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_OFFLINE_DATA_AUTHENTICATION_FAILURE       : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_OFFLINE_DATA_AUTHENTICATION_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_PROCESS_RESTRICTIONS_FAILURE              : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_PROCESS_RESTRICTIONS_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_TERMINAL_RISK_MANAGEMENT_FAILURE          : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_TERMINAL_RISK_MANAGEMENT_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_CARDHOLDER_VERIFICATION_METHOD_FAILURE    : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_CARDHOLDER_VERIFICATION_METHOD_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_TERMINAL_ACTION_ANALYSIS_FAILURE          : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_TERMINAL_ACTION_ANALYSIS_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_CARD_ACTION_ANALYSIS_FAILURE              : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_CARD_ACTION_ANALYSIS_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_COMPLETION_FAILURE                        : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_COMPLETION_FAILURE", nil);

        case PNECardErrorType_SPIRE_EPOS_TRANSACTION_TERMINATED                    : return NSLocalizedString(@"PNECardErrorType_SPIRE_EPOS_TRANSACTION_TERMINATED", nil);

        case PNECardErrorType_SPIRE_CHIP_NO_ANSWER_TO_RESET                        : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_NO_ANSWER_TO_RESET", nil);

        case PNECardErrorType_SPIRE_SWIPE_READ_FAILURE                             : return NSLocalizedString(@"PNECardErrorType_SPIRE_SWIPE_READ_FAILURE", nil);

        case PNECardErrorType_SPIRE_CHIP_CARD_REMOVED                              : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_CARD_REMOVED", nil);

        case PNECardErrorType_SPIRE_MPOS_USER_CANCELLED                            : return NSLocalizedString(@"PNECardErrorType_SPIRE_MPOS_USER_CANCELLED", nil);

        case PNECardErrorType_SPIRE_CHIP_NO_SUPPORTED_APPLICATIONS                 : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_NO_SUPPORTED_APPLICATIONS", nil);

        case PNECardErrorType_SPIRE_CHIP_CARD_BLOCKED                              : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_CARD_BLOCKED", nil);

        case PNECardErrorType_SPIRE_CHIP_READ_FAILURE                              : return NSLocalizedString(@"PNECardErrorType_SPIRE_CHIP_READ_FAILURE", nil);

        case PNECardErrorType_SPIRE_MPOS_USER_TIME_OUT                             : return NSLocalizedString(@"PNECardErrorType_SPIRE_MPOS_USER_TIME_OUT", nil);

        case PNECardErrorType_SPIRE_MPOS_DUKPT_KEY_FAILURE                         : return NSLocalizedString(@"PNECardErrorType_SPIRE_MPOS_DUKPT_KEY_FAILURE", nil);

        case PNECardErrorType_SPIRE_MPOS_MK_SK_KEY_FAILURE                         : return NSLocalizedString(@"PNECardErrorType_SPIRE_MPOS_MK_SK_KEY_FAILURE", nil);

        case PNECardErrorType_SPIRE_CONTACTLESS_NOT_ALLOWED                        : return NSLocalizedString(@"PNECardErrorType_SPIRE_CONTACTLESS_NOT_ALLOWED", nil);

        case PNECardErrorType_SPIRE_CONTACTLESS_ABORTED                            : return NSLocalizedString(@"PNECardErrorType_SPIRE_CONTACTLESS_ABORTED", nil);

        default:
            return aError.errorMessage;
    }


}
@end
