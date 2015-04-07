//
//  ViewController.m
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/9/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "ViewController.h"
#import "MyOrderForm.h"
#import "LoadLibrary.h"
@implementation ViewController
@synthesize finishButton;
@synthesize buttonExit;


  //Boolean firstTime=true;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{

    [self setFinishButton:nil];
    [self setButtonExit:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     
    if ([LoadLibrary getImageArrayLength]>0) {
        [finishButton  setHidden:false]; 
    }else{
        [finishButton  setHidden:true];
}

    
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)MyExampleEvent:(id)sender {
    
   // MyOrderForm* form;
  // form= [[MyOrderForm alloc] init];
  // self.view= form.view;
}

- (IBAction)buttonExitHandler:(id)sender {
      exit(0);
}

- (IBAction)loadImageHandler:(id)sender {
    
    [LoadLibrary setWantToLoadLibrary:true];
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
@end
