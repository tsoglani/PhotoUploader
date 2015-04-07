//
//  DataViewController.h
//  PageBaseExample
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/19/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
- (IBAction)addFilterHandler:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelFilter;
- (IBAction)canselHandler:(id)sender;

@property (strong, nonatomic) id dataObject;
@end
