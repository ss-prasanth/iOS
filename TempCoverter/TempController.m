//
//  TempController.m
//  TempCoverter
//
//  Created by Prasanth Sivanappan on 04/08/13.
//  Copyright (c) 2013 Prasanth Sivanappan. All rights reserved.
//

#import "TempController.h"

@interface TempController ()
-(void)convertToCelsius;
-(void)convertToFahrenheit;
@property (nonatomic, weak) NSString *flag;
@end

@implementation TempController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.ftValue.delegate = self;
    self.csValue.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITEXT field delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
        return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.ftValue)
    {
        self.csValue.text = nil;
        [self.cButton setTitle:@"Convert(°C)" forState:UIControlStateNormal];
    }
    else
    if (textField == self.csValue)
    {
        self.ftValue.text = nil;
         [self.cButton setTitle:@"Convert(°F)" forState:UIControlStateNormal];
    }
     self.cButton.alpha = 1;
    self.cButton.enabled = TRUE;
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

#pragma mark -  private methods

-(void)onDoneButton {
    self.navigationItem.rightBarButtonItem = nil;
    [self.view endEditing:YES];
}

//Action for button click
-(IBAction)convert:(id)sender{
    self.cButton.alpha = 0.4;
    self.cButton.enabled = FALSE;
    [self onDoneButton];
    
    if ([self.ftValue.text length] > 0 ){
        [self convertToCelsius];
        return;
    }
    
    if ([self.csValue.text length] > 0 ){
        [self convertToFahrenheit];
        return;
    }
    
}

-(void)convertToCelsius{
	double c = (5.0/9.0)*([self.ftValue.text doubleValue]-32.0);
	self.csValue.text = [NSString stringWithFormat:@"%0.1f", c];
}


-(void)convertToFahrenheit{
	double f = (9.0/5.0*[self.csValue.text doubleValue])+32.0;
	self.ftValue.text = [NSString stringWithFormat:@"%0.1f", f];
}


@end
