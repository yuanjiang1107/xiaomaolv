

#import "RIButtonItem.h"
#import "NetworkMonitor.h"
#import "UIAlertView+Blocks.h"
#import "UIDevice+Addtional.h"
#import "MKNetworkEngine.h"
#import "DataEngine.h"
#import "ErrorCodeUtils.h"
#import "ContactEntity.h"

#define ITUNES_APPID @"284910350"

static DataEngine *dataEngineInstance = nil;

@interface DataEngine()

@end

@implementation DataEngine

+ (DataEngine *)sharedInstance
{
    @synchronized(dataEngineInstance) {
        if (dataEngineInstance == nil) {
            dataEngineInstance = [[DataEngine alloc] init];
        }
    }
    return dataEngineInstance;
}

- (void)configApp
{
    // 测试环境参数
    NSUserDefaults *userDefaultsForDebug = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaultsForDebug objectForKey:@"debugSettingSetAPI"]) {
        self.hostUrl = [userDefaultsForDebug stringForKey:@"debugSettingSetAPI"];
    }else {
        self.hostUrl = @"http://app.api.you1ke.com";
    }

    self.appPlatform = @"ios";
    self.appPassowrd = @"ios";
    
    self.buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey];
    self.version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

    self.deviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        NSInteger scale = [[UIScreen mainScreen] scale];
        self.deviceScreenSize = CGSizeMake(scale * self.deviceScreenSize.width, scale * self.deviceScreenSize.height);
    }
    
    self.deviceUniqueId = [[UIDevice currentDevice] deviceIdentifier];
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    self.appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (self.appName.length == 0) {
        self.appName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
    }
}

- (id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [self configApp];
        _networkEngine = [[MKNetworkEngine alloc] initWithHostName:nil];
    }
    
    return self;
}




- (BOOL)checkConnected
{
    if ([NetworkMonitor status] == NotReachable) {
        RIButtonItem *cancelItem = [RIButtonItem item];
        cancelItem.label = NSLocalizedString(@"确定", @"");
        cancelItem.action = ^{
        };
        
        NSString *titleStr = NSLocalizedString(@"你的网络好像有问题，请稍后再试", @"");
        [MBHudUtil showFinishActivityView:titleStr
                                                    interval:1.5f
                                                      inView:nil];
        return NO;
    }
    return YES;
}


- (NSMutableDictionary*)getDicFromJsonData:(NSData*)data
{
    NSDictionary* dic = [data objectFromJSONData1];
    NSMutableDictionary* info = nil;
    if (dic == nil || [[dic allKeys] count] == 0) {
        // 空的，做个错误处理
        NSLog(@"ERROR MESSAGE IS EXCEPTION");
        info = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"10000", @"code", @"系统出错了", @"message", nil];
    }
    else {
        info = [NSMutableDictionary dictionaryWithDictionary:dic];
    }
    
    return info;
}


- (NSDictionary *)generateHeader
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [NSString stringWithFormat:@"ios %@", device.systemVersion];
    
    NSMutableDictionary *header = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"dj_app", @"appName",
                                   self.version, @"version",
                                   @"1", @"protocol-version",
                                   self.deviceUniqueId, @"imei",
                                   @"UTF-8", @"encoding",
                                   @"zh", @"language",
                                   systemVersion, @"platform",
                                   device.model, @"model",
                                   [NSString stringWithFormat:@"%ld*%d", (long)self.deviceScreenSize.width, (NSInteger)self.deviceScreenSize.height], @"screensize",
                                   @"Dajie", @"vendor",
                                   @"IOS", @"channel",
                                   [[UIDevice currentDevice] platformString], @"agent",
                                   @"gzip,deflate", @"Accept-Encoding",
                                   nil];
    return header; 
}

+ (BOOL)isDefaultCompanyURL:(NSString*)url
{
    
    return NO;
}


#pragma mark - error process
- (BOOL)emptyDictionary:(NSDictionary*)dic
{
    if ([dic isKindOfClass:[NSDictionary class]]) {
        if (dic == nil || [[dic allKeys] count] == 0) {
            return YES;
        }
        else {
            return NO;
        }
    }
    else {
        return NO;
    }
}

