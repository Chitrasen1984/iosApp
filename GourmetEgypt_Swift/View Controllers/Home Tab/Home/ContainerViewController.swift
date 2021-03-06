//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
	case bothCollapsed
	case leftPanelExpanded
}

class ContainerViewController: UIViewController {
	
	var centerNavigationController: UINavigationController!
	var centerViewController: HomeViewController!
	
	var currentState: SlideOutState = .bothCollapsed {
		didSet {
			let shouldShowShadow = currentState != .bothCollapsed
			showShadowForCenterViewController(shouldShowShadow)
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ContainerViewController.handlePanGesture(_:)))
            centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
		}
	}
	
	var leftViewController: SidePanelViewController?
	let centerPanelExpandedOffset: CGFloat = 60
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		centerViewController = UIStoryboard.centerViewController()
		centerViewController.delegate = self
		// wrap the centerViewController in a navigation controller, so we can push views to it
		// and display bar button items in the navigation bar
		centerNavigationController = UINavigationController(rootViewController: centerViewController)
		view.addSubview(centerNavigationController.view)
		addChildViewController(centerNavigationController)
		
		centerNavigationController.didMove(toParentViewController: self)
		
		
	}
	
}

// MARK: CenterViewController delegate

extension ContainerViewController: CenterViewControllerDelegate {
	
	func toggleLeftPanel() {
		let notAlreadyExpanded = (currentState != .leftPanelExpanded)
		
		if notAlreadyExpanded {
			addLeftPanelViewController()
		}
		
		animateLeftPanel(shouldExpand: notAlreadyExpanded)
	}
	
	
	func collapseSidePanels() {
		switch (currentState) {
		case .leftPanelExpanded:
			toggleLeftPanel()
		default:
			break
		}
	}
	
	func addLeftPanelViewController() {
		if (leftViewController == nil) {
			leftViewController = UIStoryboard.leftViewController()
			addChildSidePanelController(leftViewController!)
		}
	}
	
	func addChildSidePanelController(_ sidePanelController: SidePanelViewController) {
		sidePanelController.delegate = self
		view.insertSubview(sidePanelController.view, at: 0)
		
		addChildViewController(sidePanelController)
		sidePanelController.didMove(toParentViewController: self)
	}
	
 
	
	func animateLeftPanel(shouldExpand: Bool) {
		if (shouldExpand) {
			currentState = .leftPanelExpanded
			
			animateCenterPanelXPosition(targetPosition: (centerNavigationController.view.frame).width - centerPanelExpandedOffset)
		} else {
			animateCenterPanelXPosition(targetPosition: 0) { finished in
				self.currentState = .bothCollapsed
				if let viewcontroller = self.leftViewController {
                    viewcontroller.view.removeFromSuperview()
                }
				
				self.leftViewController = nil;
			}
		}
	}
	
	func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
			self.centerNavigationController.view.frame.origin.x = targetPosition
			self.leftViewController?.view.layoutSubviews()
			
		}, completion: { finished in
			if let completion = completion {
				completion(finished)
			}
		})
	}
	
	
	func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
//		if (shouldShowShadow) {
//			  centerNavigationController.view.layer.shadowOpacity = 0.8
//		} else {
//			centerNavigationController.view.layer.shadowOpacity = 0.0
//		}
	}
	
}

extension ContainerViewController: UIGestureRecognizerDelegate {
	// MARK: Gesture recognizer
	
	func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
		let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        guard centerNavigationController.topViewController == centerViewController else {
            return
        }
		guard ((gestureIsDraggingFromLeftToRight == true && self.currentState == .bothCollapsed) ||
			(gestureIsDraggingFromLeftToRight == false && self.currentState == .leftPanelExpanded)) else {
				return
		}
		switch(recognizer.state) {
		case .began:
			if (currentState == .bothCollapsed) {
				if (gestureIsDraggingFromLeftToRight) {
					addLeftPanelViewController()
				}
				
				showShadowForCenterViewController(true)
			}
		case .changed:
			recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translation(in: view).x
			recognizer.setTranslation(CGPoint.zero, in: view)
		case .ended:
			if (leftViewController != nil) {
				// animate the side panel open or closed based on whether the view has moved more or less than halfway
				let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
				animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
			}
		default:
			break
		}
	}
}

private extension UIStoryboard {
	class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
	
	class func leftViewController() -> SidePanelViewController? {
		return mainStoryboard().instantiateViewController(withIdentifier: "SidePanelViewController") as? SidePanelViewController
	}
	
	class func centerViewController() -> HomeViewController? {
		return mainStoryboard().instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
	}
	
}

extension ContainerViewController: SidePanelViewControllerDelegate {
	func nodeSelected(_ node: CategoryModel) {
        collapseSidePanels()
//		let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CategoryViewController")
//		centerViewController.navigationController?.pushViewController(viewController, animated: true)
        centerViewController.navigationController?.pushViewController(ProductListViewController(nibName: "ProductListViewController", bundle: nil), animated: true );

	}
}
