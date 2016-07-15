//
//  Register.m
//  ImagesProject
//
//  Created by Nikos on 7/5/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "Register.h"
#import "ChangePass.h"
@implementation Register

- (IBAction)submitAction:(id)sender {
    [Register takeUserContent];
    
    
    if([[Register takeUserContent] length]<=1){
    
[self process];
    }  else {
      NSString * email=[Register getEmail];
        [Register getUserName];
     NSString * password=[Register getPassword] ;
     // NSLog(@"_username.text.length %i",_username.text.length);
       // NSLog(@"_password  %i",password.length);
       // NSLog(email);
        // NSLog(password);
if(([email isEqualToString:_username.text])&&( [password isEqualToString:_passwordTxt.text])){
            [self process];
}else{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess"
                                                    message:@"invalid password .."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    [alert show];

}
    
    }
    
}


+ (NSString*) getEmail{

    NSUInteger * from;
    NSUInteger * to;
    from=[[Register takeUserContent]rangeOfString:@"email :"].location;
    to=[[Register takeUserContent]rangeOfString:@"password :"].location-1;
    NSString *  email=[[Register takeUserContent] substringToIndex:to];
    email=[email substringFromIndex:7];
    
   // NSString * password=[[Register takeUserContent] substringFromIndex:(int)to+11];
    // NSLog(@"_username.text.length %i",_username.text.length);
    // NSLog(@"_password  %i",password.length);
    return email;

    
}
+ (NSString*) getPassword{
    
    NSUInteger * from;
    NSUInteger *to;
    from=[[Register takeUserContent]rangeOfString:@"password :"].location;
      to=[[Register takeUserContent]rangeOfString:@"username :"].location-1;
    NSString * password=[[Register takeUserContent] substringToIndex:(int)to];
      password=[password substringFromIndex:(int)from+10];
     
    
    // NSLog(@"_username.text.length %i",_username.text.length);
     NSLog(@"_password length =%i",password.length);
NSLog(@"_password string =%@",password);
    return password;
    
    
}

+ (NSString*) getUserName{
    
    NSUInteger * from;
    NSUInteger *to;
    from=[[Register takeUserContent]rangeOfString:@"username :"].location;
    to=[[Register takeUserContent] rangeOfString:@"bankAccount :"].location-1;
    
    NSString * username=[[Register takeUserContent] substringToIndex:(int)to];
 username=[username substringFromIndex:(int)from+10];
    NSLog(@"username length =%i",username.length);
    NSLog(@"username string =%@",username);
    return username;
}

+ (NSString*) getBankAcount{

    NSUInteger * from;
    NSUInteger *to;
    from=[[Register takeUserContent]rangeOfString:@"bankAccount :"].location;
     to=[[Register takeUserContent] length];
    NSString * acount=[[Register takeUserContent] substringToIndex:(int)to];
    acount=[acount substringFromIndex:(int)from+13];
    return acount;
    
}



- (void) process{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess"
                                                    message:@"enter now new account.."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    [alert show];
    
    
    
    ChangePass *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePass"]; // dimiourgw to paratirw tou view controller
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)viewDidUnload {
    [self setPasswordTxt:nil];
    [self setUsername:nil];
    [super viewDidUnload];
}


+(NSString*) takeUserContent{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"txt"];
    //Then loading the content into a NSString.
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    
   
 //   NSLog(content);
   // NSLog(@"%i",[content length]);
    return content;
}


@end
