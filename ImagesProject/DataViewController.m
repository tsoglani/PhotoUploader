//
//  DataViewController.m
//  PageBaseExample
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/19/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "DataViewController.h"
#import "ModelController.h"
#import "LoadLibrary.h"
@implementation DataViewController

@synthesize dataLabel = _dataLabel;

@synthesize imageView = _imageView;
@synthesize labelFilter = _labelFilter;
@synthesize dataObject = _dataObject;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    printf("didReceiveMemoryWarning dataViewController\n");
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    printf("viewDidLoad dataViewController\n");
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setLabelFilter:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"photosBackground.jpg"]];
    printf("shouldAutorotateToInterfaceOrientation dataViewController\n");
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)addFilterHandler:(id)sender {
    [ModelController addFilterIntoArray];
    if ([ModelController getSelectedImageWithFilter]) {
    [LoadLibrary setSelectedImage:[ModelController getSelectedImageWithFilter]];
        printf("add image with filter sadsadasdsadsd\n");
    
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess"
                                                    message:@"filter just added in your image"
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    
    
    
    [alert show];    
}
- (IBAction)canselHandler:(id)sender {
    [ModelController setSelectedImageWithFilter:NULL];    
    [LoadLibrary setWantToLoadLibrary:false];
}







@end
