//
// Created by Seijiro on 2013/07/04.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface UIImage (Mask)

/**
* マスク画像を生成する
*  @param  maskColor  マスクカラー
*  @return マスクイメージ
*/
- (UIImage *)generateMaskImage:(UIColor *)maskColor;

@end