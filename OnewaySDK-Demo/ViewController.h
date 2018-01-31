//
//  ViewController.h
//  OnewaySDK
//
//  Created by lch on 16/9/16.
//  Copyright © 2016年 mobi.oneway. All rights reserved.
//


#import <UIKit/UIKit.h>

#define blueColor [UIColor colorWithRed:0.13 green:0.59 blue:0.95 alpha:1.0]
#define darkColor [UIColor colorWithRed:0.13 green:0.17 blue:0.22 alpha:0.8]

@interface ViewController : UIViewController

//激励
@property (weak, nonatomic) IBOutlet UIButton *RewardedButton;

//插屏视频
@property (weak, nonatomic) IBOutlet UIButton *InterstitialButton;

//插屏图片
@property (weak, nonatomic) IBOutlet UIButton *InertstitialImage;

@end

