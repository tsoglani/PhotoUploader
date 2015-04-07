//
//  LoadLibrary.m
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/9/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "LoadLibrary.h"
#import "ViewController.h"
#import "ModelController.h"


@implementation LoadLibrary
@synthesize labelCountCopies;
@synthesize labelWriteCopies;
@synthesize selectedImageView;
@synthesize buttonAddFilter;
@synthesize sizeOfPhotoSegmentControll;
@synthesize labelOfSize;
@synthesize countCopies;
@synthesize buttonConfirm;
@synthesize myStepper;
@synthesize pricesLabel;

static NSArray* nsArrayFilters;
static UIImage * selectedImage;
static  NSMutableArray *myImagesArray;
static  NSMutableArray *pricesArray;
static  NSMutableArray *filtersArray;
static  NSMutableArray *numberOfCopiesArray;
static  NSMutableArray *allMyFiters;
static  NSMutableArray *allSizeOfPhotoSegmentControll;
static bool wantLoadLibrary=true;
NSString * sizeOfImage=@"12x15";
static bool firstRun=true; // i arxikopoihsh twn pinakwn thelw na ginete mono tin prwti fora 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    printf(" initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    printf(" didReceiveMemoryWarning");
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
    
    [self setCountCopies:nil];
    [self setMyStepper:nil];
    [self setMyStepper:nil];
    [self setCountCopies:nil];
    [self setSelectedImageView:nil];
    [self setLabelCountCopies:nil];
    [self setButtonAddFilter:nil];
    [self setButtonConfirm:nil];
    [self setButtonAddFilter:nil];
    [self setSizeOfPhotoSegmentControll:nil];
    [self setLabelOfSize:nil];
    [self setPricesLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
    printf(" viewDidUnload");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation //// load library from here
{
    // Return YES for supported orientations
    printf(" shouldAutorotateToInterfaceOrientation \n time to load library \n\n\n\n");

  [pricesLabel setHidden:true];
    [labelCountCopies setHidden:true];
    [labelWriteCopies setHidden:true];
    [countCopies setHidden:true];
    [myStepper setHidden:true];
    [buttonAddFilter setHidden:true];
    [buttonConfirm setHidden:true];
    [sizeOfPhotoSegmentControll setHidden:true];
    [labelOfSize setHidden:true];
  
    if(wantLoadLibrary){
        UIImagePickerController *picker= [[UIImagePickerController alloc]init];
        picker.delegate = (id)self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:picker animated:YES];
    }else{
        [labelCountCopies setHidden:false];// otan epilegw eikona na emfanizei xaraktiristika
        [labelWriteCopies setHidden:false];// otan epilegw eikona na emfanizei xaraktiristika
        [countCopies setHidden:false];// gia na epileksw tin idia eikona polles fores , tin idia tin eikona
        [myStepper setHidden:false];// ta filtra ... prepei na einai meta to  [picker dismissModalViewControllerAnimated:YES];
        [buttonAddFilter setHidden:false];
        [buttonConfirm setHidden:false];
        [pricesLabel setHidden:false];
        [sizeOfPhotoSegmentControll setHidden:false];
        [labelOfSize setHidden:false];
        selectedImageView.image=selectedImage;
   //     wantLoadLibrary=!wantLoadLibrary;
         
    }
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void) loadimageFromLibrary{
    UIImagePickerController *picker= [[UIImagePickerController alloc]init];
    picker.delegate =(id) self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}


