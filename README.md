# OneWaySDK iOS Integration Guide
|Version | Update | Date |
| :--- | :--- | :--- |
| 1.2.1 | 1.support Bitcode  2.support Xcode 7 3.Modify some parameters| 2017.03.09 |
| 1.2.0 | Fix some Bugs | 2017.01.09 |

When you read this document, we assume that you already have a basis of iOS app development experience, and to understand the related basic concepts.

## Integration SDK
**1.You must be set parameters ``` –all_load ``` in options “Other linker flags”.**



```objective-c
// Or you can use following parameters if there is any conflict
-force_load $(SRCROOT)/OneWaySDK/OneWaySDK.a  //According to your SDK path
```

**2. Import OneWaySDK.h and Implement OneWaySDKDelegate in AppDelegate.h :**

``` objective-c
#import "OneWaySDK.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,OneWaySDKDelegate>
```
<Br>**3.Add the following methods to implement the required delegates on the view controller class :**

``` objective-c
- (void)oneWaySDKReady:(NSString *)placementId;
- (void)oneWaySDKDidError:(OneWaySDKError)error withMessage:(NSString *)message;
- (void)oneWaySDKDidStart:(NSString *)placementId;
- (void)oneWaySDKDidFinish:(NSString *)placementId withFinishState:(OneWaySDKFinishState)state;
```

<Br>**4.The following code will initialize SDK :**

``` objective-c
- (BOOL)application:(UIApplication *)application 
                didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

[OneWaySDK initialize: @"Your PublishId" delegate:self];
    //when you create a applications in our platform, you will get a publish ID.

return YES;
}
```


<Br>**5.The following code will show an ad :**

Show default placement :

``` objective-c
if ([OneWaySDK isReady]) {
    [OneWaySDK show:self];
    //You can set default PlacementID in our developer platform.
}
```

