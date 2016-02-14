//
//  SignupViewController.m
//  Graduation Design
//
//  Created by ziwen.xi on 16/2/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "SignupViewController.h"
#import "Masonry.h"

@interface SignupViewController ()

@property (nonatomic , strong) UITextField* tfAccount;
@property (nonatomic , strong) UITextField* tfPwd;

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
    self.tfAccount.placeholder = @"请输入手机号";
    self.tfAccount.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfAccount.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfAccount.keyboardType = UIKeyboardTypeNumberPad;
    self.tfAccount.delegate = self;
    self.tfAccount.backgroundColor=[UIColor whiteColor];
    [viewAccountPassword addSubview:self.tfAccount];
    
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
    [self.view addSubview:btnLogin];
    
    
    
    [viewAccountPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(74);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(140);
    }];
    
    [labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewAccountPassword).with.offset(20);
        make.left.equalTo(viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [labelPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelAccount.mas_bottom).with.offset(20);
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
    
    [self.tfPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfAccount.mas_bottom).with.offset(30);
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


@end
