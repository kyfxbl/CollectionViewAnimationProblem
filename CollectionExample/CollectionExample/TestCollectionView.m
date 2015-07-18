#import "TestCollectionView.h"
#import "CSStickyHeaderFlowLayout.h"
#import "TestCollectionViewCell.h"
#import "MyHeaderView.h"
#import "MyPulling.h"

@implementation TestCollectionView

{
    RootCollectionViewController *myController;
}

-(instancetype) initWithController:(RootCollectionViewController*)controller
{
    CSStickyHeaderFlowLayout *layout = [[CSStickyHeaderFlowLayout alloc] init];
    layout.parallaxHeaderReferenceSize = CGSizeMake(375, 100);
    layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(375, 50);
    layout.parallaxHeaderAlwaysOnTop = YES;
  
    self = [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    if(self){
        
        myController = controller;
        self.backgroundColor = [UIColor whiteColor];
        
        self.dataSource = myController;
        self.delegate = myController;
        
        [self registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
        [self registerClass:[MyHeaderView class] forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader withReuseIdentifier:@"header"];
        
        MyPulling *pulling = [[MyPulling alloc] initWithFrame:CGRectMake(0, 0, 375, 54)];
        [self addSubview:pulling];
    }
    return self;
}

@end
