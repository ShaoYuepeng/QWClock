//
//  clockView.m
//  情趣时钟
//
//  Created by 邵 on 15/10/24.
//  Copyright © 2015年 邵. All rights reserved.
//

#import "clockView.h"

#define angle2Radio(angle) ((angle) / 180.0 * M_PI)
#define perSecondA 6
#define perMinA 6
#define perHourA 30
#define perMinHourA 0.5


@implementation clockView
-(void)awakeFromNib
{
    [self setUpSecond];
    [self setMinLayer];
    [self setHourLayer];
    //添加一个定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];


    self.layer.cornerRadius = self.bounds.size.width*0.5;

}
-(void)setUpSecond
{
    CALayer *secLayer = [CALayer layer];
    secLayer.backgroundColor = [UIColor redColor].CGColor;
    secLayer.bounds = CGRectMake(0, 0, 1, 95);
    secLayer.anchorPoint = CGPointMake(0.5, 0.9);
    secLayer.position = CGPointMake(self.clockV.bounds.size.width * 0.5, self.clockV.bounds.size.height * 0.5);
    self.secLayer = secLayer;
    [self.clockV.layer addSublayer:secLayer];


}

-(void)setMinLayer
{
    CALayer *minLayer = [CALayer layer];
    minLayer.backgroundColor = [UIColor blackColor].CGColor;
    minLayer.bounds = CGRectMake(0, 0, 1.5, 85);
    minLayer.anchorPoint = CGPointMake(0.5, 0.9);
    minLayer.position = CGPointMake(self.clockV.bounds.size.width * 0.5, self.clockV.bounds.size.height * 0.5);
    self.minLayer = minLayer;
    [self.clockV.layer addSublayer:minLayer];
    
    
}

-(void)setHourLayer
{
    CALayer *hourLayer = [CALayer layer];
    hourLayer.backgroundColor = [UIColor blackColor].CGColor;
    hourLayer.bounds = CGRectMake(0, 0, 2, 75);
    hourLayer.anchorPoint = CGPointMake(0.5, 0.9);
    hourLayer.position = CGPointMake(self.clockV.bounds.size.width * 0.5, self.clockV.bounds.size.height * 0.5);
    self.hourLayer = hourLayer;
    [self.clockV.layer addSublayer:hourLayer];
    
    
}
- (void)timeChange{
    
    //让秒针开始旋转.
    //获取当前的日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日历当中的哪些组件,年,月,日,时,分,秒...
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    //获取当前是多少秒.
    NSInteger curSec = cmp.second;
    //计算当前秒针旋转的角度
    CGFloat sceAngle = curSec * perSecondA;
    self.secLayer.transform = CATransform3DMakeRotation(angle2Radio(sceAngle), 0, 0, 1);
    
    //让分针开始旋转
    //获取当前是多少分.
    NSInteger curMin = cmp.minute;
    //计算当前分针旋转的角度
    CGFloat minAngle = curMin * perMinA;
    self.minLayer.transform = CATransform3DMakeRotation(angle2Radio(minAngle), 0, 0, 1);
    
    //让时针开始旋转
    //获取当前是多少小时
    NSInteger curHour = cmp.hour;
    //计算当前时针旋转的角度
    CGFloat hourAngle = curHour * perHourA + curMin * perMinHourA;
    self.hourLayer.transform = CATransform3DMakeRotation(angle2Radio(hourAngle), 0, 0, 1);
    
}



@end
