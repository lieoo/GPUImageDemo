//
//  VideoViewController.m
//  GpuImageDemo
//
//  Created by lieoo on 11/03/2017.
//  Copyright © 2017 刘星佐. All rights reserved.
//

#import "VideoViewController.h"
#import "GPUImage.h"
#import "GPUImageBeautifyFilter.h"

@interface VideoViewController ()

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;
@property (nonatomic, strong) GPUImageView *videoPreview;

@property (nonatomic, strong) UISwitch *beautiful;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPUImageVideoCamera *videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionBack];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    // 创建预览View
    GPUImageView *videoPreview = [[GPUImageView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:videoPreview atIndex:0];
    
    // 添加预览图层到源
    [videoCamera addTarget:videoPreview];
    
    // 开始采集视频
    [videoCamera startCameraCapture];
    
    self.videoCamera = videoCamera;
    self.videoPreview = videoPreview;
    [self.view addSubview:self.beautiful];


}
- (UISwitch *)beautiful
{
    if (!_beautiful)
    {
        _beautiful = [[UISwitch alloc] init];
        [_beautiful sizeToFit];
        _beautiful.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2);
        [_beautiful addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    }
    return _beautiful;
}

- (void)change:(UISwitch *)sw
{
    if(sw.on)
    {
        [_videoCamera removeAllTargets];
        GPUImageBeautifyFilter *fiter = [[GPUImageBeautifyFilter alloc] init];
        //美颜滤镜 这里是根据 https://github.com/Guikunzhi/BeautifyFaceDemo 去设置
        [_videoCamera addTarget:fiter];
        [fiter addTarget:self.videoPreview];
    }
    else
    {
        [_videoCamera removeAllTargets];
        [_videoCamera addTarget:self.videoPreview];
    }
}

@end
