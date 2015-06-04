//
//  AddNewCarViewController.h
//  Summer School Day 2 Random Car App
//
//  Created by Bakytzhan Baizhikenov on 6/4/15.
//  Copyright (c) 2015 Bakytzhan Baizhikenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@protocol AddNewCarViewController <NSObject>
-(void) didAddCar: (Car *) newCar;
-(void) didCancel;
@end

@interface AddNewCarViewController : UIViewController
@property (weak) id<AddNewCarViewController> delegate;
@end
