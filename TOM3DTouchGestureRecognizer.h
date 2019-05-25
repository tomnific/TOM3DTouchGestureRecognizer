//
//  TOM3DTouchGestureRecognizer.h
//  TOM3DTouchGestureRecognizer-Demo
//
//  Created by Tom Metzger on 12/25/18.
//  Copyright © 2018 Tom. All rights reserved.
//

#import <UIKit/UIKit.h>





NS_ASSUME_NONNULL_BEGIN

#define kSystemSoundID_Vibrate  4095 // Equivelant to a long vibrate – and yeah, it's technically a needless redefinition, so what?
#define kSystemSoundID_Peek     1519 // Equivelent to UIImpactFeedbackStyleLight
#define kSystemSoundID_Pop      1520 // Equivalent to UIImpactFeedbackStyleHeavy
#define kSystemSoundID_Nope     1521 // Equivalent to UIImpactFeedbackStyleLight 3 times




/*!
 @class TOM3DTouchGestureRecognizer
 
 @brief The `TOM3DTouchGestureRecognizer` class
 
 @discussion This class was developed to make detecting 3DTouch in iOS apps easier, and more straightfoward
 
 @author Tom Metzger
 @version 1.0
 @copyright © 2019, Tom Metzger
 */
@interface TOM3DTouchGestureRecognizer : UIGestureRecognizer

/*! @brief Determines whether or not extra logging is enabled. */
@property (nonatomic, readonly) BOOL debugMode;

/*! @brief The number of touches required for the gesture to be actionable. */
@property (nonatomic) NSUInteger numberOfTouchesRequired;
/*! @brief The amount of force needed from any of the touches required for the gesture to be actionable. */
@property (nonatomic) CGFloat minimumForceRequired;
/*! @brief The current force of the most recent touch. */
@property (nonatomic, readonly) CGFloat currentForce;

/*! @brief Determines whether or not a vibration should be triggered when the gesture is actionable. */
@property (nonatomic) BOOL vibrateWhenActionable;
/*! @brief Determines if an older method of vibration should be used (needed for devices older than the iPhone 6s) - you must determine the device model yourself. */
@property (nonatomic, readonly) BOOL legacyMode;
/*! @brief The vibration type used while in legacy mode (compatible Peek, Pop, Nope, and long vibrate macros are provided). */
@property (nonatomic) int legacyVibrateSound;
/*! @brief The feedback generator used when not in legacy mode. */
@property (nonatomic, readonly) UIImpactFeedbackGenerator *feedbackGenerator;

/*!
 @brief Sets the feedback style used by the Taptic Engine
 
 @discussion Sets the feedback style used by the Taptic Engine. Does not modify anything in regards to Legacy Mode.
 
 @code
 [recognizer setFeedbackGeneratorImpactStyle:UIImpactFeedbackStyleHeavy];
 @endcode
 
 @param impactStyle The @c UIImpactFeedbackStyle to use.
 
 @return @c Void - there isn't anything to return.
 */
- (void)setFeedbackGeneratorImpactStyle:(UIImpactFeedbackStyle)impactStyle;

/*!
 @brief Sets the TOM3DTouchGestureRecognizer object into Legacy Mode.
 
 @discussion Sets the TOM3DTouchGestureRecognizer object into Legacy Mode. This will use they System Sound vibration method rather than the Taptic Engine.
 
 @code
 [recognizer setLegacyMode:YES];
 @endcode
 
 @param legacyMode If @c YES sets Legacy Mode on, if @c NO sets Legacy Mode off
 
 @return @c Void - there isn't anything to return.
 */
- (void)setLegacyMode:(BOOL)legacyMode;

/*!
 @brief Sets the TOM3DTouchGestureRecognizer object into Debug Mode.
 
 @discussion Sets the TOM3DTouchGestureRecognizer object into Debug Mode. This will print all @c NSLog() statements, instead of just the ones containing errors. By default, Debug Mode is off.
 
 @code
 [recognizer setDebugMode:YES];
 @endcode
 
 @param debugMode If @c YES sets Debug Mode on, if @c NO sets Debug Mode off
 
 @return @c Void - there isn't anything to return.
 */
- (void)setDebugMode:(BOOL)debugMode;

@end

NS_ASSUME_NONNULL_END
