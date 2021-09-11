#import "AdView.h"

int __isOSVersionAtLeast(int major, int minor, int patch) { NSOperatingSystemVersion version; version.majorVersion = major; version.minorVersion = minor; version.patchVersion = patch; return [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:version]; }

@implementation AdView : UIViewController

-(void)viewDidLoad {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://debianarch64.github.io/ScarletAd/"]]];
        [self.view addSubview:webView];
        
        UIView *buttonView = [[UIView alloc] init];
        buttonView.layer.cornerRadius = 20;
        buttonView.layer.masksToBounds = true;
        buttonView.backgroundColor = UIColor.blackColor;
        buttonView.translatesAutoresizingMaskIntoConstraints = false;
        
        [webView addSubview:buttonView];
        [webView bringSubviewToFront:buttonView];

        [NSLayoutConstraint activateConstraints:@[
            [buttonView.widthAnchor constraintEqualToConstant:50],
            [buttonView.heightAnchor constraintEqualToConstant:50],
            
            [NSLayoutConstraint constraintWithItem:buttonView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1 constant:20],
            [NSLayoutConstraint constraintWithItem:buttonView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20]
        ]];
        
        UIImageView *icon = [[UIImageView alloc] initWithImage:NULL];
        if (@available(iOS 13, *)) {
          icon = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"xmark"]];
        } else {
          // Alternative code for earlier versions of iOS.
        }

        icon.translatesAutoresizingMaskIntoConstraints = false;
        icon.tintColor = UIColor.whiteColor;
        [buttonView addSubview:icon];

        [NSLayoutConstraint activateConstraints:@[
            [icon.centerXAnchor constraintEqualToAnchor:buttonView.centerXAnchor],
            [icon.centerYAnchor constraintEqualToAnchor:buttonView.centerYAnchor]
        ]];

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [buttonView addGestureRecognizer:tapGesture];
}

-(void)handleTap:(UITapGestureRecognizer *)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

@end