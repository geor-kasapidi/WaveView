//
//  N7WaveView.m
//  WaveView
//
//  Created by Георгий Касапиди on 03.09.16.
//  Copyright © 2016 N7. All rights reserved.
//

#import "N7WaveView.h"
#import "N7WaveLayer.h"

@implementation N7WaveView

+ (Class)layerClass {
    return [N7WaveLayer class];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (self.superview == nil && newSuperview != nil) {
        [[CADisplayLink displayLinkWithTarget:self.layer selector:@selector(setNeedsDisplay)] addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

@dynamic numberOfWaves;
@dynamic waveColor;
@dynamic primaryLineWidth;
@dynamic secondaryLineWidth;
@dynamic frequency;
@dynamic density;
@dynamic phaseShift;
@dynamic idleAmplitude;
@dynamic amplitude;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:NSStringFromSelector(@selector(numberOfWaves))]       ||
        [key isEqualToString:NSStringFromSelector(@selector(waveColor))]           ||
        [key isEqualToString:NSStringFromSelector(@selector(primaryLineWidth))]    ||
        [key isEqualToString:NSStringFromSelector(@selector(secondaryLineWidth))]  ||
        [key isEqualToString:NSStringFromSelector(@selector(idleAmplitude))]) {
        
        [self.layer setValue:value forKey:key];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(numberOfWaves)       ||  aSelector == @selector(setNumberOfWaves:)       ||
        aSelector == @selector(waveColor)           ||  aSelector == @selector(setWaveColor:)           ||
        aSelector == @selector(primaryLineWidth)    ||  aSelector == @selector(setPrimaryLineWidth:)    ||
        aSelector == @selector(secondaryLineWidth)  ||  aSelector == @selector(setSecondaryLineWidth:)  ||
        aSelector == @selector(frequency)           ||  aSelector == @selector(setFrequency:)           ||
        aSelector == @selector(density)             ||  aSelector == @selector(setDensity:)             ||
        aSelector == @selector(phaseShift)          ||  aSelector == @selector(setPhaseShift:)          ||
        aSelector == @selector(idleAmplitude)       ||  aSelector == @selector(setIdleAmplitude:)       ||
        aSelector == @selector(amplitude)           ||  aSelector == @selector(setAmplitude:)) {
        
        return self.layer;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

- (void)prepareForInterfaceBuilder {
    [self.layer setNeedsDisplay];
    
    [super prepareForInterfaceBuilder];
}

@end