-(void)imagePickerController:(UIImagePickerController *)picker            // ekteleite otan pataw tin eikona tis 
//library
      didFinishPickingImage : (UIImage *)image
                 editingInfo:(NSDictionary *)editingInfo
{
    
    
    if(!myImagesArray){
        myImagesArray=[[NSMutableArray alloc] init];
    }
    if(!pricesArray){
        pricesArray=[[NSMutableArray alloc] init];
    }
    if(!numberOfCopiesArray){
        numberOfCopiesArray=[[NSMutableArray alloc] init];
    }
    if(!filtersArray){
        filtersArray=[[NSMutableArray alloc] init];
    }
    if(!allMyFiters){
        allMyFiters=[[NSMutableArray alloc] init];
    }
    if(!allSizeOfPhotoSegmentControll){
        allSizeOfPhotoSegmentControll=[[NSMutableArray alloc] init];
    }
  
    
    if(firstRun){ // edw  vazw ta filtra pou tha einai diathesima pros ton xristi 
    
        [allMyFiters addObject:@"HazeFilter"];
        [allMyFiters addObject:@"VignetteFilter"];
        [allMyFiters addObject:@"MonochromeFilter"];
        [allMyFiters addObject:@"GrayscaleFilter"]; // dimiourgw tin lista twn filter pou tha mporei na valei o xristis
        [allMyFiters addObject:@"SepiaFilter"];
        [allMyFiters addObject:@"ColorInvertFilter"];
        [allMyFiters addObject:@"ErosionFilter"];
        // [allMyFiters addObject:@"HueFilter"];
        //  [allMyFiters addObject:@"SketchFilter"];
        [allMyFiters addObject:@"PixellateFilter"];
        
        // [allMyFiters addObject:@"ToonFilter"];
      
        
        // [allMyFiters addObject:@"FalseColorFilter"];
        [allMyFiters addObject:@"FastBlurFilter"];
        [allMyFiters addObject:@"GaussianBlurFilter"];
           // [allMyFiters addObject:@"SphereFilter"];
        [allMyFiters addObject:@"PolarPixellateFilter"];
       
        [allMyFiters addObject:@"PosterizeFilter"];
        [allMyFiters addObject:@"MotionBlurFilter"];
        [allMyFiters addObject:@"LanczosResamplingFilter"];
        [allMyFiters addObject:@"MedianFilter"];
        [allMyFiters addObject:@"PinchDistortionFilter"];
        
       
        [allMyFiters addObject:@"TiltShiftFilter"];
        

   
        nsArrayFilters=[[NSArray alloc] initWithObjects:@"HazeFilter",@"MonochromeFilter",@"GrayscaleFilter",@"SepiaFilter",@"ColorInvertFilter",@"ErosionFilter",@"PixellateFilter",@"PinchDistortionFilter",@"PolarPixellateFilter",@"PosterizeFilter",@"TiltShiftFilter",@"VignetteFilter",@"HueFilter",@"SketchFilter",@"ToonFilter",@"FalseColorFilter",@"FastBlurFilter",@"GaussianBlurFilter",@"SphereFilter",@"LanczosResamplingFilter",@"MedianFilter",@"MotionBlurFilter", nil];
        
        firstRun=false;
    }
    
    
    
    [picker dismissModalViewControllerAnimated:YES];             // gia na paw stin pisw othoni
    printf("i pik an image\n");
    
    if (![ModelController getSelectedImageWithFilter]) {
    
       selectedImage=image;  
   
    }else{
        [ModelController setSelectedImageWithFilter:NULL]; // an to getSelectedImageWithFilter exei eikona , vazw timi null gia na min tin ksanaparw  
    }
    
    [labelCountCopies setHidden:false];// otan epilegw eikona na emfanizei xaraktiristika
    [labelWriteCopies setHidden:false];// otan epilegw eikona na emfanizei xaraktiristika
    [countCopies setHidden:false];// gia na epileksw tin idia eikona polles fores , tin idia tin eikona
    [myStepper setHidden:false];// ta filtra ... prepei na einai meta to  [picker dismissModalViewControllerAnimated:YES];
    [buttonAddFilter setHidden:false];
    [buttonConfirm setHidden:false];
    [sizeOfPhotoSegmentControll setHidden:false];
    [labelOfSize setHidden:false];
    [pricesLabel setHidden:false];
    selectedImageView.image=selectedImage;
    
}

//countCopies.text=  myStepper.value;
//   printf("\n &i \n",[sender count]);


+ (NSMutableArray *)getImageArray{
    
    return myImagesArray;
}


+(NSInteger*)getImageArrayLength{
    return (NSInteger*)[myImagesArray count];
}


+ (UIImage *)getSelectedImage{
    return selectedImage;
}



+ (NSMutableArray*)getAtImageArrayCount{
    
    return numberOfCopiesArray;
}

