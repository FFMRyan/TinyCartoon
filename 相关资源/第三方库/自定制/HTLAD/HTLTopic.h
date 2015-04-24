//
//  HTLTopic.h
//  HTLCollectionViewDemo
//
//  Created by HTL on 14-1-7.
//
//

#import <UIKit/UIKit.h>
@protocol HTLTopicDelegate<NSObject>
-(void)didClick:(id)data;
-(void)currentPage:(int)page total:(NSUInteger)total;
@end
@interface HTLTopic : UIScrollView<UIScrollViewDelegate>{
    UIButton * pic;
    bool flag;
    int scrollTopicFlag;
    NSTimer * scrollTimer;
    int currentPage;
    CGSize imageSize;
    UIImage *image;
}
@property(nonatomic,strong)NSArray * pics;
@property(nonatomic,retain)id<HTLTopicDelegate> HTLdelegate;
-(void)releaseTimer;
-(void)upDate;
@end
