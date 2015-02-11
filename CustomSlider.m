//
//  CustomSlider.m
//  Slider
//
//  Created by youssef on 2/4/15.
//  Copyright (c) 2015 youssef. All rights reserved.
//

#import "CustomSlider.h"

@implementation CustomSlider

-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if(self)
    {
        width=frame.size.width;
        height=frame.size.height;
        
        startX=10;
        endX=width-10;
        realWidth=endX-startX;
        img_left_thum=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left.png"]];
        img_right_thum=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right.png"]];
        img_left_thum.layer.cornerRadius=2;
        img_right_thum.layer.cornerRadius=2;

        self.layer.borderColor=[[UIColor blackColor] CGColor];
        self.layer.borderWidth=1;
        
        if(_minDistance<=0)
            _minDistance=20;
        
        img_left_thum.frame=CGRectMake(0, height/2-10, 20, 20);
        img_right_thum.frame=CGRectMake(_minDistance, height/2-10, 20, 20);
         [self updateInnerSpace];
        
        
        lbl_leftValue=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 30, 20)];
        lbl_RightValue=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-20, 0, 100, 20)];
        lbl_leftValue.textColor=[UIColor blackColor];
        lbl_RightValue.textColor=[UIColor blackColor];
        lbl_RightValue.font=[UIFont systemFontOfSize:10];
        lbl_leftValue.font=[UIFont systemFontOfSize:10];

        lbl_leftValue.text=@"0";
        lbl_RightValue.text=@"0";

        [self addSubview:lbl_leftValue];
        [self addSubview:lbl_RightValue];

        [self addSubview:img_left_thum];
        [self addSubview:img_right_thum];
        
    }
    
    return self;
}
/*
 Adjust Right Thum based on _min distance
 */
-(void)adjustThumLocations
{
    img_right_thum.frame=CGRectMake(_minDistance, height/2-10, 20, 20);
    [self updateInnerSpace];

}
/*value shoudl be between 0 ---1*/
-(void)setMinDistance:(float)minDistance
{
    if(minDistance>0&&minDistance<1)
    {
        _minDistance=minDistance*realWidth;
        [self adjustThumLocations];
    }else
    {
        _minDistance=20; // image size
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        touchPoint=[touch locationInView:self];
        
        if(CGRectContainsPoint(img_left_thum.frame, touchPoint))
        {
            startPoints_firstSlider=touchPoint;
            isLeft=true;
        }
        
        if(CGRectContainsPoint(img_right_thum.frame, touchPoint))
        {
            startPoints_secondSlider=touchPoint;
            isRight=true;
        }

        
    }
    

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        touchPoint=[touch locationInView:self];
        
        if(CGRectContainsPoint(img_left_thum.frame, touchPoint))
        {
           isLeft=false;
        }
        
        if(CGRectContainsPoint(img_right_thum.frame, touchPoint))
        {
            isRight=false;
        }
        
    }


}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
        UITouch *touch=[touches anyObject];
        CGPoint movedTouch=[touch locationInView:self];
        if(isLeft)
        {
            float dx = movedTouch.x - startPoints_firstSlider.x;
            CGPoint newcenter = CGPointMake(
                                            img_left_thum.center.x + dx,
                                            img_left_thum.center.y);
            if(newcenter.x+_minDistance<img_right_thum.center.x&&(newcenter.x<endX&&newcenter.x>startX)){
            img_left_thum.center=newcenter;
            startPoints_firstSlider=movedTouch;
                [self updateInnerSpace];

            }
        }
        if(isRight)
        {
            float dx = movedTouch.x - startPoints_secondSlider.x;
            CGPoint newcenter = CGPointMake(
                                            img_right_thum.center.x + dx,
                                            img_right_thum.center.y);
            if(newcenter.x-_minDistance>img_left_thum.center.x&&(newcenter.x<endX&&newcenter.x>startX)){
                img_right_thum.center=newcenter;

            startPoints_secondSlider=movedTouch;
                [self updateInnerSpace];

            }
        }

}

-(void) drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context,rect);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, innerspaceRect);
}
/*
 -update the space between left and right slider
 -set Slider values
 */
-(void)updateInnerSpace
{
  float spaceWidth= img_right_thum.center.x-img_left_thum.center.x;
    innerspaceRect=CGRectMake(img_left_thum.center.x, img_left_thum.center.y-5, spaceWidth, 10);
    [self setNeedsDisplay];
    _leftValue=img_left_thum.frame.origin.x/realWidth;
    _rightValue=img_right_thum.frame.origin.x/realWidth;
   
    lbl_leftValue.text=[NSString stringWithFormat:@"%0.2f",_leftValue];
    lbl_RightValue.text=[NSString stringWithFormat:@"%0.2f",_rightValue];

}

@end
