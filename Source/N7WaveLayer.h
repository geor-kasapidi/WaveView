//
//  N7WaveLayer.h
//  WaveView
//
//  Created by Георгий Касапиди on 03.09.16.
//  Copyright © 2016 N7. All rights reserved.
//

@import UIKit;

// TODO: rewrite with METAL

@interface N7WaveLayer : CALayer

@property (assign, nonatomic) NSUInteger numberOfWaves;
@property (strong, nonatomic) UIColor *waveColor;
@property (assign, nonatomic) CGFloat primaryLineWidth;
@property (assign, nonatomic) CGFloat secondaryLineWidth;
@property (assign, nonatomic) CGFloat frequency;
@property (assign, nonatomic) CGFloat density;
@property (assign, nonatomic) CGFloat phaseShift;
@property (assign, nonatomic) CGFloat idleAmplitude;

@property (nonatomic, readwrite) CGFloat amplitude;

@end
