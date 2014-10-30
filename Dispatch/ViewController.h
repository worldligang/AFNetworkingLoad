//
//  ViewController.h
//  Dispatch
//
//  Created by iOSDevTip on 14-10-20.
//  Copyright (c) 2014年 http://iswifting.com All rights reserved.
//

// 微信公众账号：iOSDevTip
// http://iswifting.com  swift学习社区


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *dipatch;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;


@property (weak, nonatomic) IBOutlet UIButton *pause;


@property (weak, nonatomic) IBOutlet UIButton *resume;


@end
