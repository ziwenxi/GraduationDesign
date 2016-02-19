//
//  SignupViewController.m
//  Graduation Design
//
//  Created by ziwen.xi on 16/2/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@property (nonatomic , strong) UIView* viewAccountPassword;
@property (nonatomic , strong) UITextField* tfAccount;
@property (nonatomic , strong) UITextField* tfEmail;
@property (nonatomic , strong) UITextField* tfPwd;
@property (nonatomic , strong) UITextField* tfPhone;
@property (nonatomic , strong) UILabel* labelAccount;
@property (nonatomic , strong) UILabel* labelEmail;
@property (nonatomic , strong) UILabel* labelPhone;
@property (nonatomic , strong) UILabel* labelPwd;

@property (nonatomic , strong) UIButton* btnSignup;
@property (nonatomic , strong) UIButton* btnPhoneSignup;

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
    
    self.viewAccountPassword = [[UIView alloc] init];
    self.viewAccountPassword.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.viewAccountPassword];
    
    self.labelPhone = [[UILabel alloc]init];
    self.labelPhone.textColor = [UIColor blackColor];
    self.labelPhone.font = [UIFont systemFontOfSize:16];
    self.labelPhone.text =@"手机号";
    self.labelPhone.hidden = YES;
    [self.viewAccountPassword addSubview:self.labelPhone];
    
    
    self.labelAccount = [[UILabel alloc]init];
    self.labelAccount.textColor = [UIColor blackColor];
    self.labelAccount.font = [UIFont systemFontOfSize:16];
    self.labelAccount.text =@"账号";
    [self.viewAccountPassword addSubview:self.labelAccount];
    
    self.labelEmail = [[UILabel alloc]init];
    self.labelEmail.textColor = [UIColor blackColor];
    self.labelEmail.font = [UIFont systemFontOfSize:16];
    self.labelEmail.text =@"email";
    [self.viewAccountPassword addSubview:self.labelEmail];
    
    self.labelPwd = [[UILabel alloc]init];
    self.labelPwd.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelPwd.textColor = [UIColor blackColor];
    self.labelPwd.font = [UIFont systemFontOfSize:16];
    self.labelPwd.text = @"密码";
    [self.viewAccountPassword addSubview:self.labelPwd];
    
    
    self.tfPhone = [[UITextField alloc] init];
    self.tfPhone.font = [UIFont systemFontOfSize:16];
    self.tfPhone.textColor = [UIColor blackColor];
    self.tfPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfPhone.placeholder = @"请输入手机号";
    self.tfPhone.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfPhone.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfPhone.keyboardType = UIKeyboardTypeNumberPad;
    self.tfPhone.delegate = self;
    self.tfPhone.backgroundColor=[UIColor whiteColor];
    self.tfPhone.hidden = YES;
    [self.viewAccountPassword addSubview:self.tfPhone];
    
    self.tfAccount = [[UITextField alloc] init];
    self.tfAccount.font = [UIFont systemFontOfSize:16];
    self.tfAccount.textColor = [UIColor blackColor];
    self.tfAccount.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfAccount.placeholder = @"请输入用户名";
    self.tfAccount.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfAccount.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfAccount.delegate = self;
    self.tfAccount.backgroundColor=[UIColor whiteColor];
    [self.viewAccountPassword addSubview:self.tfAccount];
    
    
    self.tfEmail = [[UITextField alloc] init];
    self.tfEmail.font = [UIFont systemFontOfSize:16];
    self.tfEmail.textColor = [UIColor blackColor];
    self.tfEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tfEmail.placeholder = @"请输入邮箱地址";
    self.tfEmail.translatesAutoresizingMaskIntoConstraints = NO;
    self.tfEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    self.tfEmail.delegate = self;
    self.tfEmail.backgroundColor=[UIColor whiteColor];
    [self.viewAccountPassword addSubview:self.tfEmail];
    
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
    [self.viewAccountPassword addSubview:self.tfPwd];
    
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
    
    
    UIButton* btnAccountLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAccountLogin.translatesAutoresizingMaskIntoConstraints = NO;
    [btnAccountLogin setTitle:@"普通注册" forState:UIControlStateNormal];
    [btnAccountLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnAccountLogin setBackgroundColor:[UIColor yellowColor]];
    [btnAccountLogin addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnAccountLogin.clipsToBounds = YES;
    btnAccountLogin.tag = @"accsignup";
    [self.view addSubview:btnAccountLogin];
    
    UIButton* btnPhoneLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPhoneLogin.translatesAutoresizingMaskIntoConstraints = NO;
    [btnPhoneLogin setTitle:@"手机注册" forState:UIControlStateNormal];
    [btnPhoneLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnPhoneLogin setBackgroundColor:[UIColor brownColor]];
    [btnPhoneLogin addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnPhoneLogin.clipsToBounds = YES;
    btnPhoneLogin.tag = @"phonesignup";
    [self.view addSubview:btnPhoneLogin];

    
    
    [self.viewAccountPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(124);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(260);
    }];
    
    [self.labelPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewAccountPassword).with.offset(20);
        make.left.equalTo(self.viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelPhone.mas_bottom).with.offset(20);
        make.left.equalTo(self.viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.labelEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelAccount.mas_bottom).with.offset(20);
        make.left.equalTo(self.viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.labelPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelEmail.mas_bottom).with.offset(20);
        make.left.equalTo(self.viewAccountPassword).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    [self.tfPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewAccountPassword).with.offset(20);
        make.left.equalTo(self.labelAccount.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.tfAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfPhone.mas_bottom).with.offset(30);
        make.left.equalTo(self.labelAccount.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.tfEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfAccount.mas_bottom).with.offset(30);
        make.left.equalTo(self.labelEmail.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.tfPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfEmail.mas_bottom).with.offset(30);
        make.left.equalTo(self.labelPwd.mas_right).with.offset(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewAccountPassword.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    
    [btnAccountLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.viewAccountPassword.mas_top);
        make.left.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
    
    [btnPhoneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.viewAccountPassword.mas_top);
        make.left.equalTo(btnAccountLogin.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
    
}

-(void)buttonClicked:(UIButton*)sender{
    if (sender.tag == @"accsignup") {
        self.viewAccountPassword.backgroundColor = [UIColor yellowColor];
        self.tfPhone.hidden = YES;
        self.labelPhone.hidden = YES;
    }
    
    if (sender.tag == @"phonesignup") {
        self.viewAccountPassword.backgroundColor = [UIColor brownColor];
        self.tfPhone.hidden = NO;
        self.labelPhone.hidden = NO;
    }
    
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
