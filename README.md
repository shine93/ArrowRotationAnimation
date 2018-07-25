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
