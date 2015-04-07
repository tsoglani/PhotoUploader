//
//  TableViewsViewController.m
//  TableViews
//
//  Created by Axit Patel on 9/3/10.
//  Copyright Bayside High School 2010. All rights reserved.
//

#import "TableViewsViewController.h"
#import "LoadLibrary.h"
@implementation TableViewsViewController
#pragma mark -
#pragma mark Synthesizers

@synthesize scrollView;
@synthesize table;
@synthesize continueButton;

UILabel * paymentLabel;
static int posX,posY=1;
static   NSMutableArray *cancelsButtonArray;
static   NSMutableArray *imageViewArray;
#pragma mark -
#pragma mark View lifecycle
bool shouldAuto=true;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation //// load library from here
{
    
    if(!shouldAuto){
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }else{
        shouldAuto=false;
    }
    // Return YES for supported orientations
    printf(" shouldAutorotateToInterfaceOrientation \n time to load library \n\n\n\n");
    
    if(!cancelsButtonArray){
        cancelsButtonArray=[[NSMutableArray alloc] init];
    }
    if(!imageViewArray){
        imageViewArray=[[NSMutableArray alloc] init];
    }
    
    if([LoadLibrary getImageArrayLength]>0){
        [continueButton setHidden:false];
        
        [self validateObjectInView ];
        
        
    }else{
        [continueButton setHidden:true];
    }
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) validateObjectInView{
    for (int i=0;  i<[imageViewArray count]; i++) {
        [[imageViewArray objectAtIndex:i] removeFromSuperview];
    };
    
    for (int i=0;  i<[cancelsButtonArray count]; i++) {
        [[cancelsButtonArray objectAtIndex:i] removeFromSuperview];
    };
    
    [imageViewArray removeAllObjects];
    [cancelsButtonArray removeAllObjects];
    
    
    
    int recRadius=100; // length of sides of rectangle
  //  posY=1;
    posX=0;
    for(int i=0;i<(int)[LoadLibrary getImageArrayLength];i++){
        posY=i+1;
        UIImageView *imageView;
        UITextView *txtOfCopies;
        UITextView *txtOfFilter;
        UITextView *txtOfPrice;
        UITextView *txtOfSize;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
        
        NSLog(@"validateObjectInView   %i",((NSInteger)[LoadLibrary getImageArrayLength]));
        
        CGRect rectangle=CGRectMake(posX*recRadius, posY*recRadius, recRadius*2, recRadius);
        
        imageView=[[UIImageView alloc] initWithFrame:rectangle];
        
        button.frame = CGRectMake(2*recRadius+50, posY*recRadius, recRadius/2, recRadius/2);
        
        txtOfSize=[[UITextView alloc] initWithFrame:CGRectMake(2*recRadius, 0,60, 20)];
        txtOfCopies=[[UITextView alloc] initWithFrame:CGRectMake(2*recRadius, 20,30, 20)];
        txtOfFilter=[[UITextView alloc] initWithFrame:CGRectMake(2*recRadius, 50,70, 20)];
        txtOfPrice=[[UITextView alloc] initWithFrame:CGRectMake(2*recRadius, 70,50, 20)];
        [txtOfSize setText:[[LoadLibrary getAllSizeOfPhotoSegmentControll] objectAtIndex:i]];
        
        //NSLog(@"%i",[[LoadLibrary getAllSizeOfPhotoSegmentControll]count]);
        NSString *priceString=[[NSString alloc] initWithFormat:@"%@ $",[[LoadLibrary getPricesArray] objectAtIndex:i]];
        
        [txtOfCopies setText:[[LoadLibrary getAtImageArrayCount] objectAtIndex:i]];
        [txtOfPrice setText:priceString];
        [txtOfFilter setText:[[LoadLibrary getSelectedFilters] objectAtIndex:i]];
        //    [txt setText:@"1"];
        
        [txtOfPrice setBackgroundColor:[UIColor purpleColor]];
        //  printf("\n\ni==== %i\n",[[LoadLibrary getAtImageArrayCount] count]);
        [txtOfCopies setBackgroundColor:[UIColor yellowColor]];
        [txtOfFilter setBackgroundColor:[UIColor redColor]];
        [button setTitle:@"delete" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(myAction:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
        [button setBackgroundColor:[UIColor redColor]];
        
        //   UITableViewCell *cell=[[UITableViewCell alloc] initWithFrame:rectangle];
        //posY++;
        
        // NSLog(@"%f",self.view.bounds.size.width);
        
        //CGRect rect=CGRectMake(0,0, 30, 20); //
        // UIButton *button= [[UIButton alloc] initWithFrame:rect];// dimiourgw ena button gia na vazw ta filtra    
        // [imageView addSubview:button];
        
        
        if(self.scrollView.bounds.size.height<= posY*recRadius+recRadius){            // an perasei ta oria tis eikonas 
            scrollView.contentSize = CGSizeMake(self.view.frame.size.width ,           // ayksanw to orio tou scrollView
                                                self.view.frame.size.height*posY);      
            
        }
        
        
        
        
        [cancelsButtonArray addObject:button];
        [imageViewArray addObject:imageView];
        imageView.image=[[LoadLibrary getImageArray] objectAtIndex:i]; // vazw tin eikona sto imageView
        [self.scrollView addSubview:imageView];   
        [self.scrollView addSubview:button];   
        [imageView addSubview:txtOfCopies];
        [imageView addSubview:txtOfFilter];
        [imageView addSubview:txtOfPrice];
        [imageView addSubview:txtOfSize];
        
    }
    if(!paymentLabel){
    paymentLabel=[[UILabel alloc] init];
    }
    [continueButton setFrame:CGRectMake(10,posY*recRadius+recRadius+20, 300,40)];
    [paymentLabel setFrame:CGRectMake(10,posY*recRadius+recRadius, 300,20)];
    int price=0;
    for(int i=0;i<[[LoadLibrary getPricesArray] count];i++){
        int oneImagePrice =((NSString*)[[LoadLibrary getPricesArray] objectAtIndex:i]).intValue;
        NSLog(@"%i \n",oneImagePrice);
        price +=oneImagePrice;
    }
    
    
    NSString* priceValueString= [[NSString alloc] initWithFormat:@"total price = %i $",price];
    
    [paymentLabel setText:priceValueString];
    [self.scrollView addSubview:paymentLabel];
    
} 


-  (void)myAction:(id)sender { // einai enas handler
    
    int intex=[cancelsButtonArray indexOfObject:sender];
    NSLog(@"button Action   %i  \n",intex);
    [[imageViewArray objectAtIndex:intex]  removeFromSuperview];
    [[cancelsButtonArray objectAtIndex:intex]  removeFromSuperview];
    [[LoadLibrary getPricesArray] removeObjectAtIndex:intex];
    [[LoadLibrary getImageArray] removeObjectAtIndex:intex];
    [[LoadLibrary getAtImageArrayCount] removeObjectAtIndex:intex];
    [[LoadLibrary getSelectedFilters] removeObjectAtIndex:intex];
    [cancelsButtonArray removeObjectAtIndex:intex];
    [imageViewArray removeObjectAtIndex:intex];
    if([LoadLibrary getImageArrayLength]<=0){
    [continueButton  removeFromSuperview];
        shouldAuto=true;
   
    }else{
    
        int price=0;
        for(int i=0;i<[[LoadLibrary getPricesArray] count];i++){
            int oneImagePrice =((NSString*)[[LoadLibrary getPricesArray] objectAtIndex:i]).intValue;
      
            price +=oneImagePrice;
        }
        
        
        NSString* priceValueString= [[NSString alloc] initWithFormat:@"total price = %i $",price];
        
        [paymentLabel setText:priceValueString];
    
    }


    
    for (int i=0;  i<[imageViewArray count]; i++) {
        [[imageViewArray objectAtIndex:i] removeFromSuperview];
    };
    
    for (int i=0;  i<[cancelsButtonArray count]; i++) {
        [[cancelsButtonArray objectAtIndex:i] removeFromSuperview];
    };
    
    [imageViewArray removeAllObjects];
    [cancelsButtonArray removeAllObjects];
    
    [self validateObjectInView];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  return NULL;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


+ (void) removeAll{

    
    for (int i=0;  i<[imageViewArray count]; i++) {
        [[imageViewArray objectAtIndex:i] removeFromSuperview];
    };
    
    for (int i=0;  i<[cancelsButtonArray count]; i++) {
        [[cancelsButtonArray objectAtIndex:i] removeFromSuperview];
    };
    
    [imageViewArray removeAllObjects];
    [cancelsButtonArray removeAllObjects];

}
#pragma mark -
/*
 #pragma mark Table View datasource methods
 
 // Required Methods
 
 // Return the number of rows in a section
 -(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
 {
 return 2; // posa kelia tha exw
 }
 
 // Returns cell to render for each row
 -(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString *CellIdentifier = @"CellIdentifier";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 //	cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
 }
 
 cell.text=@"my cells ";
 
 NSLog(@"Row: %i", indexPath.row);
 
 return cell;
 }
 
 
 #pragma mark -
 #pragma mark Memory management
 
 - (void)didReceiveMemoryWarning {
 NSLog(@"Memory Warning!");
 [super didReceiveMemoryWarning];
 }
 
 - (void)viewDidUnload {
 self.table = nil;
 [self setScrollView:nil];
 [super viewDidUnload];
 }
 
 
 - (void)dealloc {
 //[table release];
 //   [super dealloc];
 }
 */

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

+(void)setshouldAuto:(bool) shAuto{
    shouldAuto=shAuto;
}
@end