- (NSInteger)getErrorCode:(NSDictionary*)dic
{
    if ([dic isKindOfClass:[NSDictionary class]]) {
        if ([self emptyDictionary:dic]) {
            return RequestErrorCodeException;
        }
        NSNumber* code = [dic objectForKey:@"errorcode"];
        if (code == nil) {
            code = [dic objectForKey:@"_code"];
        }
        if (code != nil) {
            if ([code isKindOfClass:[NSNumber class]]) {
                return code.integerValue;
            }
            else if ([code isKindOfClass:[NSString class]]) {
                return [(NSString*)code integerValue];
            }
        }
        else {
            // 服务端不返回code，表示成功
            return RequestErrorCodeSuccess;
        }
    }
    else if ([dic isKindOfClass:[NSArray class]]) {
        return RequestErrorCodeSuccess;
    }
    return RequestErrorCodeNull;
}

- (NSString*)getErrorMsg:(NSDictionary*)dic code:(NSInteger)code
{
    if (code == 106) {
        return [NSString stringWithFormat:@"服务端异常[代码:%d]", code];
    }
    else if (code == RequestErrorCodeException) {
        return @"请求出错[EXP]";
    }
    else if (code == RequestErrorCodeNull) {
        return @"请求出错[NULL]";
    }
    else {
        NSString* msg = [dic objectForKey:@"message"];
        if (msg != nil && [msg isKindOfClass:[NSString class]] && msg.length > 0) {
            //return [NSString stringWithFormat:@"请求出错[代码:%d]", code];
            return msg;
        }
        else {
            return @"请求出错";
        }
    }
}

- (NSString *)getHttpError:(NSError *)error
{
    switch ([error code]) {
        case kHttpTimeOutErrorCode:
            return NSLocalizedString(@"请求超时", nil);
            break;
        case kNetworkUnavailabelErrorCode:
        case kNetworkUnavailabelErrorCode2:
            return NSLocalizedString(@"未能连接到服务器，请稍后再试", nil);
            break;
        default:
            return NSLocalizedString(@"网络错误", nil);
            break;
    }
}

#pragma mark - block to controller
- (void)serverData:(NSDictionary*)dic hasMore:(BOOL)hasMore otherData:(id)otherData onComplete:(onCompletedBlock)block
{
    if (block != nil) {
        block(dic, RequestErrorCodeSuccess, nil, hasMore, otherData);
    }
}

- (void)serverError:(NSInteger)code data:(NSDictionary*)dic onComplete:(onCompletedBlock)block
{
    
    NSString* msg = [self getErrorMsg:dic code:code];
    if (block != nil) {
        block(nil, code, msg, NO, nil);
    }
}

- (void)connectError:(NSError*)error onComplete:(onCompletedBlock)block
{
    if (block != nil) {
        NSString* msg = [self getHttpError:error];
        block(nil, RequestErrorCodeConnectError, msg, NO, nil);
    }
}

#pragma mark - common http request
- (NSDictionary*)generateFullParam:(NSDictionary*)param
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:param];
    
    // 加公共参数
    [dic setObject:self.appPlatform forKey:@"_appId"];
    [dic setObject:self.appPassowrd forKey:@"_password"];
    [dic setObject:self.deviceUniqueId forKey:@"_deviceNumber"];
    [dic setObject:self.version forKey:@"_v"];
    // 登录后的参数
 
    
    return dic;
}
- (MKHttpReqeust*)requestGETWithApi:(NSString*)apiName
                              param:(NSDictionary*)param
                   completOpeartion:(MKNKResponseBlock)complete
                     errorOperation:(MKNKResponseErrorBlock)error
{
    return [self requestWithApi:apiName
                          param:param
                         method:@"GET"
                            url:nil
               completOpeartion:complete
                 errorOperation:error];
}

- (MKHttpReqeust*)requestPOSTWithApi:(NSString*)apiName
                              param:(NSDictionary*)param
                   completOpeartion:(MKNKResponseBlock)complete
                     errorOperation:(MKNKResponseErrorBlock)error
{
    return [self requestWithApi:apiName
                          param:param
                         method:@"POST"
                            url:nil
               completOpeartion:complete
                 errorOperation:error];
}

