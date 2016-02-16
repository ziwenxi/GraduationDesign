//
//  ModifyPasswordViewController.m
//  GraduationDesign
//
//  Created by ziwen.xi on 16/2/15.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ModifyPasswordViewController.h"


@interface ModifyPasswordViewController ()

@property (nonatomic , strong) UITextField* tfEmail;

@property (nonatomic , strong) UIAlertController* alertController;

@end

@implementation ModifyPasswordViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"modifypsd";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initMainView];
}

- (void)initMainView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* labelEmail = [[UILabel alloc]init];
    labelEmail.textColor = [UIColor blackColor];
    labelEmail.font = [UIFont systemFontOfSize:16];
    labelEmail.text =@"email";
    [self.view addSubview:labelEmail];
    
    
    self.tfEmail = [[UITextField alloc] init];
    self.tfEmail.font = [UIFont systemFontOfSize:16];
    self.tfEmail.textColor = [UIColor blackColor];
    self.tfEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfEmail.placeholder = @"请输入邮箱地址";
    self.tfEmail.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfEmail.delegate = self;
    self.tfEmail.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.tfEmail];
    
    
    UIButton* btnModifyPsd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnModifyPsd.translatesAutoresizingMaskIntoConstraints = NO;
    [btnModifyPsd setTitle:@"修改密码" forState:UIControlStateNormal];
    [btnModifyPsd setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnModifyPsd setBackgroundColor:[UIColor redColor]];
    btnModifyPsd.layer.cornerRadius = 4.0;
    [btnModifyPsd addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnModifyPsd.clipsToBounds = YES;
    btnModifyPsd.tag = @"modifypsd";
    [self.view addSubview:btnModifyPsd];
    
    
    [labelEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(70);
        make.left.equalTo(self.view).with.offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.tfEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(70);
        make.left.equalTo(labelEmail.mas_right).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(150);
    }];
    
    [btnModifyPsd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelEmail.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
}

-(void)buttonClicked:(UIButton*)sender{
    if (sender.tag == @"modifypsd") {
        
        [AVUser requestPasswordResetForEmailInBackground:self.tfEmail.text
                                                   block:^(BOOL succeeded, NSError *error) {
                                                       if (succeeded) {
                                                           
                                                           self.alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"已发送邮件至邮箱" preferredStyle:UIAlertControllerStyleAlert];
                                                           UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                                                           [self.alertController addAction:okAction];
                                                           [self presentViewController:self.alertController animated:YES completion:nil];
                                                           
                                                       } else {
                                                           
                                                           self.alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"无此邮箱" preferredStyle:UIAlertControllerStyleAlert];
                                                           UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                                                           [self.alertController addAction:okAction];
                                                           [self presentViewController:self.alertController animated:YES completion:nil];
                                                           
                                                       }
                                                   }];
    }
}



@end
