# ViewpagerViewDemo
图片轮播
[参考文章](https://juejin.im/post/5b2a86bae51d4558b64f1673)

## 效果
![](https://github.com/singmiya/ViewpagerDemo/blob/master/demo.gif)

## 用法
1. 数据源格式：
```
NSArray *arr = @[
				@{@"image":@"", @"title:@""}, 
				@{@"image":@"", @"title":@""}, 
				@{@"image":@"", @"title":@""}
				]
```

> 其中image和title这这个key是必须的。

2. 初始化代码
```
    ViewpagerView *viewpager = [[ViewpagerView alloc] initViewpagerViewWith:CGRectMake(0, 0, SCREEN_WIDTH, 120)  dataSource:arr viewStyle:ViewpagerViewStyleDefault andBottomStyle:BottomViewStyleDefault | BottomViewStylePageControlCenter | BottomViewStylePageControlCircle | BottomViewStylePageControlFeatureScale];
    viewpager.delegate = self;
    [viewpager setPageControlDisplayColor:[UIColor redColor]];
    [self.view addSubview:viewpager];
```
3. 点击事件委托，遵守`ViewpagerViewDelegate`
```
- (void)viewpagerView:(ViewpagerView *)viewpagerView didSelectPage:(NSInteger)index {
    NSLog(@"xxxx %ld", index);
}
```

## 新特性支持
* 添加page control样式


