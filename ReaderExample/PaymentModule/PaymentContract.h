//
//  PaymentContract.h
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPaymentView

-(void) showStatus:(NSString *)aStatus;

//-(void) showDescription:(NSString *)aDescription;
//
//-(void) showError:(NSString *) aError;
//
//-(void) showProgress:(BOOL)aProgressVisible;

@end

@protocol IPaymentPresenter

-(void) startPayment;

-(void) stopPayment;

@end