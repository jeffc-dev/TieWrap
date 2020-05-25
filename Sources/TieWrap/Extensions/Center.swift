//
//  Center.swift
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
	/// Applies center X and center Y constraints to the receiver, relative to the center of its superview.
	/// - Parameters:
	///   - offsetCoordinate: A coordinate relative to the center of the second view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Tuple with applied center X and Y constraints.
	@discardableResult public func centerWithinSuperview(withOffsetCoordinate offsetCoordinate:CGPoint = .zero, priority:UILayoutPriority = .required, isActive:Bool = true) -> (xConstraint:NSLayoutConstraint, yConstraint:NSLayoutConstraint) {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let xConstraint = self.centerHorizontallyWithinSuperview(withOffset: offsetCoordinate.x, priority: priority, isActive: isActive)
		let yConstraint = self.centerVerticallyWithinSuperview(withOffset: offsetCoordinate.y, priority: priority, isActive: isActive)

		return (xConstraint:xConstraint, yConstraint:yConstraint)
	}

	/// Applies center X constraint to the receiver, relative to the horizontal center of its superview.
	/// - Parameters:
	///   - offsetCoordinate: A position in points relative to the horizontal center of the view's superview.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied center X constraint.
	@discardableResult public func centerHorizontallyWithinSuperview(withOffset offset:CGFloat = .zero, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let xConstraint = self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor, constant: offset)
		xConstraint.isActive		= isActive
		xConstraint.priority		= priority

		return xConstraint
	}

	/// Applies center Y constraint to the receiver, relative to the vertical center of its superview.
	/// - Parameters:
	///   - offsetCoordinate: A position in points relative to the vertical center of the view's superview.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied center Y constraint.
	@discardableResult public func centerVerticallyWithinSuperview(withOffset offset:CGFloat = .zero, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let yConstraint = self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor, constant: offset)
		yConstraint.isActive		= isActive
		yConstraint.priority		= priority

		return yConstraint
	}

	/// Applies center X and center Y constraints to the receiver, relative to the coordinate system of its superview.
	/// - Parameters:
	///   - centerPoint: A coordinate within the coordinate system of the view's superview.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Tuple with applied center X and Y constraints.
	@discardableResult public func setCenterPoint(_ centerPoint:CGPoint = .zero, priority:UILayoutPriority = .required, isActive:Bool = true) -> (xConstraint:NSLayoutConstraint, yConstraint:NSLayoutConstraint) {
		precondition(self.superview != nil, "View must first be added to a view to have a superview.")

		self.handleAutoresizingMaskConstraintTranslation()

		let xConstraint = self.centerXAnchor.constraint(equalTo: self.superview!.leftAnchor, constant: centerPoint.x)
		xConstraint.isActive		= isActive
		xConstraint.priority		= priority

		let yConstraint = self.centerYAnchor.constraint(equalTo: self.superview!.topAnchor, constant: centerPoint.y)
		yConstraint.isActive		= isActive
		yConstraint.priority		= priority

		return (xConstraint:xConstraint, yConstraint:yConstraint)
	}
}
