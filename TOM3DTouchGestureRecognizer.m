//
//  TOM3DTouchGestureRecognizer.m
//  TOM3DTouchGestureRecognizer-Demo
//
//  Created by Tom Metzger on 12/25/18.
//  Copyright © 2018 Tom. All rights reserved.
//

@import AudioToolbox;
#import "TOM3DTouchGestureRecognizer.h"





@implementation TOM3DTouchGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action
{
	if (self = [super initWithTarget:target action:action])
	{
		_debugMode = NO;
		
		_numberOfTouchesRequired = 1.0;
		_minimumForceRequired = 0.0;
		
		_legacyMode = NO;
		_legacyVibrateSound = kSystemSoundID_Pop;
		_vibrateWhenActionable = YES;
		_feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
	}
	
	
	return self;
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Touches have begun.");
	}
	
	if (touches.count != _numberOfTouchesRequired)
	{
		if (_debugMode)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Not enough touches.");
		}
		
		self.state = UIGestureRecognizerStateFailed;
	}
	else
	{
		if (_debugMode)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: There are enough touches.");
		}
		
		[super touchesBegan:touches withEvent:event];
		
		[super setState:UIGestureRecognizerStateBegan];
	}
}




- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Touches have moved.");
	}
	
	
	BOOL actionable = YES;
	CGFloat lowestForceDetected = 1.0;
	
	
	for (UITouch *touch in touches)
	{
		CGFloat normalizedForce = (touch.force / touch.maximumPossibleForce);
		
		if (normalizedForce < lowestForceDetected)
		{
			lowestForceDetected = normalizedForce;
			
			if (lowestForceDetected < _minimumForceRequired)
			{
				actionable = NO;
			}
		}
	}
	
	_currentForce = lowestForceDetected;
	
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Current force: %f", _currentForce);
	}
	
	
	[super setState:UIGestureRecognizerStateChanged];
	
	
	if (actionable)
	{
		if (_debugMode)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Touch is actionable.");
		}
		
		[super setState:UIGestureRecognizerStateEnded];
		
		if (_vibrateWhenActionable)
		{
			if (!_legacyMode)
			{
				if (_debugMode)
				{
					NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Vibrating using feedback generator.");
				}
				
				[_feedbackGenerator impactOccurred];
			}
			else
			{
				if (_debugMode)
				{
					NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Vibrating using legacy vibration.");
				}
				
				AudioServicesPlaySystemSound(_legacyVibrateSound);
			}
		}
	}
}




- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Touches have ended.");
	}
	
	
	[super touchesEnded:touches withEvent:event];
	[super setState:UIGestureRecognizerStateCancelled];
}




- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Touches have been canceled.");
	}
	
	
	[super touchesCancelled:touches withEvent:event];
	[super setState:UIGestureRecognizerStateCancelled];
}




- (void)setFeedbackGeneratorImpactStyle:(UIImpactFeedbackStyle)impactStyle
{
	if (_debugMode)
	{
		if (impactStyle == UIImpactFeedbackStyleLight)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Setting feedback generator impact style to: 'UIImpactFeedbackStyleLight'.");
		}
		else if (impactStyle == UIImpactFeedbackStyleMedium)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Setting feedback generator impact style to: 'UIImpactFeedbackStyleMedium'.");
		}
		else if (impactStyle == UIImpactFeedbackStyleHeavy)
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Setting feedback generator impact style to: 'UIImpactFeedbackStyleHeavy'.");
		}
		else
		{
			NSLog(@"[TOM3DTouchGestureRecognizer] ISSUE: Setting feedback generator impact style to: UNKNOWN.");
		}
	}
	
	_feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:impactStyle];
}




- (void)setLegacyMode:(BOOL)legacyMode
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Setting Legacy Mode to: '%@'.", legacyMode ? @"YES" : @"NO");
	}
	
	
	_legacyMode = legacyMode;
}




- (void)setDebugMode:(BOOL)debugMode
{
	if (_debugMode)
	{
		NSLog(@"[TOM3DTouchGestureRecognizer] INFO: Setting Debug Mode to: '%@'.", debugMode ? @"YES" : @"NO");
	}
	
	
	_debugMode = debugMode;
}

@end
