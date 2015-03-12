
#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"
#import "MKHttpReqeust.h"


typedef enum {
    OpenPlatformValite = -1,
    OpenPlatformSina = 0,
    OpenPlatformRenRen = 1,
    OpenPlatformQQZone = 2,
} OpenPlatformId;




typedef enum {
    RequestErrorCodeSuccess = 0,
    RequestErrorCodeConnectError = -1,
    RequestErrorCodeCanceled = -2,
    RequestErrorCodeNull = 32000,
    RequestErrorCodeException = 32100,
}RequestErrorCode;



typedef void (^onCompletedBlock)(NSDictionary *sourceDic, NSInteger errorCode, NSString* errorMsg, BOOL hasMore, id otherData);


@interface DataEngine : NSObject <UIAlertViewDelegate>

// config
@property (nonatomic, copy) NSString* hostUrl;
@property (nonatomic, copy) NSString* appPlatform;
@property (nonatomic, copy) NSString* appPassowrd;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *buildVersion;
@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *deviceUniqueId;
@property (assign, nonatomic) CGSize   deviceScreenSize;
@property (nonatomic, copy) NSString* pushToken;


@property (nonatomic, copy) NSString* account;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, assign) NSManagedObjectContext *managedObjectContext;


@property (nonatomic, assign) NSInteger unreadMessageCount;
@property (nonatomic, assign) NSInteger newCorpFeedCount;
@property (nonatomic, assign) long long currentTimeStamp;
@property (nonatomic, assign) OpenPlatformId thirdPlatform;
@property (nonatomic, strong) MKNetworkEngine* networkEngine;



+ (DataEngine *)sharedInstance;


- (void)doSomethingAfterLogin;

- (void)doSomethingAfterLogout:(BOOL)showLogin;

- (BOOL)checkConnected;


- (BOOL)islogin;
- (BOOL)isBindPlatform:(NSInteger)platform;
+ (BOOL)isDefaultCompanyURL:(NSString*)url;

- (void)loginFinished:(NSInteger)code openPlatForm:(OpenPlatformId)platform;




- (MKHttpReqeust*)requestPOSTWithApi:(NSString*)apiName
                               param:(NSDictionary*)param
                    completOpeartion:(MKNKResponseBlock)complete
                      errorOperation:(MKNKResponseErrorBlock)error;

- (MKHttpReqeust*)requestWithApi:(NSString*)apiName
                           param:(NSDictionary*)param
                          method:(NSString*)method
                             url:(NSString*)url
                completOpeartion:(MKNKResponseBlock)complete
                  errorOperation:(MKNKResponseErrorBlock)error;






/***********************  业务接口  *****************/



- (MKHttpReqeust*)getDreamDetail:(NSString*)dreamId onComplete:(onCompletedBlock)block;

- (MKHttpReqeust*)getRecommendListWithOnComplete:(onCompletedBlock)block;

- (MKHttpReqeust*)getNotificationStats:(NSArray*)tag onComplete:(onCompletedBlock)block;

- (MKHttpReqeust*)getFeedListOnComplete:(onCompletedBlock)block;



/*
  ******** 获取用户好友列表 ***********
 */

-(MKHttpReqeust*)getContactList:(onCompletedBlock)block;



/*
 ************ 上传头像  ******************
 */

-(MKHttpReqeust*)uploadAvatar:(UIImage*)image onComplete:(onCompletedBlock)block;


/*
 ******************** 获取itunes上APP的信息 ******************************
 */

-(MKHttpReqeust*)getAPPInfoFromItunes:(onCompletedBlock)block;

@end
