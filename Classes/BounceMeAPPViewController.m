//
//  BounceMeAPPViewController.m
//  BounceMeAPP
//
//  Created by Keith Landry on 5/22/12.
//  Copyright 2012 UCLA. All rights reserved.
//

#import "BounceMeAPPViewController.h"

@implementation BounceMeAPPViewController
@synthesize bannerIsVisible;

-(void)imagemoves{
	
	//*
	if (ball.center.x + ballVx*.01 < minXallowed || ball.center.x + ballVx*.01 > maxXallowed)
	{
		willHitWallX = YES;
		wallsHit++;
	}
	
	if (ball.center.y + ballVy*.01 < minYallowed || ball.center.y + ballVy*.01 > maxYallowed)
	{
		willHitWallY = YES;
		wallsHit++;
	}
	
	if (willHitWallX)
	{
		/*
		if (abs(ballVx) < 10)
	  {
		  ballVx = - ballVx*.5;;
	  }
		else*/
		
	  ballVx = - ballVx*.707;
		[self playSound];
	}
	if (willHitWallY)
	{
		/*
		if (abs(ballVy) < 10)
		{
			ballVy = -ballVy*.5;
		}
		else*/
		
		ballVy = - ballVy*.707;
		[self playSound];
	}
	

	CGPoint newLocation = CGPointMake(ball.center.x + ballVx*.01 + 1/2*ax*pow(.01, 2), ball.center.y + ballVy*.01 + 1/2*ay*pow(.01, 2));

	ballVx = ballVx + ax*.01;
	ballVy = ballVy - ay*.01;
	
	ball.center = newLocation;
	
	//ball.center = CGPointMake(ball.center.x + ballVx*.05, ball.center.y + ballVy*.05);
	
	
	[y1L setText:[NSString stringWithFormat:@"%f",newLocation.x]];
	[prevYL setText:[NSString stringWithFormat:@"%f",newLocation.y]];

	
	//*/
	
	willHitWallX = NO;
	willHitWallY = NO;
}

-(IBAction)reset:(id)sender{

	CGPoint posONreset = CGPointMake(100, 100);
	
	ball.center = posONreset;
	
	[timer invalidate];
	
	wallsHit = 0;
	
	willHitWallX    = NO;
	willHitWallY    = NO;
	willHitBothWals = NO;
	
	
}

-(void)findvelocity{
	//*
	x2 = ball.center.x;
	y2 = ball.center.y;
 
	
	ballVx = (x2 - x1)/.05;
	ballVy = (y2 - y1)/.05;
	 
	/*
	if (ballVx >  100){ballVx =  100;}
	if (ballVx < -100){ballVx = -100;}
	if (ballVy >  100){ballVy =  100;}
	if (ballVy < -100){ballVy = -100;}

//*
	[x1L setText:[NSString stringWithFormat:@"%d",x1]];
	[y1L setText:[NSString stringWithFormat:@"%d",y1]];
	[prevXL setText:[NSString stringWithFormat:@"%d",x2]];
	[prevYL setText:[NSString stringWithFormat:@"%d",y2]];
	
	[velocityx setText:[NSString stringWithFormat:@"%f",ballVx]];
	[velocityy setText:[NSString stringWithFormat:@"%f",ballVy]];
//*/	
 
 
	x1 = x2;
	y1 = y2;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch *myTouch = [[event allTouches] anyObject];
	
//	CGPoint touchLocation = [myTouch locationInView:myTouch.view];
	CGPoint touchLocation = [myTouch locationInView: [UIApplication sharedApplication].keyWindow];

	
	CGPoint ballLocation = CGPointMake(ball.center.x-50, ball.center.y);
	CGRect ballLimits = CGRectMake(ballLocation.x, ballLocation.y, 100, 100);

	/*
	[centerx setText:[NSString stringWithFormat:@"%d", ball.center.x]];
	[centery setText:[NSString stringWithFormat:@"%d", ball.center.y]];
	[x1L setText:[NSString stringWithFormat:@"%d", touchLocation.x]];
	[y1L setText:[NSString stringWithFormat:@"%d",touchLocation.y]];
	*/
	
	
	if ( CGRectContainsPoint(ballLimits, touchLocation) )
	{
		wasPickedUp = YES;
		
		[timer invalidate];
		
		//[label setText:@"Touched ball"];
		
		x1 = ballLocation.x;
		//x3 = ballLocation.x;
		y1 = ballLocation.y;
		//y3 = ballLocation.y;
		
		CGPoint t = CGPointMake(touchLocation.x, touchLocation.y-40);
		
		ball.center = t;
		
		firstLOOP = YES;
		
		timer2 = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(findvelocity) userInfo:nil repeats:YES];	
	}
	else
	{
		wasPickedUp = NO;
		[label setText:@"Didn't touch ouched ball"];
	}

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
		
	UITouch *myTouch = [[event allTouches] anyObject];
	
	CGPoint moveLocation = [myTouch locationInView: [UIApplication sharedApplication].keyWindow];
	CGPoint t = CGPointMake(moveLocation.x, moveLocation.y-40);

	
	if (wasPickedUp)
	{
		wallsHit = 0;
		
    if (CGRectContainsPoint(elgblArea, moveLocation))
		{
			ball.center = t;
		}		
	}	


}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	//for now just set speed to some initial vlue
	
	
	
	
	if (wasPickedUp)
	{
		
		[timer2 invalidate];
		timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(imagemoves) userInfo:nil repeats:YES];
	}
	

	wasPickedUp = NO;	
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {

	if (!bannerIsVisible)
	{
		adBannerView.frame = CGRectOffset(adBannerView.frame, 0, 100);
		bannerIsVisible = YES;
		
		minYallowed = ballHeight/2+50;
		elgblArea = CGRectMake(minXallowed, minYallowed*2-50, maxXallowed - minXallowed, maxYallowed - minYallowed);

	}
	
	
}
 */
