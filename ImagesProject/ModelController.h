//
//  ModelController.h
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/23/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>
- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;
+  (void)addFilterIntoArray;
+  (UIImage*)getSelectedImageWithFilter;
+  (void)setSelectedImageWithFilter:(UIImage *)image;
+ (NSString*)getNumberOfFiler;
@end
