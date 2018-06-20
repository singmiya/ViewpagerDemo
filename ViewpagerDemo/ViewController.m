//
//  ViewController.m
//  ViewpagerDemo
//
//  Created by Somiya on 14/06/2018.
//  Copyright © 2018 Somiya. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "ViewpagerView.h"

@interface ViewController ()<ViewpagerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@{@"title":@"tup岛海滩海景甲米泰国", @"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529157901912&di=a67a5e116cd0f3aa02fc38afa4cdf372&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F83025aafa40f4bfb978dd06f084f78f0f73618af.jpg"},
                     @{@"title":@"长城·梅景", @"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529157973866&di=0a141893c5fbca22974ddf36b39b71b7&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9213b07eca806538c066018c9bdda144ac3482a5.jpg"},
                     @{@"title":@"湿地风光", @"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529157973865&di=7b67696df8b748f5327c6081ee6dd42b&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F58ee3d6d55fbb2fb6bb16f89434a20a44723dc96.jpg"},
                     @{@"title":@"摄影师雨夜箫声", @"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529158039641&di=b165e769ef52afb2c58d540d4e92c3b5&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff2deb48f8c5494ee696dd58621f5e0fe98257ee6.jpg"}
                    ];
    
    ViewpagerView *viewpager = [[ViewpagerView alloc] initViewpagerViewWith:CGRectMake(0, 0, SCREEN_WIDTH, self.view.bounds.size.height)  dataSource:arr viewStyle:ViewpagerViewStyleDefault andBottomStyle:BottomViewStyleDefault | BottomViewStylePageControlCenter | BottomViewStylePageControlCircle];
    viewpager.delegate = self;
    [viewpager setPageControlDisplayColor:RGBA(29, 108, 199, 1)];
    [viewpager setPageControlNormalColor:[UIColor redColor]];
    [self.view addSubview:viewpager];
}

#pragma mark ---------------- ViewpagerViewDelegate ----------------
- (void)viewpagerView:(ViewpagerView *)viewpagerView didSelectPage:(NSInteger)index {
    NSLog(@"xxxx %ld", index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
