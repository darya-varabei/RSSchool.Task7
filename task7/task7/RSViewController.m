//
//  ViewController.m
//  task7
//
//  Created by Дарья Воробей on 7/3/21.
//

#import "RSViewController.h"
#import "RSViewControllerSecond.h"

@interface MainViewController ()
@property (strong, nonatomic) FrameViewController *frameVC;
@property (assign, nonatomic) BOOL isChildViewControllerAdded;

@property (weak, nonatomic) NSLayoutConstraint *topContraint;
@property (weak, nonatomic) NSLayoutConstraint *bottomContraint;
@end

@interface MainViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;
@end


// MARK: - MainViewController implementation
@implementation MainViewController

// MARK: - Authorize button action
- (IBAction)authorizeButtonTapped:(UIButton * )sender {
    
    NSString *username = usernameField.text;
    NSString *password = passwordField.text;
    
    if([username  isEqualToString: @"username"] && [password  isEqualToString: @"password"]){
        
        usernameField.layer.borderColor = [[UIColor colorNamed: @"TurquoiseGreen"] CGColor];
        passwordField.layer.borderColor = [[UIColor colorNamed: @"TurquoiseGreen"] CGColor];
        // MARK: - Disable form
        usernameField.enabled = NO;
        passwordField.enabled = NO;
        authorizeButton.enabled = NO;
        usernameField.layer.borderColor = [[UIColor colorNamed: @"TurquoiseInactive"] CGColor];
        passwordField.layer.borderColor = [[UIColor colorNamed: @"TurquoiseInactive"] CGColor];
        authorizeButton.layer.borderColor = [[UIColor colorNamed: @"LittleBoyBlueInactive"] CGColor];
        usernameField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        passwordField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        // MARK: - Show child viewController
        self.isChildViewControllerAdded = YES;
        self.frameVC = [[FrameViewController alloc] init];
        [self addChildViewController:self.frameVC];
        self.frameVC.view.frame = [self frameForViewController];
        [self.view addSubview:self.frameVC.view];
        [self.frameVC didMoveToParentViewController:self];
    }
    else{
        
        // MARK: - Incorrect entry
        usernameField.layer.borderColor = [[UIColor colorNamed: @"VenetianRed"] CGColor];
        passwordField.layer.borderColor = [[UIColor colorNamed: @"VenetianRed"] CGColor];
    }
}


- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    self.isChildViewControllerAdded = NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // MARK: - Add "RSSchool" label
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 108, 199, 50)];
    [myLabel setFont:[UIFont boldSystemFontOfSize:36]];
    [myLabel setText:@"RSSchool"];
    [[self view] addSubview:myLabel];
    // MARK: - implement username textField
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(36, 200, [UIScreen mainScreen].bounds.size.width - 72, 42)];
    usernameField.borderStyle = UITextBorderStyleRoundedRect;
    usernameField.layer.cornerRadius = 5;
    usernameField.layer.borderWidth = 1.5;
    usernameField.layer.borderColor= [[UIColor colorNamed: @"BlackCoral"] CGColor];
    usernameField.font = [UIFont systemFontOfSize:20];
    usernameField.placeholder = @"Login";
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameField.keyboardType = UIKeyboardTypeDefault;
    usernameField.returnKeyType = UIReturnKeyDone;
    usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    usernameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:usernameField];
    // MARK: - implement password textField
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(36, 270, [UIScreen mainScreen].bounds.size.width - 72, 42)];
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.layer.cornerRadius = 5;
    passwordField.layer.borderWidth = 1.5;
    passwordField.layer.borderColor= [[UIColor colorNamed: @"BlackCoral"] CGColor];
    passwordField.font = [UIFont systemFontOfSize:20];
    passwordField.placeholder = @"Password";
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.keyboardType = UIKeyboardTypeDefault;
    passwordField.secureTextEntry = true;
    passwordField.returnKeyType = UIReturnKeyDone;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview: passwordField];
    
    // MARK: - implement authorize button
    authorizeButton = [[UIButton alloc] initWithFrame:CGRectMake(110.0, 370.0, [UIScreen mainScreen].bounds.size.width - 220, 42.0)];
    [authorizeButton setTitleColor:[UIColor colorNamed: @"LittleBoyBlue"] forState:UIControlStateNormal];
    [authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    [authorizeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    authorizeButton.layer.cornerRadius = 10;
    authorizeButton.layer.borderWidth = 2;
    // MARK: - add image to button (import image "person from assets")
    UIImage *btnImage = [UIImage imageNamed:@"person"];
    UIImage *btnImageHighlighted = [UIImage imageNamed:@"person.filled"];
    
    [authorizeButton setTitleColor:[UIColor colorNamed: @"LittleBoyBlue"] forState:UIControlStateNormal];
    [authorizeButton setImage:btnImage forState:UIControlStateNormal];
   
    [authorizeButton setTitleColor:[UIColor colorNamed: @"backgroundBlue"] forState:UIControlStateHighlighted];
    [authorizeButton setImage:btnImageHighlighted forState:UIControlStateHighlighted];
    // MARK: - Set spacing between button text and image
    CGFloat spacing = 5; 
    authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    authorizeButton.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    authorizeButton.layer.borderColor= [[UIColor colorNamed: @"LittleBoyBlue"] CGColor];
    [authorizeButton addTarget:self action:@selector(authorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:authorizeButton];
    
    // MARK: - Keyboard management
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];
}

// MARK: - Child view constraints
- (CGRect)frameForViewController
{
    return CGRectMake(72.0, 506.0, 234.0, 109.0);
}

@end


// MARK: - Keyboard management implementation
@implementation MainViewController (KeyboardHandling)

- (void)subscribeOnKeyboardEvents {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}
// MARK: - Hide keyboard when tapped outside
- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (void)hide {
    [self.view endEditing:true];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    [self updateTopContraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

- (void)keybaordWillHide:(NSNotification *)notification {
    [self updateTopContraintWith:200.0 andBottom:0.0];
}

- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant {
    self.topContraint.constant = constant;
    self.bottomContraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

