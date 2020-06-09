//
//  Pin.swift
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
	// Pinning (Superview)...
	
	/// Applies top constraint to the receiver, relative to the top of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the top of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied top constraint.
	@discardableResult public func pinToTopOfSuperview(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let topConstraint			= self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: padding)
		topConstraint.isActive		= isActive
		topConstraint.priority		= priority

		return topConstraint
	}

	/// Applies bottom constraint to the receiver, relative to the bottom of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the bottom of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied bottom constraint.
	@discardableResult public func pinToBottomOfSuperview(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let bottomConstraint		= self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: -1 * padding)
		bottomConstraint.isActive	= isActive
		bottomConstraint.priority	= priority

		return bottomConstraint
	}

	/// Applies left constraint to the receiver, relative to the left of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the left of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied left constraint.
	@discardableResult public func pinToLeftOfSuperview(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let leftConstraint			= self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor, constant: padding)
		leftConstraint.isActive		= isActive
		leftConstraint.priority		= priority

		return leftConstraint
	}

	/// Applies right constraint to the receiver, relative to the right of its superview.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the right of the view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied right constraint.
	@discardableResult public func pinToRightOfSuperview(withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let rightConstraint			= self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor, constant: -1 * padding)
		rightConstraint.isActive	= isActive
		rightConstraint.priority	= priority

		return rightConstraint
	}

	// Pin Against (Other View)...

	/// Applies top constraint to the receiver, relative to the bottom of a specified view.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the top of the receiver.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied top constraint.
	@discardableResult public func pinTop(toView view:UIView, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		self.handleAutoresizingMaskConstraintTranslation()

		let topConstraint			= self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: padding)
		topConstraint.isActive		= isActive
		topConstraint.priority		= priority

		return topConstraint
	}

	/// Applies bottom constraint to the receiver, relative to the top of a specified view.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the bottom of the receiver.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied bottom constraint.
	@discardableResult public func pinBottom(toView view:UIView, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		self.handleAutoresizingMaskConstraintTranslation()

		let bottomConstraint		= self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: padding * -1)
		bottomConstraint.isActive	= isActive
		bottomConstraint.priority	= priority

		return bottomConstraint
	}

	/// Applies left constraint to the receiver, relative to the right of a specified view.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the left of the receiver.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied left constraint.
	@discardableResult public func pinLeft(toView view:UIView, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		self.handleAutoresizingMaskConstraintTranslation()

		let leftConstraint			= self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: padding)
		leftConstraint.isActive		= isActive
		leftConstraint.priority		= priority

		return leftConstraint
	}

	/// Applies right constraint to the receiver, relative to the left of a specified view.
	/// - Parameters:
	///   - padding: A padding value in points to apply to the right of the receiver.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied right constraint.
	@discardableResult public func pinRight(toView view:UIView, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		self.handleAutoresizingMaskConstraintTranslation()

		let rightConstraint			= self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: padding * -1)
		rightConstraint.isActive	= isActive
		rightConstraint.priority	= priority

		return rightConstraint
	}

// Not currently in use. Do not use... - JAC

//	@discardableResult public func pinHorizontalAnchor(_ anchor:NSLayoutXAxisAnchor, againstOtherHorizontalAnchor otherHorizontalAnchor:NSLayoutXAxisAnchor, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
//		self.handleAutoresizingMaskConstraintTranslation()
//
//		let horzConstraint			= anchor.constraint(equalTo: otherHorizontalAnchor, constant: padding)
//		horzConstraint.isActive		= isActive
//		horzConstraint.priority		= priority
//
//		return horzConstraint
//	}
//
//	@discardableResult public func pinVerticalAnchor(_ anchor:NSLayoutYAxisAnchor, againstOtherVerticalAnchor otherVerticalAnchor:NSLayoutYAxisAnchor, withPadding padding:CGFloat = 0, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
//		self.handleAutoresizingMaskConstraintTranslation()
//
//		let vertConstraint			= anchor.constraint(equalTo: otherVerticalAnchor, constant: padding)
//		vertConstraint.isActive		= isActive
//		vertConstraint.priority		= priority
//
//		return vertConstraint
//	}

}
