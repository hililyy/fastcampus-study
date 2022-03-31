//
//  ViewController.h
//  WebViewTest
//
//  Created by 강조은 on 2022/01/26.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet WKWebView *webView;

@property (strong, nonatomic) IBOutlet UIView *view;

@end

