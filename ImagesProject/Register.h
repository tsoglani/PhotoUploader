//
//  Register.h
//  ImagesProject
//
//  Created by Nikos on 7/5/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register : UIViewController
- (IBAction)submitAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxt;
@property (strong, nonatomic) IBOutlet UITextField *username;



+(NSString*) takeUserContent;
-(void) process;
+ (NSString*) getEmail;
+ (NSString*) getPassword;
+ (NSString*) getUserName;
+ (NSString*) getBankAcount;
@end
