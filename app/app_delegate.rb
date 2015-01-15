class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # rootViewController = UIViewController.alloc.init
    # rootViewController.title = 'navigation_controller'
    # rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(
      HomeController.alloc.init
    )

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end

class HomeController < UIViewController

  def dealloc
    NSLog "dealloc HomeController"
    @process_controller = nil
    super
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Home Controller"
    self.view.addSubview(continueButton)
  end

  def continueButton
    @continueButton ||= UIButton.alloc.initWithFrame(
      CGRectMake(0,100,200, 50)
    ).tap do |button|
      button.backgroundColor = UIColor.blackColor
      button.setTitle(
        "Go to ProcessController",
        forState: UIControlStateNormal
      )
      button.addTarget(self,
        action:"go_to_process_controller",
        forControlEvents:UIControlEventTouchUpInside
      )
    end
  end

  def process_controller
    @process_controller ||= ProcessController.alloc.init
  end

  def go_to_process_controller
    self.navigationController.setViewControllers(
      [
        ProcessController.alloc.init
      ],
      animated: true
    )
  end

end

class ProcessController < UIViewController

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.title = "Process Controller"
    self.view.addSubview(next_button)
  end

  def dealloc
    NSLog "dealloc ProcessController"
    super
  end

  def next_button
    @next_button ||= UIButton.alloc.initWithFrame(
      CGRectMake(0,100,200,50)
    ).tap do |button|
      button.backgroundColor = UIColor.blackColor
      button.setTitle(
        "Go to HomeController",
        forState: UIControlStateNormal
      )
      button.addTarget(self,
        action:"go_to_home_controller",
        forControlEvents:UIControlEventTouchUpInside
      )
    end
  end

  def go_to_home_controller
    self.navigationController.setViewControllers(
      [HomeController.alloc.init],
      animated: true
    )
  end

end
