# ViewpagerViewDemo
图片轮播

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
    ViewpagerView *viewpager = [[ViewpagerView alloc] initViewpagerViewWith:CGRectMake(0, 100, SCREEN_WIDTH, 200) style:ViewpagerViewStyleDefault andDataSource:arr];
    viewpager.delegate = self;
    [self.view addSubview:viewpager];
```
3. 点击事件委托，遵守`ViewpagerViewDelegate`
```
- (void)viewpagerView:(ViewpagerView *)viewpagerView didSelectPage:(NSInteger)index {
    NSLog(@"xxxx %ld", index);
}
```

## TODO
这是个只是图片轮播的简单应用，后续还会添加更多的轮播样式

