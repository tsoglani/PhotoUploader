//
//  TableViewsViewController.h
//  TableViews
//
//  Created by Axit Patel on 9/3/10.
//  Copyright Bayside High School 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (void) validateObjectInView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (nonatomic, retain) IBOutlet UITableView *table;
+(void)setshouldAuto:(bool ) shAuto;
+ (void) removeAll;
@end

