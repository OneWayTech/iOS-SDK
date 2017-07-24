#import "ViewController.h"
#import "OneWaySDK.h"


//竖屏广告
#define PublishID @"yd9npds4pfb0qufi" // 横屏请用 @"2hi4zwe6907jsdo1";



@interface ViewController ()<OneWaySDKDelegate>
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view =  [[[NSBundle mainBundle] loadNibNamed:@"MainView" owner:self options:nil] firstObject];
    self.view.bounds = [UIScreen mainScreen].bounds;
}


#pragma mark - 初始化
- (IBAction)adInitialize:(UIButton *) button{

    [UIView animateWithDuration:0.8 animations:^{
        self.initializeButton.enabled = NO;
        self.initializeButton.backgroundColor = darkColor;
    }];
    
    
    //Note: 为了加快初始化,可在 AppDelegate - didFinishLaunchingWithOptions 中进行初始化.
    [OneWaySDK initialize:PublishID delegate:self];


}

#pragma mark - 播放广告
- (IBAction)ButtonTapped:(UIButton *)button {
    
    if ([OneWaySDK isReady]) {
        button.enabled = NO;
        [OneWaySDK show: self];
    }else{
        NSLog( @"  ads state Not Available");

    }
    
}


#pragma mark - OneWaySDK 代理相关
- (void)oneWaySDKReady:(NSString *)placementId {

    NSLog(@"OneWaySDK Ready for %@",placementId);
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.playAdsButton.enabled = YES;
        self.playAdsButton.backgroundColor = blueColor;

    }];

}


- (void)oneWaySDKDidError:(OneWaySDKError)error withMessage:(NSString *)message {

    NSLog(@"OneWaySDK ERROR: %ld - %@",(long)error, message);

}

- (void)oneWaySDKDidStart:(NSString *)placementId {
    NSLog(@"OneWaySDK Start");
   
    self.playAdsButton.enabled = NO;
    self.playAdsButton.backgroundColor = darkColor;
}



- (void)oneWaySDKDidFinish:(NSString *)placementId withFinishState:(OneWaySDKFinishState)state {
   
    NSString *stateString = @"UNKNOWN";
    switch (state) {
        case kOneWaySDKFinishStateError:
            stateString = @"ERROR";
            break;
        case kOneWaySDKFinishStateSkipped:
            stateString = @"SKIPPED";
            break;
        case kOneWaySDKFinishStateCompleted:
            stateString = @"COMPLETED";
            break;
        default:
            break;
    }
    NSLog(@"OneWaySDK FINISH: %@ - %@", stateString, placementId);

}




@end
