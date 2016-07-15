//
//  ChangePass.m
//  ImagesProject
//
//  Created by Nikos on 7/5/13.
//  Copyright (c) 2013 ΕΠΠ. All rights reserved.
//

#import "ChangePass.h"
#import "LoginIn.h"
@implementation ChangePass
bool successChangingPas=true;
- (IBAction)submitButton:(id)sender {

    if(successChangingPas){
       [self writeToTxt];
    //    [self writeStringToFile:@"eeeeellllllaaaaaa"];
    //   NSString* path = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"txt"];
      //  [self appendText:@"\n hellloooo" toFile:path];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess"
                                                    message:@"you create new acount .."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    
    
    
    [alert show];
    
        LoginIn  *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginIn"]; // dimiourgw to paratirw tou view controller
        [self.navigationController pushViewController:controller animated:YES];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"not sucess"
                                                        message:@"you enter invalid values ... "
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        
        
        
        [alert show];
    
    }
    
    
    
    
    ///
   
    
}

-(void) writeToTxt{
  //  NSArray *paths = NSSearchPathForDirectoriesInDomains
   // (NSDocumentDirectory, NSUserDomainMask, YES);
  //  NSString *documentsDirectory = [paths objectAtIndex:0];
    /*
    //get the documents directory:
   
    NSLog(@"%@",documentsDirectory);
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    //create content - four lines of text
    NSString *content = @"One\nTwo\nThree\nFour\nFive";
    //save content to the documents directory
    [content writeToFile:fileName
              atomically:NO
                encoding:NSStringEncodingConversionAllowLossy
                   error:nil];
    
    */
    //NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *docDir=[paths objectAtIndex:0];
    //NSString * filePath=[docDir stringByAppendingPathComponent:@"user.txt"];
    

  /*
    fm=[NSFileManager defaultManager];
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"txt"];
 NSString *data=@" kolo objective c";

[data writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    if([fm fileExistsAtPath:path]){
        NSLog(@"user.txt exist");
    }
   */
    
    
    /*//Get the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    //Get the final path of your file.
    NSString *finalPath = @"user.txt";
    //And actually write that file.
    [[NSFileManager defaultManager] createFileAtPath:finalPath contents:@"\n fuck iphone" attributes:nil];
     */
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [docsDirectory stringByAppendingPathComponent:@"user.txt"];
    if(![fileManager fileExistsAtPath:path])
    {
        NSData *data = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/user.txt"]];
        [data writeToFile:path atomically:YES];
    }
     
     
     
}


- (void)writeStringToFile:(NSString*)aString {
    
    // Build the path, and create if needed.
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"myTextFile.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    // The main act.
    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}



- (void)appendText:(NSString *)text toFile:(NSString *)filePath {
    
    // NSFileHandle won't create the file for us, so we need to check to make sure it exists
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) {
        
        // the file doesn't exist yet, so we can just write out the text using the
        // NSString convenience method
          NSLog(@"not success");
        NSError *error = nil;
        BOOL success = [text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (!success) {
           
            // handle the error
            //NSLog(@\"%@\", error);
                  }
                  
                  } else {
                     
                      
                      // the file already exists, so we should append the text to the end
                      
                      // get a handle to the file
                      NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
                      
                      // move to the end of the file
                      [fileHandle seekToEndOfFile];
                      
                      // convert the string to an NSData object
                      NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
                      
                      // write the data to the end of the file
                      [fileHandle writeData:textData];
                      
                      // clean up
                      [fileHandle closeFile];
                       
                  }
                  }




- (void)viewDidUnload {
    [self setEmailTxt:nil];
    [self setPasswordTxt:nil];
    [self setUsernameTxt:nil];
    [super viewDidUnload];
  
  
}
@end
