//
//  UploadIWithAFNApi.h
//  XLForZAApp
//
//  Created by 纵昂 on 2020/1/18.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UploadIWithAFNApi : NSObject
/**
 *  上传带图片的内容，允许多张图片上传（URL）POST
 *
 *  @param url                 网络请求地址
 *  @param images              要上传的图片数组（注意数组内容需是图片）
 *  @param parameter           图片数组对应的参数
 *  @param parameters          其他参数字典
 *  @param succeedBlock        成功的回调
 *  @param failedBlock         失败的回调
 *  @param uploadProgressBlock 上传进度的回调
 */
+ (void)startMultiPartUploadTaskWithURL:(NSString *)url
                            imagesArray:(NSArray *)images
                      parameterOfimages:(NSString *)parameter
                         parametersDict:(NSDictionary *)parameters
                           succeedBlock:(void(^)(id task, id responseObject))succeedBlock
                            failedBlock:(void(^)(id task, NSError *error))failedBlock
                    uploadProgressBlock:(void(^)(float uploadPercent,long long totalBytesWritten,long long totalBytesExpectedToWrite))uploadProgressBlock;


+ (void)startRequestTas:(NSString *)url
                         parametersDict:(NSDictionary *)parameters
                           succeedBlock:(void(^)(id task, id responseObject))succeedBlock
                            failedBlock:(void(^)(id task, NSError *error))failedBlock
                    uploadProgressBlock:(void(^)(float uploadPercent,long long totalBytesWritten,long long totalBytesExpectedToWrite))uploadProgressBlock;

@end

NS_ASSUME_NONNULL_END
