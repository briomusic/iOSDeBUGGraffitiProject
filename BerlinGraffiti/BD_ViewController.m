//
//  BD_ViewController.m
//  BerlinGraffiti
//
//  Created by Chris on 12.10.12.
//  Copyright (c) 2012 BerliniODDev. All rights reserved.
//

#import "BD_ViewController.h"
#import "BD_AstronautViewController.h"

@interface BD_ViewController ()

@end

@implementation BD_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goAstro:(id)sender{
    NSLog(@"Button pressed");
    BD_AstronautViewController *astroView = [[BD_AstronautViewController alloc] initWithNibName:@"BD_AstronautViewController" bundle:Nil];
    [astroView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:astroView animated:YES];

    
}

@end
