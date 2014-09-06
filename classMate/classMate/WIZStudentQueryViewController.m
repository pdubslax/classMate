//
//  WIZStudentQueryViewController.m
//  classMate
//
//  Created by Patrick Wilson on 9/6/14.
//  Copyright (c) 2014 Patrick Wilson. All rights reserved.
//

#import "WIZStudentQueryViewController.h"
#import <MLPAutoCompleteTextField/MLPAutoCompleteTextField.h>
#import <MLPAutoCompleteTextField/MLPAutoCompleteTextFieldDataSource.h>

@interface WIZStudentQueryViewController ()

@property (nonatomic,strong) MLPAutoCompleteTextField* fds;
@end

@implementation WIZStudentQueryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _fds = [[MLPAutoCompleteTextField alloc] initWithFrame:CGRectMake(30, 40, 320-60, 50)];
    [_fds setBorderStyle:UITextBorderStyleRoundedRect];
    [_fds setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:26.0f]];
    _fds.autocorrectionType = UITextAutocorrectionTypeNo;
    _fds.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    [_fds setReturnKeyType:UIReturnKeyDone];
    _fds.delegate = self;
    _fds.clearButtonMode = UITextFieldViewModeWhileEditing;
    
   
    
    [self.view addSubview:_fds];
    _fds.backgroundColor = [UIColor whiteColor];
    _fds.autoCompleteDataSource = self;
}

-(void)dismissKeyboard {
    [_fds resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)string
            completionHandler:(void (^)(NSArray *))handler
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        
        NSArray *completions;
        completions = [self allCountries];
        
        
        handler(completions);
    });
}
- (NSArray *)allCountries
{
    NSArray *countries =
    @[
      @"EECS 280",
      @"EECS 281",
      @"MATH 215",
      @"PHYSICS 140",
      @"WEB DEV",
      @"EECS 485",
      ];
    
    return countries;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view setAlpha:0];
    [UIView animateWithDuration:0.45
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         [self.view setAlpha:1.0];
                     }completion:nil];
}




@end
