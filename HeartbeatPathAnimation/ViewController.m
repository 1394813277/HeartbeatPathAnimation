//
//  ViewController.m
//  HeartbeatPathAnimation
//
//  Created by 周洋 on 16/4/20.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "ViewController.h"

static const CGFloat kLayerWidth = 350.0f;

@interface ViewController (){
    CAShapeLayer *shapeLayer2;
    CAShapeLayer *shapeLayer;
    CGFloat strokeTmp;
}

@property(nonatomic,strong) CADisplayLink *waveDisplaylink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    strokeTmp = 0;
    
    shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2.0f - kLayerWidth/2.0f, CGRectGetHeight(self.view.frame)/2.0f - kLayerWidth/2.0f, kLayerWidth, kLayerWidth)];
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
    [shapeLayer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [shapeLayer setLineWidth:5.0f];
    
    [shapeLayer setStrokeStart:0.0];
    [shapeLayer setStrokeEnd:0.3];
    
    
    
    
    UIBezierPath *shapeLayerPath = [UIBezierPath bezierPath];
    [shapeLayerPath moveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth/3.0f)];
    [shapeLayerPath addQuadCurveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth) controlPoint:CGPointMake(kLayerWidth, 0)];
    [shapeLayerPath addQuadCurveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth/3.0f) controlPoint:CGPointMake(0, 0)];
    
    [shapeLayerPath closePath];
    
    [shapeLayer setPath:[shapeLayerPath CGPath]];
    [self.view.layer addSublayer:shapeLayer];
    [shapeLayer removeAllAnimations];
    
    shapeLayer2 = [CAShapeLayer layer];
    [shapeLayer2 setFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2.0f - kLayerWidth/2.0f, CGRectGetHeight(self.view.frame)/2.0f - kLayerWidth/2.0f, kLayerWidth, kLayerWidth)];
    
    [shapeLayer2 setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer2 setStrokeColor:[UIColor redColor].CGColor];
    [shapeLayer2 setAnchorPoint:CGPointMake(0.5, 0.5)];
    [shapeLayer2 setLineWidth:5.0f];
    
    [shapeLayer2 setStrokeStart:0.0];
    [shapeLayer2 setStrokeEnd:0.3];
    
    
    
    
    UIBezierPath *shapeLayerPath2 = [UIBezierPath bezierPath];
    [shapeLayerPath2 moveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth/3.0f)];
    [shapeLayerPath2 addQuadCurveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth) controlPoint:CGPointMake(kLayerWidth, 0)];
    [shapeLayerPath2 addQuadCurveToPoint:CGPointMake(kLayerWidth/2.0f, kLayerWidth/3.0f) controlPoint:CGPointMake(0, 0)];
    
    [shapeLayerPath2 closePath];
    
    [shapeLayer2 setPath:[shapeLayerPath2 CGPath]];
    [self.view.layer addSublayer:shapeLayer2];
    [shapeLayer2 removeAllAnimations];
    
    
    [shapeLayer setStrokeStart:0];
    [shapeLayer setStrokeEnd:0];
    [shapeLayer2 setStrokeStart:0];
    [shapeLayer2 setStrokeEnd:0];
    
    
    
    
    
    
    _waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [_waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getCurrentWave:(CADisplayLink *)link{
    
    strokeTmp += 0.01f;
    
    if (strokeTmp > 1) {
        strokeTmp = 0;
    }
    
    
    if (strokeTmp >= 0.1) {
        
        
        
        [shapeLayer setStrokeStart:strokeTmp-0.1];
        [shapeLayer setStrokeEnd:strokeTmp];
        
        
        
        [shapeLayer2 setStrokeStart:0];
        [shapeLayer2 setStrokeEnd:0];
    }else{
        
        
        [shapeLayer setStrokeStart:0];
        [shapeLayer setStrokeEnd:strokeTmp];
        [shapeLayer2 setStrokeStart:strokeTmp + 0.9];
        [shapeLayer2 setStrokeEnd:1];
    }
    
    [shapeLayer removeAnimationForKey:@"strokeStart"];
    [shapeLayer removeAnimationForKey:@"strokeEnd"];
    [shapeLayer2 removeAnimationForKey:@"strokeStart"];
    [shapeLayer2 removeAnimationForKey:@"strokeEnd"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
