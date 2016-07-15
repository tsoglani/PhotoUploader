//
//  ChangePass.h
//  ImagesProject
//
//  Created by Nikos on 7/5/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePass : UIViewController{
    NSFileManager *fm;
}
- (IBAction)submitButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *passwordTxt;
@property (strong, nonatomic) IBOutlet UITextField *emailTxt;
@property (strong, nonatomic) IBOutlet UITextField *usernameTxt;



-(void)writeStringToFile:(NSString*)aString ;
-(void)appendText:(NSString *)text toFile:(NSString *)filePath ;
-(void) writeToTxt ;
@end
