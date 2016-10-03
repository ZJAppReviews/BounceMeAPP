//
//  MainMenuVeiwController.m
//  BounceMeAPP
//
//  Created by Keith Landry on 6/28/12.
//  Copyright 2012 UCLA. All rights reserved.
//

#import "MainMenuVeiwController.h"
#import "BounceMeAPPViewController.h"
#import "OptionsVeiwController.h"


@implementation MainMenuVeiwController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


-(IBAction)play:(id)sender{

	BounceMeAPPViewController* playVeiwController = [[BounceMeAPPViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:playVeiwController animated:YES];
	[playVeiwController release];
	
	

}
-(IBAction)options:(id)sender{

	OptionsVeiwController* optViewController = [[OptionsVeiwController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:optViewController animated:YES];
	[optViewController release];
	
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
