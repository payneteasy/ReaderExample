//
//  PaymentViewController.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import "PaymentViewController.h"
#import "PaymentParameters.h"
#import "PaymentPresenter.h"

@interface PaymentViewController() <IPaymentView>

@property (nonatomic, strong) UIActivityIndicatorView * indicator;
@property (nonatomic, strong) UILabel                 * statusLabel;

@end

@implementation PaymentViewController {
    PaymentParameters       * _payment;
    id<IPaymentPresenter>     _presenter;
//    UIActivityIndicatorView *
}

- (instancetype)initWithPaymentParameters:(PaymentParameters *)aParameters {
    self = [super init];
    if (self) {
        _payment    = aParameters;
        _presenter  = [[PaymentPresenter alloc] initWithView:self parameters:aParameters];
    }
    return self;
}

#pragma mark - configure user interface

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupElements];
    [self setupConstraints];

    [_presenter startPayment];
}

- (void)setupElements {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _payment.merchantName;

    [self.view addSubview:self.statusLabel];
}

- (void)setupConstraints {
    NSDictionary *views = @{@"label":self.statusLabel};

    [self.view addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:@"H:|[label]|"
                                options:0
                                metrics:nil
                                  views:views
    ]];

    [self.view addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:@"V:|[label]|"
                                options:0
                                metrics:nil
                                  views:views
    ]];
}

- (UILabel *)statusLabel {
    if(_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.backgroundColor = [UIColor grayColor];
        _statusLabel.numberOfLines = 0;
        _statusLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _statusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLabel;
}

#pragma mark - IPaymentView

- (void)showStatus:(NSString *)aStatus {
    NSLog(@"Status: %@", aStatus);
    _statusLabel.text = aStatus;
}

- (void)dealloc {
    [_presenter stopPayment];
}


@end
