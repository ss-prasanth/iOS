//
//  TempController.h
//  TempCoverter
//
//  Created by Prasanth Sivanappan on 04/08/13.
//  Copyright (c) 2013 Prasanth Sivanappan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempController : UIViewController <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField *ftValue;
@property (nonatomic, weak) IBOutlet UITextField *csValue;
@property (nonatomic, weak) IBOutlet UIButton *cButton;
-(IBAction) convert:(id)sender;
-(IBAction)onDoneButton;
@end
