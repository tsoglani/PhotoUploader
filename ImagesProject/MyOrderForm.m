//
//  MyOrderForm.m
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/10/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "MyOrderForm.h"
#import "TableViewsViewController.h"
#import "LoadLibrary.h"
#import "ViewController.h"

@implementation MyOrderForm
@synthesize txtBamkId;
@synthesize txtAddress;
@synthesize txtLastName;
@synthesize txtFirstName;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        // Custom initialization
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setTxtBamkId:nil];
    [self setTxtAddress:nil];
    [self setTxtLastName:nil];
    [self setTxtFirstName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)confirmFormHandler:(id)sender {
    
    
    //////////////////////////////////////////////////////////// fortosi sto url
    
    NSURL* url=[[NSURL alloc] initWithString:@"www.mySite.gr"];
     NSMutableData *body = [NSMutableData data];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"0x0hHai1CanHazB0undar135";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding: NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n  name : %@ %@\r\n",txtFirstName.text,txtLastName.text] dataUsingEncoding: NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n  address :  %@\r\n",txtAddress.text] dataUsingEncoding: NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n  bank Id :  %@\r\n",txtBamkId.text] dataUsingEncoding: NSUTF8StringEncoding]];
   

    for (int i=0; i<(int)[LoadLibrary getImageArrayLength]; i++) {
   
       NSData *imageData = UIImageJPEGRepresentation([[LoadLibrary getImageArray]objectAtIndex:i], 100);
        [body appendData:imageData]; // i eikona filtrarismeni i oxi
        [body appendData:[[NSString stringWithFormat:@"copies = %i\"\r\n",(int)[[LoadLibrary getAtImageArrayCount]objectAtIndex:i]]dataUsingEncoding:NSUTF8StringEncoding]];// o arithmos on copies
        [body appendData:[[NSString stringWithFormat:@"size: %@ \r\n\r\n",[[LoadLibrary getAllSizeOfPhotoSegmentControll]objectAtIndex:i]] dataUsingEncoding:NSUTF8StringEncoding]];// megethos kathe eikonas

    }

    [request setHTTPBody:body];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@" return string : %@ \n",returnString);
    
    
    //////////////////////////////////////////////////////////////

    
    
    bool isReadyToOrder=true;
    NSString * title;
    NSString * message;
    if ([txtBamkId.text length]<=1||[txtFirstName.text length]<=1||[txtLastName.text length]<=1||[txtAddress.text length]<=1) {
        isReadyToOrder=false;
        
    }
    if(isReadyToOrder){
        title=@"sucess";
        message=@"your form has been send\n thanks for using us";
        [LoadLibrary setAtImageArrayCount:[[NSMutableArray alloc] init]];
        [LoadLibrary setImageArray:[[NSMutableArray alloc] init]];
        [LoadLibrary setSelectedFilters:[[NSMutableArray alloc] init]];
        
        ////////  kanei push to storyboard sto view controller
        ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [LoadLibrary setWantToLoadLibrary:false];
        [self.navigationController pushViewController:controller animated:YES];
        ////////
        
        
    }else{
        title=@"error";
        message=@"you've make a mistake (at least) \n write all the fields";
      //  [self.view removeFromSuperview];
       /*
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        LoadLibrary *myVC = (LoadLibrary *)[storyboard instantiateViewControllerWithIdentifier:@"LoadLibrary"];
         [self presentModalViewController:myVC animated:YES];
   
        */
     
 
        }
    
    [TableViewsViewController setshouldAuto:true];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
 
    [alert show];    

    
}



- (BOOL)shouldAutorotate {
    return YES;
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
