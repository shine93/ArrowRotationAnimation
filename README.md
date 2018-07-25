# ArrowRotationAnimation
arrow guide animation

两种方式来实现箭头根据路径旋转的动画

第一种（master分支）：组合的思想
1. 让路径旋转的动画  
2. 让箭头图片旋转的动画 
3. 两者组合在一起就能实现

实现效果如下：

![arrow animation](https://github.com/shine93/ArrowRotationAnimation/blob/master/XXImageViewMoveWithPath/New%20Group/Images/imageViewMoveWithPath.gif)

关键代码:
```
//rotationMode让imageView根据路径自动旋转，这个很神奇了
keyAnimation.rotationMode = "auto"
```

第二种方法：又一个仓库[XXCycleProcessAnimation](https://github.com/shine93/XXCycleProcessAnimation/tree/master)

效果如图：
![XXCycleProcessAnimation](https://github.com/shine93/XXCycleProcessAnimation/blob/master/XXCycleProcessAnimation/XXCycleProcessAnimation.gif)

关键代码：

根据画弧的进度，计算箭头的旋转角度
```
_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(progress)];
[_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
```

```
- (void)progress{
    _progress += 0.3/60;
    
    //半径
    CGFloat radius = (100 - 4) * 0.5;
    //旋转角度
    CGFloat rotation = M_PI  * _progress;
    [_path removeAllPoints];
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [_path addArcWithCenter:(CGPoint){100 * 0.5, 100 * 0.5} radius:radius startAngle:-M_PI  endAngle: -M_PI + rotation clockwise:YES];
    _shapeLayer.path = _path.CGPath;
    
    //根据角度算箭头位置, 求出圆周上的点
    _arrow.transform = CGAffineTransformMakeRotation(rotation);
    _arrow.center = CGPointMake(150 - radius * cos(rotation) , 150 - radius * sin(rotation));
    
    if (_progress >= 1.0) {
        _progress = 0;
    }
}
```