+ (NSInteger*)getNumberOfCopies{
    return (NSInteger*)[numberOfCopiesArray count];
}
+ (NSMutableArray*)getSelectedFilters{
    return filtersArray;
}
+ (NSInteger*)getSelectedFiltersCount{
    return (NSInteger*)[filtersArray count];
}
+ (NSMutableArray*)getAllFilters{
    return allMyFiters;
}
+ (NSInteger*)getAllFiltersCount{
    return (NSInteger*)[allMyFiters count];
}





- (IBAction)confirmButtonEvent:(id)sender {
    //   NSString * value= ns
    
    [ModelController setSelectedImageWithFilter:NULL]; // an to getSelectedImageWithFilter exei eikona , vazw timi null gia na min tin ksanaparw  to ksanagrafw edw gia sigouria
    [myImagesArray addObject:selectedImage];
    [numberOfCopiesArray addObject:[NSString stringWithFormat:@"%i",(int)(myStepper.value+1)]];
    [allSizeOfPhotoSegmentControll addObject:sizeOfImage];
    printf("count = %i\n",[numberOfCopiesArray count]);
    
    if([myImagesArray count]>[filtersArray count]){ // an den exw valei fintro stin eikona o pinakas me tis eikones tha exei 1 parapanw stoixeio pou to gemizw me none
        [filtersArray addObject:@"none"];
    }
      printf("allSizeOfPhotoSegmentControll count at loadLibrary = %i \n",[allSizeOfPhotoSegmentControll count]);

    
    
    ////// add prices into array
    
    int imageLengthPrice=0;
    if([sizeOfImage isEqual:@"12x15"]){
        imageLengthPrice=1;
    }else if([sizeOfImage isEqual:@"15x18"]){
        imageLengthPrice=2;
    }else if([sizeOfImage isEqual:@"15x18"]){
        imageLengthPrice=2;
    }else if([sizeOfImage isEqual:@"20x25"]){
        imageLengthPrice=3;
    }
    
    NSString*price=[[NSString alloc ] initWithFormat:@"%i",((int)(myStepper.value+1))*imageLengthPrice]; //<-------- add prices;
    NSLog(@" price = %@\n",price);
    [pricesArray addObject:price];
    
    sizeOfImage=@"12x15"; // epanaferw to default size twn eikonwn otan kanw confirm se mia
}

- (IBAction)myStepperEvent:(id)sender {
    //  printf("\n %i \n",(int)myStepper.value);
    [labelCountCopies setText:[NSString stringWithFormat:@"%i",(int)(myStepper.value+1)]];
    
}


+ (void)setWantToLoadLibrary:(bool)isReadyToLoadLibrary{
    wantLoadLibrary=isReadyToLoadLibrary;
}

+ (void*)setImageArray:(NSMutableArray* )array{
    myImagesArray=array;
    return nil;
}
+ (void*)setAtImageArrayCount:(NSMutableArray* )array{
    numberOfCopiesArray=array;
    return nil;
}
+ (void*)setSelectedFilters:(NSMutableArray* )array{
    filtersArray=array;
    return nil;
}
+ (void *)setSelectedImage:(UIImage* )image{
    selectedImage=image;
    return nil;
}

+(NSString *)getSizeOfPhotoSegmentControll{

    return sizeOfImage;
}
- (IBAction)sizeOfPhotoSegmentControllHandler:(id)sender {
    
    printf("%i",sizeOfPhotoSegmentControll.selectedSegmentIndex);
    if (sizeOfPhotoSegmentControll.selectedSegmentIndex==0) {
        sizeOfImage=@"12x15";
    }else if (sizeOfPhotoSegmentControll.selectedSegmentIndex==1){
         sizeOfImage=@"15x18";
    }else if (sizeOfPhotoSegmentControll.selectedSegmentIndex==2){
        sizeOfImage=@"20x25";
    }
}
+ (NSMutableArray*)getAllSizeOfPhotoSegmentControll{
    return allSizeOfPhotoSegmentControll;
}

+ (NSArray*) getNsArrayWithAllFilters{
   return nsArrayFilters;
}

+ ( NSMutableArray*) getPricesArray{
    return pricesArray;
}



////ios 6 

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
