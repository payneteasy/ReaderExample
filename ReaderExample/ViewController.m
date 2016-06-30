//
//  ViewController.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import "ViewController.h"
#import "PaymentParameters.h"
#import "PaymentViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton * startButton;

@end

@implementation ViewController

- (void)onStartTapped:(id)onStartTapped {
    NSLog(@"Pay pressed");

    PaymentParameters *parameters = [[PaymentParameters alloc]
            initWithConfigurationBaseUrl:@"https://paynet-qa.clubber.me/paynet/rki-proxy"
                       processingBaseUrl:@"https://paynet-qa.clubber.me/paynet"
                           merchantLogin:@"paynet-demo"
                             merchantKey:@"5D0BB936-46BB-11E5-A54A-735A47388A3F"
                      merchantEndPointId:1
                            merchantName:@"Paynet Demo"
                                  amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]
                                currency:@"RUB"];

    PaymentViewController * controller = [[PaymentViewController alloc] initWithPaymentParameters:parameters];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupElements];
    [self setupConstraints];
}

- (void)setupElements {
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.startButton];
}

- (void)setupConstraints {
    NSDictionary *views = @{@"superview":self.view, @"label":self.startButton};

    [self.view addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:@"V:[superview]-(<=1)-[label]"
                                options:NSLayoutFormatAlignAllCenterX
                                metrics:nil
                                  views:views
    ]];

    [self.view addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:@"H:[superview]-(<=1)-[label]"
                                options:NSLayoutFormatAlignAllCenterY
                                metrics:nil
                                  views:views
    ]];
}

-(UIButton *) startButton {

    if(_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        _startButton.backgroundColor = [UIColor grayColor];
        _startButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_startButton setTitle:@"Pay by card" forState:UIControlStateNormal];
        [_startButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_startButton addTarget:self
                         action:@selector(onStartTapped:)
               forControlEvents:UIControlEventTouchUpInside];
        [_startButton sizeToFit];
    }

    return _startButton;
}


@end