- (MKHttpReqeust*)requestWithApi:(NSString*)apiName
                           param:(NSDictionary*)param
                          method:(NSString*)method
                             url:(NSString*)url
                completOpeartion:(MKNKResponseBlock)complete
                  errorOperation:(MKNKResponseErrorBlock)error
{
    NSAssert(![apiName hasPrefix:@"/"], @"apiname error /");
    
    if (method.length == 0) {
        method = @"POST";
    }
    
    NSString* fullUrl = self.hostUrl;
    if (url.length > 0) {
        fullUrl = url;
    }
    
    if (apiName.length > 0) {
        fullUrl = [NSString stringWithFormat:@"%@/%@", fullUrl, apiName];
    }
    
    //
    //NSDictionary* fullParam = [self generateFullParam:param];
    
    MKHttpReqeust* r = [[MKHttpReqeust alloc] initWithURLString:fullUrl params:param httpMethod:method];
    
    if (([method isEqualToString:@"POST"] || [method isEqualToString:@"PUT"])
        && (param && [param count] > 0)) {
        // 与服务端约定使用JSON
        r.postDataEncoding = MKNKPostDataEncodingTypeURL;
    }
    
    //[r addHeaders:[self generateHeader]];
    [r addCompletionHandler:complete errorHandler:error];

#ifdef isDebug
    NSLog(@"REQUEST:%@", r);
#endif
    
    [self.networkEngine enqueueOperation:r];
    
    return r;
}

- (MKHttpReqeust*)getDreamDetail:(NSString*)dreamId onComplete:(onCompletedBlock)block{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:dreamId,@"id", nil];
    MKHttpReqeust *r = [self requestPOSTWithApi:@"dream/details"
                                          param:dic
                               completOpeartion:^(MKNetworkOperation *completedOperation) {
                                   NSDictionary *dic = [completedOperation responseJSON];
                                   NSInteger internalCode = [self getErrorCode:dic];
                                   
                               } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
                                   NSLog(@"error");
                                   printf("xxxxxxxx");
                                   
                               }];
    return r;
    
};

