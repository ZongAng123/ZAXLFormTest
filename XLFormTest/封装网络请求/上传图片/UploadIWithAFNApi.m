//
//  UploadIWithAFNApi.m
//  XLForZAApp
//
//  Created by 纵昂 on 2020/1/18.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//
 
#import "UploadIWithAFNApi.h"

@implementation UploadIWithAFNApi
+ (void)startMultiPartUploadTaskWithURL:(NSString *)url
                            imagesArray:(NSArray *)images
                      parameterOfimages:(NSString *)parameter
                         parametersDict:(NSDictionary *)parameters
                           succeedBlock:(void (^)(id, id))succeedBlock
                            failedBlock:(void (^)(id, NSError *))failedBlock
                    uploadProgressBlock:(void (^)(float, long long, long long))uploadProgressBlock{
    
    if (images.count == 0) {
        NSLog(@"上传内容没有包含图片");
        return;
    }
    for (int i = 0; i < images.count; i++) {
        if (![images[i] isKindOfClass:[UIImage class]]) {
            NSLog(@"images中第%d个元素不是UIImage对象",i+1);
            return;
        }
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [userDefaults objectForKey:@"KEY_USER_TOKEN"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [manager setSecurityPolicy:[Factory customSecurityPolicy]];//此处为适配https设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];

    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
         int i = 0;
         //根据当前系统时间生成图片名称
         NSDate *date = [NSDate date];
         NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
         [formatter setDateFormat:@"yyyy年MM月dd日"];
         NSString *dateString = [formatter stringFromDate:date];
         
         for (UIImage *image in images) {
             NSString *fileName = [NSString stringWithFormat:@"%@%d.png",dateString,i];
             NSData *imageData;
             imageData = [Factory imageData:image];//对图片进行压缩处理,也是封装的，这部分代码放在下面
             [formData appendPartWithFileData:imageData name:parameter fileName:fileName mimeType:@"image/jpg/png/jpeg"];
         }
         
     } progress:^(NSProgress * _Nonnull uploadProgress) {
         NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
         CGFloat percent = 1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
         uploadProgressBlock(percent,uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         [SVProgressHUD dismiss];
         succeedBlock(task,responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [SVProgressHUD dismiss];
         [SVProgressHUD showErrorWithStatus:@"上传失败"];
//         failedBlock(task,error);
         NSLog(@"请求失败：%@",error);
     }];
}


+ (void)startRequestTas:(NSString *)url
         parametersDict:(NSDictionary *)parameters
           succeedBlock:(void(^)(id task, id responseObject))succeedBlock
            failedBlock:(void(^)(id task, NSError *error))failedBlock
    uploadProgressBlock:(void(^)(float uploadPercent,long long totalBytesWritten,long long totalBytesExpectedToWrite))uploadProgressBlock{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [userDefaults objectForKey:@"KEY_USER_TOKEN"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    [manager setSecurityPolicy:[Factory customSecurityPolicy]];//此处为适配https设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        CGFloat percent = 1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        uploadProgressBlock(percent,uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        succeedBlock(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"上传失败"];
        //         failedBlock(task,error);
        NSLog(@"请求失败：%@",error);
    }];
}

@end
