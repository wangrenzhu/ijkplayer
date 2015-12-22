/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.textView setText:@"http://cache.m.iqiyi.com/dc/dt/mobile/20151119/dd/aa/339966e3441b376c13bd00a17e472b0b.m3u8?qypid=420503300_22&qd_src=5be6a2fdfe4f4a1a8c7b08ee46a18887&qd_tm=1450257172000&qd_ip=182.92.156.134%2C+115.29.100.77&qd_sc=aef724ea3cc8d6abbd88f001acaf7c22&mbd=f0f6c3ee5709615310c0f053dc9c65f2_5.6_1"];
//    [self.textView setText:@"http://edge.v.iask.com/139489676.hlv?KID=sina,viask&Expires=1450540800&ssig=2A5%2BennMW3"];
    [self.textView setText:@"http://218.77.2.31/edge.v.iask.com/139505306.mp4?KID=sina,viask&Expires=1450800000&ssig=bCRRGeczMW&wshc_tag=1&wsts_tag=5677d950&wsid_tag=ca6888c5&wsiphost=ipdbm"];
}

- (void)onClickPlayButton {
    NSURL *url = [NSURL URLWithString:self.textView.text];
    NSString *scheme = [[url scheme] lowercaseString];
    
    if ([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"]) {
        [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
//            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self onClickPlayButton];
}

@end
