//
//  RSViewControllerSecond.m
//  task7
//
//  Created by Дарья Воробей on 7/3/21.
//

#import "RSViewControllerSecond.h"
#import <QuartzCore/QuartzCore.h>

@interface FrameViewController ()
@end
// MARK: - Frame implementation
@implementation FrameViewController

// MARK: - Alert for completed authorization
- (void)showAlert{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                  message:@"You are successfully authorized!"
                                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh"             style:UIAlertActionStyleDestructive
        handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// MARK: - Draw and color frame border if code is wrong
- (void)drawFrameBorder{
    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    topBorder.borderWidth = 2;
    topBorder.cornerRadius = 10;
    topBorder.borderColor = [[UIColor colorNamed: @"VenetianRed"] CGColor];
    [self.view.layer addSublayer:topBorder];
}

// MARK: - First button action
- (IBAction)buttonTap1:(UIButton * )sender {
    if (codeLabel.text.length == 1 || codeLabel.text.length == 6){//if label text is empty or filled uncorrectly
        codeLabel.text = @"";
    }
    NSString *one = @"1";
    codeLabel.text = [NSString stringWithFormat:@"%@ %@", codeLabel.text, one];
    if (codeLabel.text.length == 6){
        [self drawFrameBorder];
    }
}

// MARK: - Second button action
- (IBAction)buttonTap2:(UIButton * )sender {
    if (codeLabel.text.length == 1  || codeLabel.text.length == 6){//if label text is empty or filled uncorrectly
        codeLabel.text = @"";
    }
    NSString *two = @"2";
    codeLabel.text = [NSString stringWithFormat:@"%@ %@", codeLabel.text, two];
    if (codeLabel.text.length == 6){
        CALayer *topBorder = [CALayer layer];
        topBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
        topBorder.borderWidth = 2;
        topBorder.cornerRadius = 10;
        // MARK: - Correct entry
        if([codeLabel.text isEqualToString: @" 1 3 2"]){
            topBorder.borderColor = [[UIColor colorNamed: @"TurquoiseGreen"] CGColor];
            [self showAlert];
        }
        // MARK: - Incorrect entry
        else{
            topBorder.borderColor = [[UIColor colorNamed: @"VenetianRed"] CGColor];
        }
        [self.view.layer addSublayer:topBorder];
    }
}

// MARK: - Third button tapped
- (IBAction)buttonTap3:(UIButton * )sender {
    if (codeLabel.text.length == 1  || codeLabel.text.length == 6){//if label text is empty or filled uncorrectly
        codeLabel.text = @"";
    }
    NSString *three = @"3";
    codeLabel.text = [NSString stringWithFormat:@"%@ %@", codeLabel.text, three];
    if (codeLabel.text.length == 6){
        [self drawFrameBorder];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 44, 320, 416);
    
    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [[UIColor colorNamed: @"LittleBoyBlue"] CGColor];
    
    // MARK: - First button implementation
    
    UIButton *firstRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [firstRoundButton setTitle: @"1" forState:UIControlStateNormal];
    [firstRoundButton setTitleColor:[UIColor colorNamed: @"LittleBoyBlue"] forState:UIControlStateNormal];
    [firstRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    
    [firstRoundButton addTarget:self action:@selector(buttonTap1:) forControlEvents:UIControlEventTouchUpInside];
    
    firstRoundButton.frame = CGRectMake(23, 44, 50, 50);
    
    firstRoundButton.clipsToBounds = YES;
    
    firstRoundButton.layer.cornerRadius = 50/2.0f;
    firstRoundButton.layer.borderColor=[[UIColor colorNamed: @"LittleBoyBlue"] CGColor];;
    firstRoundButton.layer.borderWidth=2.0f;
    
    [self.view addSubview:firstRoundButton];
    
    // MARK: - Second button implementation
    
    UIButton *secondRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [secondRoundButton setTitle: @"2" forState:UIControlStateNormal];
    [secondRoundButton setTitleColor:[UIColor colorNamed: @"LittleBoyBlue"] forState:UIControlStateNormal];
    [secondRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    
    [secondRoundButton addTarget:self action:@selector(buttonTap2:) forControlEvents:UIControlEventTouchUpInside];
    
    secondRoundButton.frame = CGRectMake(92,44, 50, 50);
    
    secondRoundButton.clipsToBounds = YES;
    
    secondRoundButton.layer.cornerRadius = 50/2.0f;
    secondRoundButton.layer.borderColor=[[UIColor colorNamed: @"LittleBoyBlue"] CGColor];;
    secondRoundButton.layer.borderWidth=2.0f;
    
    [self.view addSubview:secondRoundButton];
    
    // MARK: - Third button implementation
    
    UIButton *thirdRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [thirdRoundButton setTitle: @"3" forState:UIControlStateNormal];
    [thirdRoundButton setTitleColor:[UIColor colorNamed: @"LittleBoyBlue"] forState:UIControlStateNormal];
    [thirdRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    
    [thirdRoundButton addTarget:self action:@selector(buttonTap3:) forControlEvents:UIControlEventTouchUpInside];
    
    thirdRoundButton.frame = CGRectMake(161, 44, 50, 50);
    
    thirdRoundButton.clipsToBounds = YES;
    
    thirdRoundButton.layer.cornerRadius = 50/2.0f;
    thirdRoundButton.layer.borderColor=[[UIColor colorNamed: @"LittleBoyBlue"] CGColor];;
    thirdRoundButton.layer.borderWidth=2.0f;
    
    [self.view addSubview:thirdRoundButton];
    
    // MARK: - Entered code
    codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(92, 11, 50, 22)];
    [codeLabel setText: @"_"];
    codeLabel.textAlignment = NSTextAlignmentCenter;
    codeLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview: codeLabel];
}

@end
