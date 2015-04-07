//
//  MyOrderForm.h
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/10/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderForm : UIViewController
- (IBAction)confirmFormHandler:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtBamkId;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;

@end
