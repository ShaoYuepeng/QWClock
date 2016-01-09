//
//  imageV.m
//  情趣时钟
//
//  Created by 邵 on 15/10/24.
//  Copyright © 2015年 邵. All rights reserved.
//

#import "imageV.h"

@implementation imageV

-(void)awakeFromNib{

    //创建动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    //设置动画属性值
    anim.keyPath = @"transform.scale";
    anim.toValue = @2;
    //设置动画的执行次数
    anim.repeatCount = MAXFLOAT;
    //自动反转(怎么去,怎么回来)
    anim.autoreverses = YES;
    //设置动画的执行时长.
    anim.duration = 0.25;
    
    //添加动画
    [self.imageV.layer addAnimation:anim forKey:nil];
    
    self.layer.cornerRadius = 10;

    



}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   }


@end
