//
//  ErrorEventTextProducer.h
//  ReaderExample
//
//  Created by Evgeniy Sinev on 01/07/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorEventTextProducer : NSObject

-(NSString *) textForError:(PNECardError *)aError;

@end
