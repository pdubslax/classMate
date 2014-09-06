//
//  ViewController.m
//  classMate
//
//  Created by Patrick Wilson on 9/5/14.
//  Copyright (c) 2014 Patrick Wilson. All rights reserved.
//

#import "ViewController.h"
#import "WIZStudentQueryViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *topButton;
@property (nonatomic,strong) UIButton *bottomButton;

@end

@implementation ViewController

#define centerFrame CGRectMake(30,[[UIScreen mainScreen] bounds].size.height/2-130,260,260)


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureUI{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.topButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 15, 260,260)];
    self.bottomButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 290,260,260)];
    [self.topButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.bottomButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    
    [self.topButton setImage:[UIImage imageNamed:@"wiz"] forState:UIControlStateNormal];
    [self.bottomButton setBackgroundImage:[UIImage imageNamed:@"student"] forState:UIControlStateNormal];
    //[topButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    //[bottomButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [self.topButton addTarget:self action:@selector(wizard:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomButton addTarget:self action:@selector(boy:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.topButton];
    [self.view addSubview:self.bottomButton];
}

- (void)wizard:(UIButton*)button{

    
    [UIView animateWithDuration:0.2f animations:^{
        self.bottomButton.alpha=0;
    }];
    
    [UIView animateWithDuration:1.0f animations:^{
        button.frame = centerFrame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 3, 3);
            button.alpha=0;
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}

- (void)boy:(UIButton*)button{
    
    
    [UIView animateWithDuration:0.2f animations:^{
        self.topButton.alpha=0;
    }];
    
    [UIView animateWithDuration:1.0f animations:^{
        button.frame = centerFrame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 3, 3);
            button.alpha=0;
        } completion:^(BOOL finished) {
            WIZStudentQueryViewController *vc = [[WIZStudentQueryViewController alloc] init];
            [self presentViewController:vc animated:NO completion:nil];
        }];
    }];

}



@end
