//
//  LoadLibrary.h
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/9/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadLibrary : UIViewController{

// NSArray *myArray;
}


@property (weak, nonatomic) IBOutlet UITextField *countCopies;
@property (weak, nonatomic) IBOutlet UIButton *buttonConfirm;
@property (weak, nonatomic) IBOutlet UIStepper *myStepper;
@property (weak, nonatomic) IBOutlet UILabel *labelCountCopies;
@property (weak, nonatomic) IBOutlet UILabel *labelWriteCopies;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (strong, nonatomic) IBOutlet UIButton *buttonAddFilter;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sizeOfPhotoSegmentControll;
@property (strong, nonatomic) IBOutlet UILabel *labelOfSize;
@property (strong, nonatomic) IBOutlet UILabel *pricesLabel;



- (IBAction)sizeOfPhotoSegmentControllHandler:(id)sender;
- (IBAction)confirmButtonEvent:(id)sender;
- (IBAction)myStepperEvent:(id)sender;
//+ (void)addToImageArray: (UIImage *)myImage;
+ (UIImage *)getSelectedImage;
+ (NSMutableArray*)getImageArray;
+ (NSInteger*)getImageArrayLength;
+ (NSMutableArray*)getAtImageArrayCount;
+ (NSMutableArray*)getSelectedFilters; // ta filtra pou exw epileksei oti tha emfanizonte stis eikones mou
+ (NSInteger*)getSelectedFiltersCount; 
+ (NSInteger*)getNumberOfCopies;

+ (void*)setImageArray:(NSMutableArray* )array;
+ (void*)setAtImageArrayCount:(NSMutableArray* )array;
+ (void*)setSelectedFilters:(NSMutableArray* )array;
+ (void *)setSelectedImage:(UIImage* )image;
+(NSString *)getSizeOfPhotoSegmentControll;
+ (NSMutableArray*)getAllFilters; // ta filtra pou mporw na valw stin eikona 
+ (NSInteger*)getAllFiltersCount; // o arithmos twn filtrwn pou mporw na valw stin eikona mou
+ (NSMutableArray*)getAllSizeOfPhotoSegmentControll; 
+ (void)setWantToLoadLibrary:(bool)isReadyToLoadLibrary;
+ (NSArray*) getNsArrayWithAllFilters;
+ ( NSMutableArray*) getPricesArray;
@end
