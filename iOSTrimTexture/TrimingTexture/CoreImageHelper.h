//
//  CoreImageHelper.h
//  TrimingTexture
//
//  Created by Seijiro on 2013/07/08.
//  Copyright (c) 2013年 Seijiro. All rights reserved.
//

@interface CoreImageHelper : NSObject


/* アスペクトサイズを維持してリサイズ */
+ (void)resizeAspectFitImageWithImage:(UIImage*)img atSize:(CGFloat)size completion:(void(^)(UIImage*))completion;

/* 画像の中央からトリミング */
+ (void)centerCroppingImageWithImage:(UIImage*)img atSize:(CGSize)size completion:(void(^)(UIImage*))completion;

/* CIImageからUIImageを作成 */
+ (UIImage*)uiImageFromCIImage:(CIImage*)ciImage;



@end
