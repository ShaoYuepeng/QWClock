//
//  clockView.h
//  情趣时钟
//
//  Created by 邵 on 15/10/24.
//  Copyright © 2015年 邵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface clockView : UIView

@property(nonatomic, weak) IBOutlet UIImageView *clockV;
//添加秒针
@property(nonatomic, weak) CALayer *secLayer;
//添加分针
@property(nonatomic, weak) CALayer *minLayer;
//添加时针
@property(nonatomic, weak) CALayer *hourLayer;
@end
