//
//  HSScrollLoopView.m
//  the-master
//
//  Created by Feyddy on 2017/4/18.
//  Copyright © 2017年 HSH. All rights reserved.
//

#import "HSScrollLoopView.h"

#define RGBCOLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
@interface HSScrollLoopView()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSTimer *timer;

@end


@implementation HSScrollLoopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBCOLOR(254, 252, 237);
        _count = 1;
        
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        self.textLabel.userInteractionEnabled = YES;
        self.textLabel.textColor = RGBCOLOR(255, 98, 0);
        self.textLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.textLabel];
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.frame.size.height)];
        leftView.backgroundColor = RGBCOLOR(254, 252, 237);
        [self addSubview:leftView];
        
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - self.frame.size.height + 14, 0, self.frame.size.height - 14, self.frame.size.height)];
        rightView.backgroundColor = RGBCOLOR(254, 252, 237);
        [self addSubview:rightView];
        
        
        UIImageView *trumpetImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, self.frame.size.height - 10, self.frame.size.height - 10)];
        trumpetImageView.backgroundColor = RGBCOLOR(254, 252, 237);
        trumpetImageView.image = [UIImage imageNamed:@"trumpet"];
        [self addSubview:trumpetImageView];
        
        
        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - self.frame.size.height , 7, self.frame.size.height - 14, self.frame.size.height - 14)];
        [closeBtn addTarget:self action:@selector(closeViewAction) forControlEvents:UIControlEventTouchUpInside];
        closeBtn.backgroundColor = trumpetImageView.backgroundColor = RGBCOLOR(254, 252, 237);
        [closeBtn setBackgroundImage: [UIImage imageNamed:@"close_x"] forState:UIControlStateNormal];
        [self addSubview:closeBtn];
        
    }
    return self;
}

- (void)scrollLoopViewWithtext:(NSString *)text{
    
    self.textLabel.text = text;

    _timer = [NSTimer timerWithTimeInterval:0.005 target:self selector:@selector(moveAction) userInfo:nil repeats:YES];
        
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    

}

- (void)moveAction {
    
    self.textLabel.frame = CGRectMake(self.frame.size.width - 0.1 * _count, 0, self.frame.size.width, self.frame.size.height);
    _count ++ ;
    
    if ( 0.1 * _count >  2 * self.frame.size.width) {
        self.textLabel.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        _count = 1;
    }
}

- (void)closeViewAction {
    if ([self.delegate respondsToSelector:@selector(scrollLoopViewCloseButtonAction:)]) {
        [self.delegate scrollLoopViewCloseButtonAction:self];
    }
}

- (void)stopTimer {
    [_timer invalidate];
}

@end
