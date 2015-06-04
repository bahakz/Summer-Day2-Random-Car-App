//
//  DisplayCarViewController.h
//  Summer School Day 2 Random Car App
//
//  Created by Bakytzhan Baizhikenov on 6/4/15.
//  Copyright (c) 2015 Bakytzhan Baizhikenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface DisplayCarViewController : UIViewController

@property (strong, nonatomic) Car *car;
@property (strong, nonatomic) UIImageView *imageView;

@end
