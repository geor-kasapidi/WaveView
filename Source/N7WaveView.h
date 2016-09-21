//
//  N7WaveView.h
//  WaveView
//
//  Created by Георгий Касапиди on 03.09.16.
//  Copyright © 2016 N7. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface N7WaveView : UIView

@property (nonatomic, readwrite) IBInspectable NSUInteger numberOfWaves;
@property (nonatomic, readwrite) IBInspectable UIColor *waveColor;
@property (nonatomic, readwrite) IBInspectable CGFloat primaryLineWidth;
@property (nonatomic, readwrite) IBInspectable CGFloat secondaryLineWidth;

/// The frequency of the sinus wave. The higher the value, the more sinus wave peaks you will have.
@property (nonatomic, readwrite) CGFloat frequency;

/// The lines are joined stepwise, the more dense you draw, the more CPU power is used.
@property (nonatomic, readwrite) CGFloat density;

/// The phase shift that will be applied with each level setting. Change this to modify the animation speed or direction.
@property (nonatomic, readwrite) CGFloat phaseShift;

/// The amplitude that is used when the incoming amplitude is near zero. Setting a value greater 0 provides a more vivid visualization.
@property (nonatomic, readwrite) IBInspectable CGFloat idleAmplitude;

@property (nonatomic, readwrite) CGFloat amplitude;

@end
