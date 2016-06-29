//
//  PaymentViewController.h
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PaymentContract.h"

@class PaymentParameters;

@interface PaymentViewController : UIViewController <IPaymentView>

- (instancetype)initWithPaymentParameters:(PaymentParameters *)aParameters;

@end
