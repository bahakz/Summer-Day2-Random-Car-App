//
//  ViewController.m
//  Summer School Day 2 Random Car App
//
//  Created by Bakytzhan Baizhikenov on 6/4/15.
//  Copyright (c) 2015 Bakytzhan Baizhikenov. All rights reserved.
//

#import "ViewController.h"
#import "AddNewCarViewController.h"
#import "Car.h"
#import "DisplayCarViewController.h"

@interface ViewController () <AddNewCarViewController>

@property (strong, nonatomic) IBOutlet UIImageView *carImageView;
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *modelLabel;

@property (strong, nonatomic) NSMutableArray *cars;
@property (nonatomic) long long currentCarIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Car *car1 = [Car new];
    car1.make = @"BMW";
    car1.model = @"X6";
    car1.picture = [UIImage imageNamed:@"bmw.jpg"];
    Car *car2 = [Car new];
    car2.make = @"Mercedes";
    car2.model = @"S class";
    car2.picture = [UIImage imageNamed:@"mercedes.jpg"];
    Car *car3 = [Car new];
    car3.make = @"Lexus";
    car3.model = @"LX 570";
    car3.picture = [UIImage imageNamed:@"lexus.jpg"];
    Car *car4 = [Car new];
    car4.make = @"Toyota";
    car4.model = @"Sequoia";
    car4.picture = [UIImage imageNamed:@"toyota.jpg"];
    Car *car5 = [Car new];
    car5.make = @"Audi";
    car5.model = @"A8";
    car5.picture = [UIImage imageNamed:@"audi.jpg"];
    
    self.cars = [[NSMutableArray alloc] initWithObjects:car1, car2, car3, car4, car5, nil];
    
    self.currentCarIndex = 0;
    [self setupCar];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddNewCarViewController class]])
    {
        AddNewCarViewController *nextVC = segue.destinationViewController;
        nextVC.delegate = self;
    }
    
    if ([segue.destinationViewController isKindOfClass:[DisplayCarViewController class]]) {
        DisplayCarViewController *nextVC = segue.destinationViewController;
        nextVC.car = self.cars[self.currentCarIndex];
    }
}

-(void)didAddCar:(Car *)newCar
{
    [self.cars addObject:newCar];
    self.currentCarIndex = self.cars.count - 1;
    [self setupCar];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) setupCar
{
    Car *car = self.cars[self.currentCarIndex];
    self.carImageView.image = car.picture;
    self.makeLabel.text = car.make;
    self.modelLabel.text = car.model;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
    self.currentCarIndex = random() % self.cars.count;
    [self setupCar];
}

@end
