//
//  ViewController.m
//  MultichoiceApp
//
//  Created by admin on 10/31/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
<
UIAlertViewDelegate
>

@property (strong, nonatomic) NSMutableArray * userAnswers;

@end

@implementation ViewController

- (NSMutableArray *)userAnswers
{
    if (!_userAnswers) {
        _userAnswers = [@[@4, @4, @4, @4, @4] mutableCopy];
    }
    
    return _userAnswers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UPoint = 0;
    Current = 0;
    Wrong = 5;
    [Previous setEnabled:NO];
    
    AQuestion = [NSArray arrayWithObjects:
                 @"Một năm có mấy tháng:",
                 @"Steve Job là CEO của:",
                 @"Nokia sản xuất điện thoại chạy hệ điều hành nào?:",
                 @"Bose chuyên sản xuất:",
                 @"Samsung chuyên sản xuất smartphone chạy hệ điều hành nào?:",nil];
    AAnswer = [NSArray arrayWithObjects:
               @"11-12-13",
               @"Microsoft-BlackBerry-Apple",
               @"Bada-Android-Windows Phone",
               @"Loa-SmartPhone-Laptop",
               @"iOS-BlackBerry-Android", nil];
    AResult = [NSArray arrayWithObjects:@1, @2, @2, @0, @2, nil];

    [self createQuestionByCurrentIndex:0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ThucThi{
    static int i = 0;
    
    i++;
    if(i==30){
        [Time invalidate];
    }

}

- (IBAction)Answer:(id)sender {
    [self.userAnswers replaceObjectAtIndex:Current withObject:@(Answer.selectedSegmentIndex)];
}

- (IBAction)Previous:(id)sender {
    Current = Current - 1 > 0 ? Current - 1 : 0;
    [self createQuestionByCurrentIndex:Current];
}

- (IBAction)Next:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    if ([button.titleLabel.text isEqualToString:@"Finish"]) {
        [self getResult];
        return;
    }
    
    Current = Current >= 4 ? 4 : Current + 1;
    [self createQuestionByCurrentIndex:Current];
}

- (void)createQuestionByCurrentIndex:(int)currentIndex
{
    if ([[self.userAnswers objectAtIndex:currentIndex] isEqual:@4]) {
        Answer.selectedSegmentIndex = -1;
    }else
    {
        Answer.selectedSegmentIndex = [[self.userAnswers objectAtIndex:currentIndex] integerValue];
    }
    
    [No setText:[NSString stringWithFormat:@"Câu hỏi số: %i",currentIndex + 1]];
    [Content setText:[AQuestion objectAtIndex:currentIndex]];
    NSArray *AAAnswer = [[AAnswer objectAtIndex:currentIndex] componentsSeparatedByString:@"-"];
    [A setText:[NSString stringWithFormat:@"A. %@",[AAAnswer objectAtIndex:0]]];
    [B setText:[NSString stringWithFormat:@"B. %@",[AAAnswer objectAtIndex:1]]];
    [C setText:[NSString stringWithFormat:@"C. %@",[AAAnswer objectAtIndex:2]]];
    
    [Previous setEnabled:currentIndex == 0 ? NO : YES];
    
    [Next setTitle:( currentIndex >= 4 ? @"Finish" : @"Câu Sau") forState:UIControlStateNormal];
}

- (void)getResult
{
    NSInteger points = 0;
    for (int i = 0; i < self.userAnswers.count; i++) {
        if ([self.userAnswers[i] isEqual:AResult[i]]) {
            points++;
        }
    }
    NSString *message = [NSString stringWithFormat:@"Points = %d", points];
    UIAlertView *pointAlertView = [[UIAlertView alloc] initWithTitle:@"Result"
                                                             message:message
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:@"Choi lai", nil];
    [pointAlertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Choi lai"]){
        self.userAnswers = nil;
        Current = 0;
        [self createQuestionByCurrentIndex:Current];
    }
}


@end
