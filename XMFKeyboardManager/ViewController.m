//
//  ViewController.m
//  XMFKeyboardManager
//
//  Created by xumingfa on 16/8/31.
//  Copyright © 2016年 xumingfa. All rights reserved.
//

#import "ViewController.h"
#import "UIView+XMFKeyboard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *centerView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view xmf_addKeyboardListen];
    [self.centerView xmf_addKeyboardHeightChangeListenWithAutoLayout:YES changeHeight:10];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view xmf_removeKeyboardListen];
    [self.centerView xmf_removeKeyboardHeightChangeListen];
}

- (void)xmf_changeHeightkeyboardWillHide: (NSNotification *)notification{
    
    CGFloat duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewKeyframeAnimationOptions curve = [[notification.userInfo objectForKey: UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    
    CGRect bounds = self.frame;
    bounds.origin.y = self.xmf_originalY;
    moveView.frame = bounds;
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:curve animations:^{
        [self.superview layoutIfNeeded];
    } completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
