#import "ViewController.h"
#import <SafariServices/SafariServices.h>
@interface ViewController () <SFSafariViewControllerDelegate>

@end

@implementation ViewController
@synthesize btn;
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)click:(id)sender {
//    NSURL *url = @"https://naver.com/";
//    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:url];
//    svc.delegate = self;
//    [self presentViewController:svc animated:YES completion:nil];
}

//- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
//    [self dismissViewControllerAnimated:true completion:nil];
//}


@end
