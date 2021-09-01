//
//  Fit.swift
//  Convenience tools for managing Auto Layout constraints...
//
//  Created by Jeff A. Campbell on 10/20/19.
//
//  ----------------------------------------------------------------------------
//
//  Copyright (c) 2020, Jeff A. Campbell
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//     list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//     contributors may be used to endorse or promote products derived from
//     this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import Foundation
import UIKit

extension UIView {
	/// Applies top, bottom, left, and right constraints to the receiver, relative to the interior bounds of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to all sides of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	///   - accountForSafeArea: Whether to account for safe area insets.
	/// - Returns: Tuple with applied top, bottom, left, and right constraints.
	@discardableResult public func fitSuperview(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true, accountForSafeArea:Bool = false) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let (topConstraint, bottomConstraint) = self.fitSuperviewVertically(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)
		let (leftConstraint, rightConstraint) = self.fitSuperviewHorizontally(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)

		return(topConstraint, bottomConstraint, leftConstraint, rightConstraint)
	}

	/// Applies top and bottom constraints to the receiver, relative to the interior vertical bounds of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the top and bottom of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	///   - accountForSafeArea: Whether to account for safe area insets.
	/// - Returns: Tuple with applied top and bottom constraints.
	@discardableResult public func fitSuperviewVertically(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true, accountForSafeArea:Bool = false) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint) {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let topConstraint			= self.pinToTopOfSuperview(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)
		topConstraint.isActive		= isActive
		topConstraint.priority		= priority

		let bottomConstraint		= self.pinToBottomOfSuperview(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)
		bottomConstraint.isActive	= isActive
		bottomConstraint.priority	= priority

		return (topConstraint: topConstraint, bottomConstraint: bottomConstraint)
	}

	/// Applies left and right constraints to the receiver, relative to the interior horizontal bounds of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the left and right of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	///   - accountForSafeArea: Whether to account for safe area insets.
	/// - Returns: Tuple with applied left and right constraints.
	@discardableResult public func fitSuperviewHorizontally(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true, accountForSafeArea:Bool = false) -> (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let leftConstraint			= self.pinToLeftOfSuperview(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)
		leftConstraint.isActive		= isActive
		leftConstraint.priority		= priority

		let rightConstraint			= self.pinToRightOfSuperview(withPadding: padding, priority: priority, isActive: isActive, accountForSafeArea: accountForSafeArea)
		rightConstraint.isActive	= isActive
		rightConstraint.priority	= priority

		return (leftConstraint: leftConstraint, rightConstraint: rightConstraint)
	}
}
