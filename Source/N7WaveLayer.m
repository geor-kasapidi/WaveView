//
//  N7WaveLayer.m
//  WaveView
//
//  Created by Георгий Касапиди on 03.09.16.
//  Copyright © 2016 N7. All rights reserved.
//

#import "N7WaveLayer.h"

@interface N7WaveLayer ()

@property (assign, nonatomic) CGFloat phase;

@property (nonatomic, readonly) CGFloat internalAmplitude;

@end

@implementation N7WaveLayer

@dynamic amplitude;

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        self.numberOfWaves = 6;
        self.waveColor = [UIColor blackColor];
        self.primaryLineWidth = 1.5;
        self.secondaryLineWidth = 0.5;
        self.frequency = 1.5;
        self.density = 1.0;
        self.phaseShift = -0.15;
        self.idleAmplitude = 0.01;
        
        self.amplitude = 0.0;
        
        self.phase = 0.0;
    }
    
    return self;
}

- (instancetype)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    
    if (self != nil) {
        if ([layer isKindOfClass:[N7WaveLayer class]]) {
            N7WaveLayer *waveLayer = (N7WaveLayer *)layer;
            
            self.numberOfWaves = waveLayer.numberOfWaves;
            self.waveColor = waveLayer.waveColor;
            self.primaryLineWidth = waveLayer.primaryLineWidth;
            self.secondaryLineWidth = waveLayer.secondaryLineWidth;
            self.frequency = waveLayer.frequency;
            self.density = waveLayer.density;
            self.phaseShift = waveLayer.phaseShift;
            self.idleAmplitude = waveLayer.idleAmplitude;
            
            self.amplitude = waveLayer.amplitude;
            
            self.phase = waveLayer.phase;
        }
    }
    
    return self;
}

- (CGFloat)internalAmplitude {
    if (self.presentationLayer != nil) {
        return [(N7WaveLayer *)self.presentationLayer amplitude];
    }
    
    return self.idleAmplitude;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:NSStringFromSelector(@selector(amplitude))]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event {
    if ([event isEqualToString:NSStringFromSelector(@selector(amplitude))]) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:event];
        
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        anim.fromValue = @(self.internalAmplitude);
        
        return anim;
    }
    
    return [super actionForKey:event];
}

- (id<CAMetalDrawable>)nextDrawable {
    
}

- (void)display {
    CGRect rect = self.bounds;
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat midX = CGRectGetMidX(rect);
    CGFloat midY = CGRectGetMidY(rect);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, self.backgroundColor);
    CGContextFillRect(ctx, rect);
    
    CGFloat maxAmplitude = midY - self.primaryLineWidth;
    
    for (NSUInteger i = 0, n = self.numberOfWaves; i < n; ++i) {
        CGFloat progress = 1.0 - (CGFloat)i / (CGFloat)n;
        CGFloat normedAmplitude = (1.5 * progress - 0.8) * MAX(self.internalAmplitude, self.idleAmplitude);
        CGFloat multiplier = MIN((2.0 * progress + 1.0) / 3.0, 1.0);
        
        CGContextMoveToPoint(ctx, 0, midY);
        
        CGContextSetStrokeColorWithColor(ctx, [self.waveColor colorWithAlphaComponent:multiplier * CGColorGetAlpha(self.waveColor.CGColor)].CGColor);
        CGContextSetLineWidth(ctx, i == 0 ? self.primaryLineWidth : self.secondaryLineWidth);
        
        for (CGFloat x = self.density; x <= width; x += self.density) {
            CGFloat scale = 1.0 - pow((x - midX) / midX, 2.0);
            CGFloat y = midY + sin(2.0 * M_PI * self.frequency * (x / width) + self.phase) * maxAmplitude * normedAmplitude * scale;
            
            CGContextAddLineToPoint(ctx, x, y);
        }
        
        CGContextStrokePath(ctx);
    }
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    self.contents = (__bridge id)img.CGImage;
    
    UIGraphicsEndImageContext();
    
    self.phase += self.phaseShift;
}

@end
