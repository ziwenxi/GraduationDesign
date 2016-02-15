//
//  SignupViewController.m
//  Graduation Design
//
//  Created by ziwen.xi on 16/2/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "SignupViewController.h"
#import "Masonry.h"
#import <AVOSCloud/AVOSCloud.h>

@interface SignupViewController ()

@property (nonatomic , strong) UITextField* tfAccount;
@property (nonatomic , strong) UITextField* tfEmail;
@property (nonatomic , strong) UITextField* tfPwd;

@property (nonatomic , strong) UIAlertController* alertController;

@end

@implementation SignupViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Signup";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMainView];
}


-(void)initMainView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView* viewAccountPassword = [[UIView alloc] init];
    viewAccountPassword.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:viewAccountPassword];
    
    UILabel* labelAccount = [[UILabel alloc]init];
    labelAccount.textColor = [UIColor blackColor];
    labelAccount.font = [UIFont systemFontOfSize:16];
    labelAccount.text =@"账号";
    [viewAccountPassword addSubview:labelAccount];
    
    UILabel* labelEmail = [[UILabel alloc]init];
    labelEmail.textColor = [UIColor blackColor];
    labelEmail.font = [UIFont systemFontOfSize:16];
    labelEmail.text =@"email";
    [viewAccountPassword addSubview:labelEmail];
    
    UILabel* labelPwd = [[UILabel alloc]init];
    labelPwd.translatesAutoresizingMaskIntoConstraints = NO;
    labelPwd.textColor = [UIColor blackColor];
    labelPwd.font = [UIFont systemFontOfSize:16];
    labelPwd.text = @"密码";
    [viewAccountPassword addSubview:labelPwd];
    
    self.tfAccount = [[UITextField alloc] init];
    self.tfAccount.font = [UIFont systemFontOfSize:16];
    self.tfAccount.textColor = [UIColor blackColor];
    self.tfAccount.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfAccount.placeholder = @"请输入用户名";
    self.tfAccount.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfAccount.autocorrectionType = UITextAutocorrectionTypeNo;
    //self.tfAccount.keyboardType = UIKeyboardTypeNumberPad;
    self.tfAccount.delegate = self;
    self.tfAccount.backgroundColor=[UIColor whiteColor];
    [viewAccountPassword addSubview:self.tfAccount];
    
    
    self.tfEmail = [[UITextField alloc] init];
    self.tfEmail.font = [UIFont systemFontOfSize:16];
    self.tfEmail.textColor = [UIColor blackColor];
    self.tfEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfEmail.placeholder = @"请输入邮箱地址";
    self.tfEmail.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfEmail.delegate = self;
    self.tfEmail.backgroundColor=[UIColor whiteColor];
    [viewAccountPassword addSubview:self.tfEmail];
    
    self.tfPwd = [[UITextField alloc] init];
    self.tfPwd.font = [UIFont systemFontOfSize:16];
    self.tfPwd.textColor = [UIColor blackColor];
    self.tfPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfPwd.placeholder = @"请输入密码";
    self.tfPwd.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfPwd.secureTextEntry = YES;     //每输入一个字符就变成点 用于密码输入
    self.tfPwd.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfPwd.returnKeyType = UIReturnKeyGo;
    self.tfPwd.delegate = self;
    self.tfPwd.backgroundColor=[UIColor whiteColor];
    [viewAccountPassword addSubview:self.tfPwd];
    
    UIButton* btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.translatesAutoresizingMaskIntoConstraints = NO;
    [btnLogin setTitle:@"注册" forState:UIControlStateNormal];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLogin setBackgroundColor:[UIColor redColor]];
    btnLogin.layer.cornerRadius = 4.0;
    [btnLogin addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.clipsToBounds = YES;
    btnLogin.tag = @"signup";
    [self.view addSubview:btnLogin];
    
    
    
    [viewAccountPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(74);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(200);
    }];
    
    [labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewAccountPassword).with.offset(20);
        make.left.equalTo(viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [labelEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelAccount.mas_bottom).with.offset(20);
        make.left.equalTo(viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [labelPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelEmail.mas_bottom).with.offset(20);
        make.left.equalTo(viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.tfAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewAccountPassword).with.offset(20);
        make.left.equalTo(labelAccount.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.tfEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfAccount.mas_bottom).with.offset(30);
        make.left.equalTo(labelEmail.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.tfPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfEmail.mas_bottom).with.offset(30);
        make.left.equalTo(labelPwd.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewAccountPassword.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    
}

-(void)buttonClicked:(UIButton*)sender{
    if (sender.tag == @"signup") {
        
        
        AVUser *user = [AVUser user];
//        user.username = @"hjiang";
//        user.password =  @"f32@ds*@&dsa";
//        user.email = @"hang@leancloud.rocks";
        
        user.username = self.tfAccount.text;
        user.email = self.tfEmail.text;
        user.password = self.tfPwd.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"success");
                self.alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                [self.alertController addAction:okAction];
                [self presentViewController:self.alertController animated:YES completion:nil];
            } else {
                NSLog(@"error");
                self.alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"账户或email不唯一" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                [self.alertController addAction:okAction];
                [self presentViewController:self.alertController animated:YES completion:nil];
            }
        }];
    }
}

@end
