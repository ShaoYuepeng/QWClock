//
//  DialVC.m
//  情趣时钟
//
//  Created by 邵 on 15/10/25.
//  Copyright © 2015年 邵. All rights reserved.
//

#import "DialVC.h"

@interface DialVC ()
@property (weak, nonatomic) IBOutlet UIImageView *clockIV;

/** 定时器.*/
@property (nonatomic ,weak) CADisplayLink *link;

@end

@implementation DialVC

-(CADisplayLink *)link{
    
    if (_link == nil) {
        //添加定时器.
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _link = link;
    }
    return _link;
}

- (void)update{
    
    //让转盘开始旋转
    self.clockIV.transform = CGAffineTransformRotate(self.clockIV.transform, M_PI / 36.0);
    
}

- (IBAction)beginBtn:(id)sender {
    
    [self begin];
    
    
}
- (IBAction)stopBtn:(id)sender {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self stop];
//    });
    
    
   
}

//开始旋转
- (void)begin{
    
//    //创建动画对象
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    //设置动画的属性值
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI * 2);
//    
//    anim.repeatCount = MAXFLOAT;
//    anim.duration = 3;
//    
//    [self.clockIV.layer addAnimation:anim forKey:nil];
    self.link.paused = NO;
    
    
}

//暂停
- (void)stop{
    
    self.link.paused = YES;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
