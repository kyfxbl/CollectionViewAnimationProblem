#import "MyHeaderView.h"
#import "Masonry.h"

@implementation MyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self){
        
        self.backgroundColor = [UIColor whiteColor];

        UILabel *header1 = [UILabel new];
        header1.backgroundColor = [UIColor yellowColor];
        header1.text = @"1111";
        
        UILabel *header2 = [UILabel new];
        header2.backgroundColor = [UIColor blueColor];
        header2.text = @"2222";
        
        [self addSubview:header1];
        [self addSubview:header2];
        
        [header1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(header2.mas_top);
            make.left.equalTo(@0);
            make.height.equalTo(@50);
            make.width.equalTo(@375);
        }];
        
        [header2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.left.equalTo(@0);
            make.height.equalTo(@50);
            make.width.equalTo(@375);
        }];
    }
    
    return self;
}

@end
