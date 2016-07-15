//
//  LoginIn.m
//  ImagesProject
//
//  Created by Nikos on 7/4/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "LoginIn.h"
#import "ViewController.h"
#import "Register.h"
@implementation LoginIn


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    
    // Return YES for supported orientations
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"log in.jpg"]];
    printf("shouldAutorotateToInterfaceOrientation dataViewController\n");
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(NSInteger)supportedInterfaceOrientations{
    NSLog(@"supportedInterfaceOrientations   \n");
    NSInteger orientationMask = 0;
    if ([self shouldAutorotateToInterfaceOrientation: UIInterfaceOrientationLandscapeLeft])
        orientationMask |= UIInterfaceOrientationMaskLandscapeLeft;
    if ([self shouldAutorotateToInterfaceOrientation: UIInterfaceOrientationLandscapeRight])
        orientationMask |= UIInterfaceOrientationMaskLandscapeRight;
    if ([self shouldAutorotateToInterfaceOrientation: UIInterfaceOrientationPortrait])
        orientationMask |= UIInterfaceOrientationMaskPortrait;
    if ([self shouldAutorotateToInterfaceOrientation: UIInterfaceOrientationPortraitUpsideDown])
        orientationMask |= UIInterfaceOrientationMaskPortraitUpsideDown;
    return orientationMask;
}



- (IBAction)emailAction:(id)sender {
    [_emailTxt setText:@""];
}



- (IBAction)passAction:(id)sender {
    [_passTxt setText:@""];
}

- (IBAction)LoginInButton:(id)sender {
    
    
    
    [_passTxt resignFirstResponder];
    [_emailTxt resignFirstResponder];
    
    //NSLog(@"%i",[Register takeUserContent].length);
    if([[Register getEmail] isEqualToString:_emailTxt.text]&&[[Register getPassword] isEqualToString:_passTxt.text]&&[Register takeUserContent].length>=20){
        
        ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"]; // dimiourgw to paratirw tou view controller
        [self.navigationController pushViewController:controller animated:YES];                                    // to topothetw sto  navigationController
    }else if([Register takeUserContent].length<20){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"not sucess"
                                                        message:@"you have to create account"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        
        
        
        [alert show];
        
    }
    else {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"not sucess"
                                                        message:@"wrong password"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        
        
        
        [alert show];
    }
    
    
    
    
       
}

- (IBAction)registerButton:(id)sender {
  //  [self writeToTxt];
    [_passTxt resignFirstResponder];
    [_emailTxt resignFirstResponder];
    
    
    if([Register takeUserContent].length>20){
    ///////// an exw eidi kapoio kwdiko ....
    Register *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Register"]; // dimiourgw to paratirw tou view controller
    [self.navigationController pushViewController:controller animated:YES];
    }else{
        Register *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePass"]; // dimiourgw to paratirw tou view controller
        [self.navigationController pushViewController:controller animated:YES];
    
    }
}

- (IBAction)emailCloseKeyboard:(id)sender {
    [_passTxt resignFirstResponder];
    [_emailTxt resignFirstResponder];
    
 NSLog(@"emailCloseKeyboard");
}

- (IBAction)passCloseKeyboard:(id)sender {
    [_passTxt resignFirstResponder];
    [_emailTxt resignFirstResponder];
        NSLog(@"passCloseKeyboard");
}



- (void)viewDidUnload {
    [self setEmailTxt:nil];
    [self setPassTxt:nil];
    [super viewDidUnload];
}








@end
