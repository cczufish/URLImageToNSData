//
//  ViewController.m
//  yshdemo
//
//  Created by yushuhui on 15/7/2.
//  Copyright (c) 2015年 yushuhui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString* imgstr;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    img.image = [self loadWebImage];
    [self.view addSubview:img];
    
    
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:imgstr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 200, 200)];

    img1.image =[[UIImage alloc] initWithData:data];//根据图片数据流构造image
    [self.view addSubview:img1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 网络url图片－nsdata图片数据流－uiimage显示图片
 
 uiiamge－nsdata－（base64）nsstring保存图片
 
 其他地方加载（base64）nsstring图片 －－nsdata－－uiimage
 
 */
- (UIImage *) loadWebImage
{
    UIImage* image=nil;
    
    NSString* path =[NSString stringWithFormat: @"%@",@"http://wx.qlogo.cn/mmopen/q9UTH59ty0K1PRvIQkyydYMia4xN3gib2m2FGh0tiaMZrPS9t4yPJFKedOt5gDFUvM6GusdNGWOJVEqGcSsZjdQGKYm9gr60hibd/0"];
    
    NSURL* url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];//网络图片url
    
    
    NSData* data = [NSData dataWithContentsOfURL:url];//获取网络图片

    
    if(data!=nil)
    {
        image = [[UIImage alloc] initWithData:data];//根据图片数据流构造image
    }
    
    NSData *dataImage = [[NSData alloc] init];
    dataImage = UIImagePNGRepresentation(image);
    
    NSString *stringImage = [dataImage base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    imgstr = stringImage;
    
    return image;
}



@end
