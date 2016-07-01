//
//  MiuraEventTextProducer.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <PaynetEasyReader/MiuraCardStatusMessage.h>
#import <PaynetEasyReader/MiuraDeviceStatusMessage.h>
#import <PaynetEasyReader/MiuraBatteryStatusResponse.h>
#import <PaynetEasyReader/MiuraResetDeviceResponse.h>
#import "MiuraEventTextProducer.h"

#define NSLocalizedFormatString(fmt, ...) [NSString stringWithFormat:NSLocalizedString(fmt, nil), __VA_ARGS__]

@implementation MiuraEventTextProducer

- (NSString *)deviceInfo:(id)aMessage {
    if(![aMessage isKindOfClass:[MiuraResetDeviceResponse class]]) {
        return [NSString stringWithFormat:@"Unknown class: %@", aMessage];
    }

    MiuraResetDeviceResponse * info = aMessage;
    return NSLocalizedFormatString(@"PNEReaderState_MIURA_DEVICE_INFO", info.deviceSerialNumber);
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
            status = NSLocalizedFormatString(@"MiuraBatteryStatusType_UNKNOWN", @(battery.batteryStatus));
            break;
    }

    return NSLocalizedFormatString(@"PNEReaderState_MIURA_BATTERY_STATUS_RESPONSE"
            , status, @(battery.batteryPercentage)
    );
}

//     <MiuraDeviceStatusMessage: self.pinDigits=0, self.pinEntryStatus=5, self.type=1, self.text=Enter PIN>
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

                // pin entering
            case 5:
                return [self enteringPin:device.pinDigits];

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

- (NSString *)enteringPin:(NSUInteger)aDigits {
    if(aDigits == 0) {
        return NSLocalizedString(@"MiuraPinEntryStatus__ENTER_PIN", nil);
    }

    NSMutableString * pinDigits = [[NSMutableString alloc] init];
    for(int i=0; i<aDigits; i++) {
        [pinDigits appendString:@"*"];
    }

    return NSLocalizedFormatString(@"MiuraPinEntryStatus__ENTERING_PIN", pinDigits);
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
