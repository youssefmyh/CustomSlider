//
//  CustomSlider.h
//  Slider
//
//  Created by youssef on 2/4/15.
//  Copyright (c) 2015 youssef. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSlider : UIView
{
    UIImageView *img_left_thum; // Left Thum
    UIImageView *img_right_thum; // Right Thum
    float width; // original width
    float height;   //original height
    float realWidth; // real width after remove padding
    float startX; // start X of slider
    float endX; // End X
    
    CGPoint startPoints_firstSlider; // start left slider point init on touch begin
    CGPoint startPoints_secondSlider; // start second slider point init on touch begin
    CGPoint touchPoint; // pre touchPoint
    
    BOOL isLeft; 
    BOOL isRight;
    
   
    UILabel *lbl_leftValue;
    UILabel *lbl_RightValue;
    CGRect innerspaceRect;
}
@property float leftValue;
@property float rightValue;
@property(nonatomic) float minDistance;


@end
