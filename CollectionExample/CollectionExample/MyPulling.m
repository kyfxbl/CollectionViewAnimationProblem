#import "MyPulling.h"

@implementation MyPulling

{
    UIScrollView *_scrollView;
    UILabel *label;
}

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 54)];
        label.text = @"pulling";
        
        [self addSubview:label];
    }
    
    return self;
}

-(void) willMoveToSuperview:(UIView *)newSuperview
{
    
    CGRect frame = self.frame;
    frame.origin.y = -54;
    self.frame = frame;
    
    
    _scrollView = (UIScrollView *)newSuperview;
    
    _scrollView.alwaysBounceVertical = YES;
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewContentOffsetDidChange:change];
    }
}

-(void) scrollViewContentOffsetDidChange:(NSDictionary*)change
{
    label.text = [NSString stringWithFormat:@"%f", _scrollView.contentOffset.y];
    
    if(_scrollView.contentOffset.y >= -100){
        return;
    }
    
    if(_scrollView.isDragging){
        return;
    }
    
    [self refresh];
}

-(void) refresh
{
    [UIView animateWithDuration:3.f animations:^{
        
        // increase contentInset by 54, for pulling component
        
        UIEdgeInsets inset =  _scrollView.contentInset;
        inset.top = 54;
        _scrollView.contentInset = inset;
        
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.4 animations:^{
                
                UIEdgeInsets inset =  _scrollView.contentInset;
                inset.top = 0;
                _scrollView.contentInset = inset;
                
            } completion:nil];
        });
    }];
}

@end
