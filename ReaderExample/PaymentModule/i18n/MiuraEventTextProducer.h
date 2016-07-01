//
//  MiuraEventTextProducer.h
//  ReaderExample
//
//  Created by Evgeniy Sinev on 30/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiuraEventTextProducer : NSObject

- (NSString *)deviceInfo:(id)aMessage;

- (NSString *)battery:(id)aMessage;

- (NSString *)miuraDeviceStatus:(id)aMessage;

- (NSString *)miuraCardStatus:(id)aMessage;



@end
