//
//  AddNewCarViewController.m
//  Summer School Day 2 Random Car App
//
//  Created by Bakytzhan Baizhikenov on 6/4/15.
//  Copyright (c) 2015 Bakytzhan Baizhikenov. All rights reserved.
//

#import "AddNewCarViewController.h"

@interface AddNewCarViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *carImageView;
@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *modelTextField;

@end

@implementation AddNewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.carImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageViewTap:)];
    [self.carImageView addGestureRecognizer:singleTapRecognizer];
    // Do any additional setup after loading the view.
}

-(void) handleImageViewTap: (UITapGestureRecognizer *) tapGestureRecognizer
{
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (!image) image = info[UIImagePickerControllerEditedImage];
    self.carImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    
    Car *newCar = [Car new];
    newCar.make = self.makeTextField.text;
    newCar.model = self.modelTextField.text;
    newCar.picture = self.carImageView.image;
    
    [self.delegate didAddCar:newCar];
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
