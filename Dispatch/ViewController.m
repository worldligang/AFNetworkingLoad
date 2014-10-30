//
//  ViewController.m
//  Dispatch
//
//  Created by iOSDevTip on 14-10-20.
//  Copyright (c) 2014年 http://iswifting.com All rights reserved.
//

// 微信公众账号：iOSDevTip
// http://iswifting.com  swift学习社区


#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"

#import "DownLoadOperation.h"



#define Vedio @""

#define Picture @"http://www.iswifting.com/data/attachment/forum/201406/09/111059two4joxwz3oo3duj.jpg"
//    http://b.hiphotos.baidu.com/image/h%3D1200%3Bcrop%3D0%2C0%2C1920%2C1200/sign=b284ea7541a98226a7c12f25bab28262/960a304e251f95ca8888fab6cb177f3e670952b4.jpg

@interface ViewController ()
{
    DownLoadOperation *_downLoadOperation;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.progressView setProgress:0 animated:NO];


}

- (IBAction)resume:(id)sender
{
    [_downLoadOperation.requestOperation resume];
    
}



- (IBAction)pasuse:(id)sender
{
    [_downLoadOperation.requestOperation pause];
    
}



- (IBAction)download:(id)sender
{
    
    
    
    
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp"];
    NSLog(@"path = %@",path);
    _downLoadOperation = [[DownLoadOperation alloc] init];
    [_downLoadOperation downloadWithUrl:Picture
                     cachePath:^NSString *{
                         return path;
                     } progressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
                         
                         NSLog(@"bytesRead = %ld ,totalBytesRead = %llu totalBytesExpectedToRead = %llu",bytesRead,totalBytesRead,totalBytesExpectedToRead);
                         float progress = totalBytesRead / (float)totalBytesExpectedToRead;
                         
                         [self.progressView setProgress:progress animated:YES];
                         
                         [self.label setText:[NSString stringWithFormat:@"%.2f%%",progress*100]];
                         UIImage* image = [UIImage imageWithData:_downLoadOperation.requestOperation.responseData];
                         [self.imageView setImage:image];
                         
                     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         
                         NSLog(@"success");
                         UIImage* image = [UIImage imageWithData:operation.responseData];
                         [self.imageView setImage:image];
                         
                     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         NSLog(@"error = %@",error);
                     }];

    
    
}
- (IBAction)dispatch_click:(id)sender {
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
