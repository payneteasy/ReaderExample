//
//  ReaderEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PaynetEasyReader/PNEReaderEvent.h>
#import "ReaderEventTextProducer.h"
#import "MiuraCardStatusMessage.h"
#import "MiuraDeviceStatusMessage.h"
#import "MiuraBatteryStatusResponse.h"

#define NSLocalizedFormatString(fmt, ...) [NSString stringWithFormat:NSLocalizedString(fmt, nil), __VA_ARGS__]

@implementation ReaderEventTextProducer

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
            return [self deviceInfo:aEvent.message];

        case PNEReaderState_MIURA_CARD_STATUS:
            return [self miuraCardStatus:aEvent.message];

        case PNEReaderState_MIURA_DEVICE_STATUS_CHANGE:
            return [self miuraDeviceStatus:aEvent.message];

        case PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE:
            return [self battery:aEvent.message];

        default:
            return aEvent.description;
    }
    return nil;
}

- (NSString *)deviceInfo:(id)aMessage {
    // todo fixed in 0.1.16
    return @"--";
}

- (NSString *)battery:(id)aMessage {
    if(![aMessage isKindOfClass:[MiuraBatteryStatusResponse class]]) {
        return [NSString stringWithFormat:@"Unknown class: %@", aMessage];
    }

    MiuraBatteryStatusResponse * battery = aMessage;

    NSString * status;
    switch (battery.batteryStatus) {
        case MiuraBatteryStatusType_CHARGING:
            status = NSLocalizedString(@"MiuraBatteryStatusType_CHARGING", nil);
            break;

        case MiuraBatteryStatusType_FULLY_CHARGED:
            status = NSLocalizedString(@"MiuraBatteryStatusType_FULLY_CHARGED", nil);
            break;

        case MiuraBatteryStatusType_NOT_CHARGING:
            status = NSLocalizedString(@"MiuraBatteryStatusType_NOT_CHARGING", nil);
            break;

        default:
            status = NSLocalizedString(@"MiuraBatteryStatusType_UNKNOWN", nil);
            break;
    }

    return NSLocalizedFormatString(@"PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE"
      , status, @(battery.batteryPercentage)
    );
}

- (NSString *)miuraDeviceStatus:(id)aMessage {
    if(![aMessage isKindOfClass:[MiuraDeviceStatusMessage class]]) {
        return [NSString stringWithFormat:@"Unknown class: %@", aMessage];
    }

    MiuraDeviceStatusMessage * device = aMessage;
    if(device.type == MiuraDeviceStatusType_PIN_ENTRY_EVENT) {
        switch (device.pinEntryStatus) {
            case MiuraPinEntryStatus_INCORRECT_PIN:         return NSLocalizedString(@"MiuraPinEntryStatus_INCORRECT_PIN", nil);
            case MiuraPinEntryStatus_LAST_POSSIBLE_ATTEMPT: return NSLocalizedString(@"MiuraPinEntryStatus_LAST_POSSIBLE_ATTEMPT", nil);
            case MiuraPinEntryStatus_PIN_ENTRY_COMPLETED:   return NSLocalizedString(@"MiuraPinEntryStatus_PIN_ENTRY_COMPLETED", nil);
            case MiuraPinEntryStatus_PIN_ENTRY_ERROR:       return NSLocalizedString(@"MiuraPinEntryStatus_PIN_ENTRY_ERROR", nil);
            case MiuraPinEntryStatus_PIN_OK:                return NSLocalizedString(@"MiuraPinEntryStatus_PIN_OK", nil);

            default:
                return NSLocalizedString(@"MiuraPinEntryStatus_UNKNOWN", nil);
        }
    }

    if(device.type == MiuraDeviceStatusType_APPLICATION_SELECTION) {
        return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO__APPLICATION_SELECTION", nil);
    }

    if(device.type == MiuraDeviceStatusType_DEVICE_POWERING_OFF) {
        return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO__DEVICE_POWERING_OFF", nil);
    }

    if(device.type == MiuraDeviceStatusType_MPI_RESTARTING) {
        return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO__MPI_RESTARTING", nil);
    }

    if(device.type == MiuraDeviceStatusType_DEVICE_POWER_ON) {
        return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO__MPI_RESTARTING", nil);
    }

    return NSLocalizedString(@"PNEReaderState_MIURA_DEVICE_INFO__PROCESSING", nil);
}

- (NSString *)miuraCardStatus:(id)aMessage {
    if(![aMessage isKindOfClass:[MiuraCardStatusMessage class]]) {
        return [NSString stringWithFormat:@"Unknown class: %@", aMessage];
    }

    MiuraCardStatusMessage * miuraMessage = aMessage;

    if( miuraMessage.isCardPresent ) {
        return NSLocalizedString(@"PNEReaderState_MIURA_CARD_STATUS__READING_CARD", nil );
    }

    return NSLocalizedString(@"PNEReaderState_MIURA_CARD_STATUS__INSERT_CARD", nil);
}

@end
