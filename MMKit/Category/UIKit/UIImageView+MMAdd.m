//
//  UIImageView+MMAdd.m
//  MMKitDemo
//
//  Created by xueMingLuan on 2018/2/28.
//  Copyright © 2018年 mille. All rights reserved.
//

#import "UIImageView+MMAdd.h"
#import <YYWebImage/YYWebImage.h>

@implementation UIImageView (MMAdd)

+ (UIImageView *)imageViewWithSuperView:(UIView *)superView
                             constraint:(void (^)(MASConstraintMaker *))constraint
                          configHandler:(void (^)(UIImageView *))configHandler
{
    return [UIImageView imageViewWithImage:nil
                                 superView:superView
                                constraint:constraint
                             configHandler:configHandler];
}

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                              superView:(UIView *)superView
                             constraint:(void (^)(MASConstraintMaker *))constraint
                          configHandler:(void (^)(UIImageView *))configHandler
{
    return [UIImageView imageViewWithImage:[UIImage imageNamed:imageName]
                                 superView:superView
                                constraint:constraint
                             configHandler:configHandler];
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image
                          superView:(UIView *)superView
                         constraint:(void (^)(MASConstraintMaker *))constraint
                      configHandler:(void (^)(UIImageView *))configHandler
{
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    [superView addSubview:imageView];
    [imageView mas_makeConstraints:constraint];
    
    if (configHandler) {
        configHandler(imageView);
    }
    
    return imageView;
}

+ (UIImageView *)imageViewWithImageUrl:(NSString *)imageUrlStr
                             superView:(UIView *)superView
                            constraint:(void (^)(MASConstraintMaker *))constraint
                         configHandler:(void (^)(UIImageView *))configHandler
{
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    NSString *encodedUrlStr = [imageUrlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *imageUrl = [NSURL URLWithString:encodedUrlStr];
    [imageView yy_setImageWithURL:imageUrl options:1 << 0];
    [superView addSubview:imageView];
    [imageView mas_makeConstraints:constraint];
    
    if (configHandler) {
        configHandler(imageView);
    }
    
    return imageView;
}
@end
