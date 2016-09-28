//
//  ImageViewerController.m
//  RoullierApp
//
//  Created by heroz_f on 16/1/9.
//  Copyright © 2016年 Roullier. All rights reserved.
//

#import "ImageViewerController.h"
#import "UIImageView+WebCache.h"

@interface ImageViewerController()<UIScrollViewDelegate>{
    NSString *_nameStr;
    UIImageView *_imageView;
    UIScrollView *_backScroll;
}
@end

@implementation ImageViewerController

- (id)initWithNameStr:(NSString*)nameStr
{
    if ([super init]) {
        _nameStr = nameStr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildBackgroundView];
    [self buildContents];
    [self buildLeftBar];
}

- (void)buildLeftBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"<返回" style: UIBarButtonItemStyleDone target:self action: @selector(backAction)];
}

- (void)buildContents
{
    _backScroll = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, _winSize.width, _winSize.height)];
    _backScroll.delegate = self;
    _backScroll.backgroundColor = [UIColor blackColor];
    _backScroll.maximumZoomScale = 2.5f;
    _backScroll.minimumZoomScale = 1.0f;
    _backScroll.showsHorizontalScrollIndicator = NO;
    _backScroll.showsVerticalScrollIndicator = NO;
    [_mainView addSubview: _backScroll];
    
    [AppTools progressShow: _mainView];
    
    _imageView = [[UIImageView alloc] init];
    NSString *nameStr = [NSString stringWithFormat: @"http://%@/getPhoto?id=%@",[AppTools getServerBase],_nameStr];
    [_imageView sd_setImageWithURL: [NSURL URLWithString: nameStr]
                  placeholderImage: [UIImage imageNamed: @"img_default_bg"]
                         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                     [self resetImageViewSize: image];
                     [AppTools progressHidden: _mainView];
                 }];
    [self resetImageViewSize: _imageView.image];
    [_backScroll addSubview: _imageView];
}

- (void)resetImageViewSize:(UIImage*)image
{
    float nWidth = _winSize.width;
    float nHeight = _winSize.width/image.size.width*image.size.height;
    _imageView.frame = CGRectMake(0, _winSize.height/2-nHeight/2, nWidth, nHeight);
    _backScroll.contentSize = _imageView.frame.size;
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated: NO];
}

#pragma UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    float offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width)*0.5:0.0;
    float offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height)*0.5f:0.0;
    _imageView.center = CGPointMake(scrollView.contentSize.width*0.5+offsetX,scrollView.contentSize.height*0.5f+offsetY);
}

@end
