//
//  BD_AstronautViewController.m
//  BerlinGraffiti
//
//  Created by Chris on 08.11.12.
//  Copyright (c) 2012 BerliniODDev. All rights reserved.
//

#import "BD_ViewController.h"
#import "BD_AstronautViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BD_AstronautViewController ()

@end

@implementation BD_AstronautViewController

@synthesize astronautView;
@synthesize astronautButt;
@synthesize xSpeed;
@synthesize xCurrent;
@synthesize ySpeed;
@synthesize yCurrent;
@synthesize zSpeed;
@synthesize zCurrent;

@synthesize audioPlayer;
@synthesize sfxPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    xCurrent=arc4random()%380;
    yCurrent=arc4random()%190;
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"hmmv2"
                                              withExtension:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:soundURL error:nil];
    [audioPlayer play];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self startAccelerometer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self stopAccelerometer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    xSpeed=xSpeed+acceleration.y;
    ySpeed=ySpeed+acceleration.x;
    
    xCurrent=xCurrent+xSpeed;
    yCurrent=yCurrent+ySpeed;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    [astronautView setFrame:CGRectMake(xCurrent, yCurrent, 94, 108)];
    [UIView commitAnimations];
    
    if (xCurrent>75 && xCurrent<85 && yCurrent>55 && yCurrent<65){
        NSLog(@"you did it");
        [astronautView setFrame:CGRectMake(80, 60, 94, 108)];
        
        [self stopAccelerometer];
        
        NSURL *sfxURL = [[NSBundle mainBundle] URLForResource:@"applause"
                                                withExtension:@"mp3"];
        sfxPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:sfxURL error:nil];
        [sfxPlayer play];
        
    }
    if (xCurrent<=0) {
        xSpeed=0-xSpeed;
        
        NSURL *sfxURL = [[NSBundle mainBundle] URLForResource:@"jump"
                                                withExtension:@"mp3"];
        sfxPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:sfxURL error:nil];
        [sfxPlayer play];
        
    }
    if (xCurrent>=380) {
        xSpeed=0-xSpeed;
        NSURL *sfxURL = [[NSBundle mainBundle] URLForResource:@"jump"
                                                withExtension:@"mp3"];
        sfxPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:sfxURL error:nil];
        [sfxPlayer play];
    }
    if (yCurrent<=0) {
        ySpeed=0-ySpeed;
        NSURL *sfxURL = [[NSBundle mainBundle] URLForResource:@"jump"
                                                withExtension:@"mp3"];
        sfxPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:sfxURL error:nil];
        [sfxPlayer play];
    }
    if (yCurrent>=180) {
        ySpeed=0-ySpeed;
        NSURL *sfxURL = [[NSBundle mainBundle] URLForResource:@"jump"
                                                withExtension:@"mp3"];
        sfxPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:sfxURL error:nil];
        [sfxPlayer play];
    }
    NSLog(@"X=%02f Y=%02f ∆X=%02f ∆Y=%02f",XCurrent,YCurrent,xSpeed,ySpeed);
}

- (void)stopAccelerometer {
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = nil;
}

- (void)startAccelerometer {
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    accelerometer.updateInterval = 0.11;
}

-(IBAction)quit:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
    
    if ([audioPlayer isPlaying]) [audioPlayer stop];
    
}

@end
