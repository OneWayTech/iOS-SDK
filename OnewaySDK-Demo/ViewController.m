#import "ViewController.h"
#import "OneWaySDK.h"


//竖屏广告
#define PublishID @"yd9npds4pfb0qufi" // 横屏请用 @"2hi4zwe6907jsdo1";



@interface ViewController ()<oneWaySDKRewardedAdDelegate,oneWaySDKInterstitialAdDelegate>
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view =  [[[NSBundle mainBundle] loadNibNamed:@"MainView" owner:self options:nil] firstObject];
    self.view.bounds = [UIScreen mainScreen].bounds;
    
    // OneWaySDK - 初始化
    // 为了加快初始化,可在 AppDelegate - didFinishLaunchingWithOptions 中进行初始化.
    
    [OneWaySDK configure:@"po4wvdsaaaygsc7t"];
    [OWRewardedAd initWithDelegate:self];
    [OWInterstitialAd initWithDelegate:self];
    
    
}


#pragma mark - 播放激励广告
- (IBAction)Rewarded:(UIButton *) button{

    [UIView animateWithDuration:0.8 animations:^{
        self.RewardedButton.enabled = NO;
        self.RewardedButton.backgroundColor = darkColor;
    }];
    
    
    if ([OWRewardedAd isReady]) {
        [OWRewardedAd show:self];
    }else{
        NSLog( @"Ad Not Available, plz wait.");
    }

}

#pragma mark - 播放插屏广告
- (IBAction)Interstitial:(UIButton *)button {
    [UIView animateWithDuration:0.8 animations:^{
        self.InterstitialButton.enabled = NO;
        self.InterstitialButton.backgroundColor = darkColor;
    }];
    
    if ([OWInterstitialAd isReady]) {
        [OWInterstitialAd show:self];
    }else{
        NSLog( @"Ad Not Available, plz wait.");
    }
    
}

#pragma mark - RewardedAd Delegate
- (void)oneWaySDKRewardedAdReady{
    [UIView animateWithDuration:0.8 animations:^{
        self.RewardedButton.enabled = YES;
        self.RewardedButton.backgroundColor = blueColor;
    }];
    NSLog(@"rewarded ad ready");

}
- (void)oneWaySDKRewardedAdDidShow:(NSString *)tag {
    NSLog(@"rewarded ad show");
}
- (void)oneWaySDKRewardedAdDidClick:(NSString *)tag {
    NSLog(@"rewarded ad click");
}
- (void)oneWaySDKRewardedAdDidClose:(NSString *)tag withState:(NSNumber *)state{
    NSLog(@"rewarded ad Close");
}

#pragma mark - Interstitial Delegate
- (void)oneWaySDKInterstitialAdReady{
    [UIView animateWithDuration:0.8 animations:^{
        self.InterstitialButton.enabled = YES;
        self.InterstitialButton.backgroundColor = blueColor;
    }];
    NSLog(@"Interstitial ad ready");
}
- (void)oneWaySDKInterstitialAdDidShow:(NSString *)tag {
    NSLog(@"Interstitial ad show");
}
- (void)oneWaySDKInterstitialAdDidClick:(NSString *)tag {
   NSLog(@"Interstitial ad click");
}
- (void)oneWaySDKInterstitialAdDidClose:(NSString *)tag withState:(NSNumber *)state {
    NSLog(@"Interstitial ad close");
}

-(void)oneWaySDKDidError:(OneWaySDKError)error withMessage:(NSString *)message{
    NSLog( @"OneWaySDK Error:  %ld  message:%@", (long)error, message);

}





@end
