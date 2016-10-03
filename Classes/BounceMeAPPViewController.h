//
//  BounceMeAPPViewController.h
//  BounceMeAPP
//
//  Created by Keith Landry on 5/22/12.
//  Copyright 2012 UCLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>


@interface BounceMeAPPViewController : UIViewController <ADBannerViewDelegate, AVAudioPlayerDelegate, UIAccelerometerDelegate> {

	IBOutlet UIImageView * ball;
	IBOutlet UILabel * label;
	IBOutlet UILabel * centerx;
	IBOutlet UILabel * centery;
	IBOutlet UILabel * velocityx;
	IBOutlet UILabel * velocityy;
	
	IBOutlet UILabel * x1L;
	IBOutlet UILabel * y1L;
	IBOutlet UILabel * prevXL;
	IBOutlet UILabel * prevYL;

	//ADBannerView *adBannerView;
	BOOL *bannerIsVisible;
	
	NSTimer *timer;
	NSTimer *timer2;
	
	int timeInterval;
	
	CGRect elgblArea;
	
	//AVAudioPlayer * audioplayer;
	
	int ballWidth;
	int ballHeight;
	int wallsHit;
	
	int x1;
	int x2;
	int x3;
	int y1;
	int y2;
	int y3;

	int num;
	
	int minXallowed;
	int maxXallowed;
	int minYallowed;
	int maxYallowed;
	
	float ballVx;
	float ballVx2;
	float ballVy;
	float ballVy2;
	
	BOOL wasPickedUp;
	BOOL willHitWallX;
	BOOL willHitWallY;
	BOOL willHitBothWals;
	BOOL firstLOOP;
	
	UIAccelerometer * Accel;
	float ax;
	float ay;
	float az;
	
}

-(IBAction)reset:(id)sender;
-(void)imagemoves;
-(void)findvelocity;
-(void)playSound;
@property(nonatomic,assign) BOOL *bannerIsVisible;

@end

