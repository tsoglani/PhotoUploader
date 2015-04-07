//
//  ViewController.h
//  ImagesProject
//
//  Created by ΓΑΪΤΆΝΗΣ ΝΙΚΟΣ on 3/9/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)MyExampleEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *buttonExit;
- (IBAction)buttonExitHandler:(id)sender;
- (IBAction)loadImageHandler:(id)sender;





@end
