//
//  BD_AstronautViewController.h
//  BerlinGraffiti
//
//  Created by Chris on 08.11.12.
//  Copyright (c) 2012 BerliniODDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface BD_AstronautViewController : UIViewController <UIAccelerometerDelegate>{
    IBOutlet UIView *astronautView;
    IBOutlet UIButton *astronautButt;
    CGFloat xSpeed;
    CGFloat XCurrent;
    CGFloat ySpeed;
    CGFloat YCurrent;
    CGFloat zSpeed;
    CGFloat zCurrent;
    
    AVAudioPlayer *audioPlayer;
    AVAudioPlayer *sfxPlayer;
    
}

@property (nonatomic, strong) IBOutlet UIView *astronautView;
@property (nonatomic, strong) IBOutlet UIButton *astronautButt;
@property (nonatomic) CGFloat xSpeed;
@property (nonatomic) CGFloat xCurrent;
@property (nonatomic) CGFloat ySpeed;
@property (nonatomic) CGFloat yCurrent;
@property (nonatomic) CGFloat zSpeed;
@property (nonatomic) CGFloat zCurrent;

@property (nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) AVAudioPlayer *sfxPlayer;

- (void)accelerometer:(UIAccelerometer *)accelerometer
        didAccelerate:(UIAcceleration *)acceleration;

-(IBAction)quit:(id)sender;

@end
