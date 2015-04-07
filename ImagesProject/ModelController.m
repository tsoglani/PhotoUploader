//
//  ModelController.m
//  PageBaseExample
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/19/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "ModelController.h"
#import "LoadLibrary.h"
#import "DataViewController.h"
#import "GPUImage.h"
#import <Facebook.h>

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

@synthesize pageData = _pageData;


int currentIntex;
DataViewController *dataViewController;
UIImage* imageWithFilter;



- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
             _pageData = [[LoadLibrary getNsArrayWithAllFilters]  copy];
    }

    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    printf("viewControllerAtIndex \n");
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
   //
    
  /* 
   
    CGRect rectangle=CGRectMake(60,300, 200, 40);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = rectangle;
    [button setTitle:@"select this Filter" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(myAction:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    [dataViewController.view addSubview:button];
    */
    
    
    
    
    if(index>=(int)[LoadLibrary getAllFiltersCount]){
        
        index=0;
        //  dataViewController.dataObject =[self.pageData objectAtIndex:index];
    }
    
    
    
    
    
    
    
    
    printf(" all filters count %i\n",(int)[LoadLibrary getAllFiltersCount]);
      currentIntex=index;
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200,15)];
    lab.text=[NSString stringWithFormat:@"filter :  %i",(int)(currentIntex)];
    [dataViewController.view addSubview:lab];
    
    dataViewController.labelFilter.text=[[NSString alloc] initWithFormat:[[LoadLibrary getAllFilters]objectAtIndex:index]];
  
    
    //  NSString *str=[[NSString alloc] initWithFormat:[[LoadLibrary getAllFilters]objectAtIndex:index]]; // <--------------------- edw tha filtrarwnte oi eikones
    // NSLog(str);
    printf("viewControllerAtIndex = %i\n",index);

    


    
    GPUImageFilter *selectedFilter;
    if( [dataViewController.labelFilter.text isEqual:@"GrayscaleFilter"]){
        selectedFilter = [[GPUImageGrayscaleFilter alloc] init];    }
    else  if( [dataViewController.labelFilter.text isEqual:@"SepiaFilter"]){
        selectedFilter = [[GPUImageSepiaFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"SketchFilter"]){
        selectedFilter = [[GPUImageSketchFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"PixellateFilter"]){
        selectedFilter = [[GPUImagePixellateFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"ColorInvertFilter"]){
        selectedFilter = [[GPUImageColorInvertFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"ToonFilter"]){
        selectedFilter = [[GPUImageToonFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"PinchDistortionFilter"]){
        selectedFilter = [[GPUImagePinchDistortionFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"ErosionFilter"]){
        selectedFilter = [[GPUImageErosionFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"FalseColorFilter"]){
        selectedFilter = [[GPUImageFalseColorFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"FastBlurFilter"]){
        selectedFilter = [[GPUImageFastBlurFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"GaussianBlurFilter"]){
        selectedFilter = [[GPUImageGaussianBlurFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"SphereFilter"]){
        selectedFilter = [[GPUImageGlassSphereFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"HazeFilter"]){
        selectedFilter = [[GPUImageHazeFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"HueFilter"]){
        selectedFilter = [[GPUImageHueFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"LanczosResamplingFilter"]){
        selectedFilter = [[GPUImageLanczosResamplingFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"MedianFilter"]){
        selectedFilter = [[GPUImageMedianFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"MonochromeFilter"]){
        selectedFilter = [[GPUImageMonochromeFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"MotionBlurFilter"]){
        selectedFilter = [[GPUImageMotionBlurFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"PolarPixellateFilter"]){
        selectedFilter = [[GPUImagePolarPixellateFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"PosterizeFilter"]){
        selectedFilter = [[GPUImagePosterizeFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"SwirlFilter"]){
        selectedFilter = [[GPUImageSwirlFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"TiltShiftFilter"]){
        selectedFilter = [[GPUImageTiltShiftFilter alloc] init];
    }
    else if( [dataViewController.labelFilter.text isEqual:@"VignetteFilter"]){
        selectedFilter = [[GPUImageVignetteFilter alloc] init];
    }
    
    
    

    else{
    selectedFilter=nil;
    }
   
    
    if(selectedFilter){
     imageWithFilter = [selectedFilter imageByFilteringImage:[LoadLibrary getSelectedImage]];
     dataViewController.imageView.image =imageWithFilter ;
     }else{
      dataViewController.imageView.image =[LoadLibrary getSelectedImage]; // kai svinw tin parakatw idia grami
     }
    
    

   
  //  dataViewController.imageView.image =[LoadLibrary getSelectedImage];
    dataViewController.dataObject =[self.pageData objectAtIndex:index];
    
    
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
    /*
     Return the index of the given data view controller.
     For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
     */
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

+  (void)addFilterIntoArray{
    if([LoadLibrary getSelectedFiltersCount]<=[LoadLibrary getImageArrayLength]){
        [[LoadLibrary getSelectedFilters] addObject:[[LoadLibrary getAllFilters] objectAtIndex:currentIntex ]];
    }else{
        
        [[LoadLibrary getSelectedFilters]replaceObjectAtIndex:(int)[LoadLibrary getImageArrayLength ] withObject:[[LoadLibrary getAllFilters] objectAtIndex:currentIntex ]];
    }
    [LoadLibrary setWantToLoadLibrary:false];
    printf("add filter in getSelectedFilters  count \n % i",(int)[LoadLibrary getSelectedFiltersCount]);
    
    
    
}

+  (UIImage*)getSelectedImageWithFilter{

    return imageWithFilter;
}
+  (void)setSelectedImageWithFilter:(UIImage *)image{
    
   imageWithFilter=image;
}

@end