//
//-(MKHttpReqeust*)loadSliderList:(onCompletedBlock)block{
//    MKHttpReqeust *r = [self requestGETWithApi:@"sliderList.json"
//                                         param:nil
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger internalCode = [self getErrorCode:dic];
//                                  if (internalCode == RequestErrorCodeSuccess) {
//                                      
//                                      [SliderImage MR_deleteAllMatchingPredicate:nil];
//                                      
//                                      dic = [dic objectForKey:@"data"];
//                                      
//                                      
//                                      NSArray *array = [dic objectForKey:@"sliderList"];
//                                      for (NSDictionary *sliderInfo in array) {
//                                          SliderImage * image = [SliderImage MR_createEntity];
//                                          image.url = [sliderInfo objectForKey:@"sliderPicUrl"];
//                                      }
//                                      
//                                      [[NSManagedObjectContext MR_rootSavingContext] MR_saveToPersistentStoreAndWait];
//
//                                      
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }else{
//                                      [self serverError:internalCode data:dic onComplete:block];
//                                  }
//                                  
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//                              }];
//    return r;
//}
//
//
//
//- (MKHttpReqeust*)loadProductListWithComplete:(onCompletedBlock)block{
//    MKHttpReqeust *r = [self requestGETWithApi:@"productList.json"
//                                         param:nil
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger internalCode = [self getErrorCode:dic];
//                                  if (internalCode == RequestErrorCodeSuccess) {
//                                      //清空之前数据库;
//                                      [ProductList MR_deleteAllMatchingPredicate:nil];
//                                      NSDictionary *dataDic = [dic objectForKey:@"data"];
//                                      NSArray *productList = [dataDic objectForKey:@"productList"];
//                                      NSInteger index = 0;
//                                      for (NSDictionary *infoDic in productList) {
//                                          NSInteger productId = [[infoDic objectForKey:@"id"] integerValue];
//                                          NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productId == %d", productId];
//                                          Product *product = [Product MR_findFirstWithPredicate:predicate];
//                                          if (product == nil) {
//                                              product = [Product MR_createEntity];
//                                          }
//                                          [SSFillObjUtils fillProductWithDic:infoDic entity:product];
//                                          ProductList *productListEntity = (ProductList*)[ProductList MR_createEntity];
//                                          productListEntity.product = product;
//                                          productListEntity.sortId = [NSNumber numberWithInteger:index++];
//                                      }
//                                      [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }else{
//                                      [self serverError:internalCode data:dic onComplete:block];
//                                  }
//                                  
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//                              }];
//    return r;
//}
//
//
//
//
//
//- (MKHttpReqeust*)loadProductDetailWithIdentity:(NSString*)productId
//                                     onComplete:(onCompletedBlock)block{
//    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObject:productId forKey:@"productId"];
//    MKHttpReqeust *r = [self requestGETWithApi:@"productInfo.json"
//                                         param:param
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger code = [self getErrorCode:dic];
//                                  if (code == RequestErrorCodeSuccess) {
//                                      dic = [dic objectForKey:@"data"];
//                                      NSDictionary *skuPropList = [dic objectForKey:@"skuPropList"];
//                                      dic = [dic objectForKey:@"product"];
//
//                                      NSInteger productId = [[dic objectForKey:@"id"] integerValue];
//                                      NSPredicate *perdicate = [NSPredicate predicateWithFormat:@"productId == %d", productId];
//                                      Product *product = [Product MR_findFirstWithPredicate:perdicate];
//                                      if (product == nil) {
//                                          product = [Product MR_createEntity];
//                                      }
//                                      [SSFillObjUtils fillProductWithDic:dic entity:product];
//                                      product.sukSuks = nil;
//                                      
//                                      NSArray *productSkus = [dic objectForKey:@"productSkus"];
//                                      for (NSDictionary *productSkusInfo in productSkus) {
//                                          NSInteger productId = [[productSkusInfo objectForKey:@"productId"] integerValue];
//                                          NSInteger sukId = [[productSkusInfo objectForKey:@"id"] integerValue];
//                                          NSPredicate *perdicate = [NSPredicate predicateWithFormat:@"productId == %d and sukId == %d", productId, sukId];
//                                          SuitcaseSuk *suk = [SuitcaseSuk MR_findFirstWithPredicate:perdicate];
//                                          if (suk == nil) {
//                                              suk = [SuitcaseSuk MR_createEntity];
//                                          }
//                                          [SSFillObjUtils fillSuitcaseSukWithDic:productSkusInfo entity:suk];
//                                          [product  addSukSuks:[NSSet setWithObject:suk]];
//                                      }
//                                      
//                                      
//                                      
//                                      
//                                      //NSArray *skuPropList = [dic objectForKey:@"skuPropList"];
//                                      
//                                      
//                                      [InfoForAttribute MR_deleteAllMatchingPredicate:nil];
//                                      
//                                      for (NSDictionary *attribute in skuPropList) {
//                                          NSArray *attributeValues = [attribute objectForKey:@"skuPropValueList"];
//                                          NSString *attributeName = [attribute objectForKey:@"name"];
//                                          for (NSDictionary *indexDic in attributeValues) {
//                                              NSNumber *attributeId = [indexDic objectForKey:@"skuPropId"];
//                                              NSString *name = [indexDic objectForKey:@"name"];
//                                              NSNumber *valueId = [indexDic objectForKey:@"id"];
//                                              NSString *attriButePictUrl = [indexDic objectForKey:@"skuPicUrl"];
//                                              NSString *descripton = [indexDic objectForKey:@"description"];
//                                              NSNumber *sort = [indexDic objectForKey:@"sort"];
//                                              NSString *skuThumbPicUrl = [indexDic objectForKey:@"skuThumbPicUrl"];
//                                              
//                                              InfoForAttribute *attribute = [InfoForAttribute MR_createEntity];
//                                              
//                                              
//                                              attribute.skuThumbPicUrl = skuThumbPicUrl;
//                                              attribute.productId = [NSNumber numberWithInteger:productId];
//                                              attribute.attributeId = attributeId;
//                                              attribute.attributeName = attributeName;
//                                              attribute.value = name;
//                                              attribute.valuePictureUrl = attriButePictUrl;
//                                              attribute.descriptionStr = descripton;
//                                              attribute.valueId = valueId;
//                                              attribute.sortId = sort;
//                                          }
//                                          
//                                      }
//                                      
//                                      
//                                      
//                                      
//                                      
//                                      //[[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//                                      
//                                      [[NSManagedObjectContext  MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
//                                      
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//                              }];
//    return r;
//}
//
//- (MKHttpReqeust*)commiteOrder:(NSDictionary*)order
//                    onComplete:(onCompletedBlock)block{
//    //NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObject:order forKey:@"order"];
//    MKHttpReqeust *r = [self requestPOSTWithApi:@"postJsonOrder.json"
//                                         param:order
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger code = [self getErrorCode:dic];
//                                  if (code == RequestErrorCodeSuccess) {
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }else{
//                                      [self serverError:code data:dic onComplete:block];
//                                  }
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//                              }];
//    return r;
//}
//
//
//-(MKHttpReqeust *)runningCheck:(onCompletedBlock)block{
//    
//    NSString *uuid = [[UIDevice currentDevice] deviceIdentifier];
//    NSDictionary *dic = [NSDictionary dictionaryWithObject:uuid forKey:@"deviceId"];
//    MKHttpReqeust *r = [self requestGETWithApi:@"running.json"
//                                         param:dic
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger code = [self getErrorCode:dic];
//                                  if (code == RequestErrorCodeSuccess) {
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }else{
//                                      [self serverError:code data:dic onComplete:block];
//                                  }
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//                              }];
//    return r;
//}
//
//-(MKHttpReqeust*)getPayPrompt:(onCompletedBlock)block{
//    MKHttpReqeust *r = [self requestGETWithApi:@"productBgList.json"
//                                         param:nil
//                              completOpeartion:^(MKNetworkOperation *completedOperation) {
//                                  NSDictionary *dic = [completedOperation responseJSON];
//                                  NSInteger code = [self getErrorCode:dic];
//
//                                  if (code == RequestErrorCodeSuccess) {
//                                      [self serverData:dic hasMore:NO otherData:nil onComplete:block];
//                                  }else{
//                                      [self serverError:code data:dic onComplete:block];
//                                  }
//
//                              } errorOperation:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                  [self connectError:error onComplete:block];
//
//                              }];
//    return r;
//}


-(MKHttpReqeust*)getContactList:(onCompletedBlock)block{
    MKHttpReqeust *r;
    
//    ContactEntity *contactInfoX = [ContactEntity MR_createEntity];
//    contactInfoX.userName = @"小朋友";
//    contactInfoX.userNameHeaderChar = @"X";
//    
//    ContactEntity *contactInfoD = [ContactEntity MR_createEntity];
//    contactInfoD.userName = @"大勇";
//    contactInfoD.userNameHeaderChar = @"D";
//    
    
//    [contactInfoD.managedObjectContext MR_saveToPersistentStoreAndWait];
    
    
    return r;
}


-(MKHttpReqeust*)uploadAvatar:(UIImage*)image onComplete:(onCompletedBlock)block{
    NSString* fileName = @"upload.jpg";
    NSData* data = UIImageJPEGRepresentation(image, 0.8f);
    
    NSString* apiName = @"fileUploadService/uploadAvatar";
    if (![self islogin]) {
        apiName = @"fileUploadService/uploadAvatarWithoutToken";
    }
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:4];
    [param setObject:fileName forKey:@"fileName"];
    
    MKHttpReqeust* r = [self requestPOSTWithApi:apiName
                                          param:param
                               completOpeartion:
                        ^(MKNetworkOperation *completedOperation) {
                            NSDictionary* dic = [completedOperation responseJSON];
                            NSInteger code = [self getErrorCode:dic];
                            if (code == RequestErrorCodeSuccess) {
                                // 完成
                                [self serverData:dic hasMore:YES otherData:nil onComplete:block];
                            }
                            else {
                                [self serverError:code data:dic onComplete:block];
                            }
                        } errorOperation:
                        ^(MKNetworkOperation *completedOperation, NSError *error) {
                            [self connectError:error onComplete:block];
                        }];
    [r addData:data forKey:@"file" mimeType:@"application/octet-stream" fileName:fileName];
    return r;

}


-(MKHttpReqeust*)getAPPInfoFromItunes:(onCompletedBlock)block{
    
    MKHttpReqeust* r = [[MKHttpReqeust alloc] initWithURLString:@"http://itunes.apple.com/lookup"
                                                         params:[NSDictionary dictionaryWithObject:ITUNES_APPID forKey:@"id"]
                                                     httpMethod:@"GET"];
    
   [r addCompletionHandler:^(MKNetworkOperation *completedOperation) {
       NSDictionary* dic = [completedOperation responseJSON];
       NSInteger code = [self getErrorCode:dic];
       if (code == RequestErrorCodeSuccess) {
           // 完成
           [self serverData:dic hasMore:YES otherData:nil onComplete:block];
       }
       else {
           [self serverError:code data:dic onComplete:block];
       }

   } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
       [self connectError:error onComplete:block];
   }];
    
    [self.networkEngine enqueueOperation:r];

    return r;
}


@end