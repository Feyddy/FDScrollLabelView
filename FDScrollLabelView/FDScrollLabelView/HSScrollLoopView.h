//
//  HSScrollLoopView.h
//  the-master
//
//  Created by Feyddy on 2017/4/18.
//  Copyright © 2017年 HSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSScrollLoopView;
@protocol HSScrollLoopViewDelegate <NSObject>

- (void)scrollLoopViewCloseButtonAction:(HSScrollLoopView *)scrollLoopView;

@end

@interface HSScrollLoopView : UIView

@property (nonatomic, weak) id <HSScrollLoopViewDelegate> delegate;

- (void)scrollLoopViewWithtext:(NSString *)text;

- (void)stopTimer;

@end
