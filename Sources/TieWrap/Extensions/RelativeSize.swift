//
//  RelativeSize.swift
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
	/// Applies width and height constraints to the receiver, relative to the width and height of another specified view.
	/// - Parameters:
	///   - view: A view to apply constraints relative to.
	///   - relativeSize: A size (width and height) in points to apply to view, relative to the width and height of the second view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Tuple with applied width and height constraints.
	@discardableResult public func setSize(relativeToView view:UIView, relativeSize:CGSize, priority:UILayoutPriority = .required, isActive:Bool = true) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
		precondition(self != view, "View cannot have constraints applied relative to itself.")

		self.handleAutoresizingMaskConstraintTranslation()

		let widthConstraint		= self.setWidth(relativeToView: view, relativeWidth: relativeSize.width, priority: priority, isActive: isActive)
		let heightConstraint	= self.setHeight(relativeToView: view, relativeHeight: relativeSize.height, priority: priority, isActive: isActive)

		return (widthConstraint: widthConstraint, heightConstraint: heightConstraint)
	}

	/// Applies a width constraint to the receiver, relative to the width of another specified view.
	/// - Parameters:
	///   - view: A view to apply the constraint relative to.
	///   - relativeWidth: A width in points to apply to view, relative to the width of the second view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied width constraint.
	@discardableResult public func setWidth(relativeToView view:UIView, relativeWidth:CGFloat, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self != view, "View cannot have constraints applied relative to itself.")

		self.handleAutoresizingMaskConstraintTranslation()

		let widthConstraint				= self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: relativeWidth)
		widthConstraint.isActive		= isActive
		widthConstraint.priority		= priority

		return widthConstraint
	}

	/// Applies a height constraint to the receiver, relative to the height of another specified view.
	/// - Parameters:
	///   - view: A view to apply the constraint relative to.
	///   - relativeHeight: A height in points to apply to view, relative to the height of the second view.
	///   - priority: Priority of constraint.
	///   - isActive: Whether constraint is active.
	/// - Returns: Applied height constraint.
	@discardableResult public func setHeight(relativeToView view:UIView, relativeHeight:CGFloat, priority:UILayoutPriority = .required, isActive:Bool = true) -> NSLayoutConstraint {
		precondition(self != view, "View cannot have constraints applied relative to itself.")

		self.handleAutoresizingMaskConstraintTranslation()

		let heightConstraint			= self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: relativeHeight)
		heightConstraint.isActive		= isActive
		heightConstraint.priority		= priority

		return heightConstraint
	}
}
