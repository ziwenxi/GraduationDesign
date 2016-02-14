//
//  LoginViewController.m
//  Graduation Design
//
//  Created by ziwen.xi on 16/2/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"

#import "ViewController.h"
#import "SignupViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"main";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMainView];
}

-(void)initMainView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton* btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.translatesAutoresizingMaskIntoConstraints = NO;
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLogin setBackgroundColor:[UIColor redColor]];
    btnLogin.layer.cornerRadius = 4.0;
    [btnLogin addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.clipsToBounds = YES;
    [self.view addSubview:btnLogin];
    
    UIButton* btnSignup = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSignup.translatesAutoresizingMaskIntoConstraints = NO;
    btnSignup.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSignup setTitle:@"注册" forState:UIControlStateNormal];
    [btnSignup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnSignup setBackgroundColor:[UIColor redColor]];
    btnSignup.layer.cornerRadius = 4.0;
    [btnSignup addTarget:self action:@selector(buttonClickedq:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSignup];
    
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(114);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(btnSignup.mas_left).with.offset(-20);
        make.height.mas_equalTo(40);
        make.width.equalTo(btnSignup);
    }];
    
    [btnSignup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(114);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    
}

-(void)buttonClicked:(id)sender{
    ViewController *loginViewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:loginViewController animated:YES];
}

-(void)buttonClickedq:(id)sender{
    SignupViewController *signupViewController = [[SignupViewController alloc] init];
    [self.navigationController pushViewController:signupViewController animated:YES];
}


@end