/*
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{

	if (bannerIsVisible)
	{
		adBannerView.frame = CGRectOffset(adBannerView.frame, 0, -100);
		[UIView commitAnimations];
	  bannerIsVisible = NO;
		
		minYallowed = ballHeight/2;
		elgblArea = CGRectMake(minXallowed, minYallowed, maxXallowed - minXallowed, maxYallowed - minYallowed);

	}
	/*
	adBannerView.frame = CGRectOffset(banner.frame, 0, 50);
	[UIView commitAnimations];
	bannerIsVisible = YES;
*/
//}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
	
	//*
	ax = 9.8*69/.238*acceleration.x;
	ay = 9.8*69/.238*acceleration.y;
	az = acceleration.z;
//*/
	/*
	ax = 9.8*39.37*163*acceleration.x;
	ay = 9.8*39.37*163*acceleration.y;
	az = 9.8*39.37*163*acceleration.z;
//*/
	/*
	ax = 9.8*3*acceleration.x;
	ay = 9.8*3*acceleration.y;
	az = acceleration.z;
	//*/
/*	ax = 0;
	ay = 0;
	az = 0;
*/
	
	[velocityx setText:[NSString stringWithFormat:@"%f",ax]];
	[velocityy setText:[NSString stringWithFormat:@"%f",ay]];

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	Accel = [UIAccelerometer sharedAccelerometer];
	Accel.updateInterval = .05;
	Accel.delegate = self;
	
    [super viewDidLoad];
	/*
	adBannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	//adBannerView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,ADBannerContentSizeIdentifierLandscape,nil];
	adBannerView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
	
	adBannerView.delegate = self;
	adBannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
	adBannerView.frame = CGRectOffset(adBannerView.frame, 0, -100);
	[self.view addSubview:adBannerView];
	bannerIsVisible = NO;
	*/

	ballWidth  = 69;
	ballHeight = 69;
	
	minXallowed = ballWidth/2;
	maxXallowed = 320 - ballWidth/2;
	
	minYallowed = ballHeight/2;
	maxYallowed = 460 - ballHeight/2;
	
	elgblArea = CGRectMake(minXallowed, minYallowed+50, maxXallowed - minXallowed, maxYallowed - minYallowed);
	/*
	float initialVelocityX =60;
	float initialVelocityY =60;
	ballVx = initialVelocityX;
	ballVy = initialVelocityY;
	//*/
	wallsHit = 0;
	timeInterval=.05;
	
	willHitWallX = NO;
	willHitWallY = NO;
	willHitBothWals = NO;
	
	int num=0;
	
}


-(void)playSound {
	
	

	NSString *path = [[NSBundle mainBundle]pathForResource:@"Bounce3" ofType:@"aiff"];
	
	AVAudioPlayer *audioplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
		
	float vol = pow( pow(ballVx, 2) + pow(ballVy, 2) ,0.5)/50;
	
	audioplayer.delegate = self;
	
	[audioplayer setVolume:vol];
		
	[audioplayer play];
	
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)audioplayer successfully:(BOOL)flag{

	[audioplayer release];
	
	//num++;
	
	//[label setText:[NSString stringWithFormat:@"%d",num]];
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{

	[label setText:@"error"];

}

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{

	[label setText:@"interupt"];


}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	//adBannerView = nil;
	
}


- (void)dealloc {
    [super dealloc];
	//[adBannerView release];

}

@end
