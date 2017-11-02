import UIKit

extension UIViewController {
    
    // TODO: make a static func?
    @objc public func wmf_addBottomShadow(view: UIView, theme: Theme) { // theme is intentionally ignored for now
        // Setup extended navigation bar
        //   Borrowed from https://developer.apple.com/library/content/samplecode/NavBar/Introduction/Intro.html
  
        guard let bgColor = view.backgroundColor else {
            assertionFailure("Could not get background color of view")
            return
        }
        assert(bgColor != UIColor.clear, "Background color must not be clear")
        
        view.shadowOffset = CGSize(width: 0, height: CGFloat(1) / traitCollection.displayScale)
        view.shadowRadius = 0
        view.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.shadowOpacity = 0.25
    }
    
    @objc public func wmf_updateNavigationBar(removeUnderline: Bool) {
        guard let navigationController = navigationController else {
            return
        }
        
        if (removeUnderline) {
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.shadowImage = #imageLiteral(resourceName: "transparent-pixel")
        } else {
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.shadowImage = nil
        }
        
        // this little dance is to force the navigation bar to redraw. Without it,
        // the underline would not be removed until the view fully animated, instead of
        // before
        // http://stackoverflow.com/a/40948889
        navigationController.isNavigationBarHidden = true
        navigationController.isNavigationBarHidden = false
    }
}
