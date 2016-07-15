//
//  LoginIn.h
//  ImagesProject
//
//  Created by Nikos on 7/4/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginIn : UIViewController
//- (IBAction)emailAction:(id)sender;
//- (IBAction)passAction:(id)sender;
- (IBAction)emailAction:(id)sender;
- (IBAction)passAction:(id)sender;
- (IBAction)LoginInButton:(id)sender;
- (IBAction)registerButton:(id)sender;
- (IBAction)emailCloseKeyboard:(id)sender;
- (IBAction)passCloseKeyboard:(id)sender;




@property (strong, nonatomic) IBOutlet UITextField *emailTxt;
@property (strong, nonatomic) IBOutlet UITextField *passTxt;
//-(void) writeToTxt;


@end
