//
//  ViewController.h
//  MultichoiceApp
//
//  Created by admin on 10/31/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *No;
    IBOutlet UILabel *Content;
    IBOutlet UILabel *A;
    IBOutlet UILabel *B;
    IBOutlet UILabel *C;
    IBOutlet UISegmentedControl *Answer;
    IBOutlet UIButton *Previous;
    IBOutlet UIButton *Next;
    
    NSTimer *Time;
    NSArray *AQuestion;
    NSArray *AAnswer;
    NSArray *AResult;
    
    int UPoint;
    int Current;
    int Wrong;
}


- (IBAction)Answer:(id)sender;
- (IBAction)Previous:(id)sender;
- (IBAction)Next:(id)sender;


@end
