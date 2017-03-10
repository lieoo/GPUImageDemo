//
//  GPUImageBeautifyFilter.h
//  GpuImageDemo
//
//  Created by lieoo on 11/03/2017.
//  Copyright © 2017 刘星佐. All rights reserved.
//

#import <GPUImage/GPUImage.h>
@class GPUImageCombinationFilter;

@interface GPUImageBeautifyFilter : GPUImageFilterGroup {
    GPUImageBilateralFilter *bilateralFilter;
    GPUImageCannyEdgeDetectionFilter *cannyEdgeFilter;
    GPUImageCombinationFilter *combinationFilter;
    GPUImageHSBFilter *hsbFilter;
}
@end
