//
//  ViewController.m
//  WebViewTest
//
//  Created by 강조은 on 2022/01/26.
//

#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate>

@end

@implementation ViewController
NSURLRequest *request;
- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    [self.webView setNavigationDelegate:self];
    [self.webView addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:NULL];
    request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://naver.com/"]];
        [self.webView loadRequest:request];
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"now url : %@",request.URL);
    if([request.URL isEqual: @"https://oviewm.com/oview/kmc/step04.php"])
    {
      //  [self.webView loadRequest:request];
        NSLog(@"now2 url : %@",request.URL);
    }
}




-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"now3 url : %@",request.URL);
}

@end
