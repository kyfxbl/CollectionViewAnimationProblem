#import "TestCollectionViewCell.h"

@implementation TestCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        label.text = @"here";
        
        [self addSubview:label];
    }
    
    return self;
}

@end
