class TextViewController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @text_field                        = UITextField.alloc.initWithFrame [[0,0],[160,26]]
    # Text alignment is center
    @text_field.textAlignment          = UITextAlignmentCenter
    # Autocapitalization is not worked
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle            = UITextBorderStyleRoundedRect
    @text_field.center                 = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100)
    @text_field.keyboardType           = UIKeyboardTypePhonePad
    self.view.addSubview @text_field

    @search = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @search.setTitle("TAP!", forState:UIControlStateNormal)
    @search.sizeToFit
    # Add function
    @search.addTarget(self,
                      action:"showTarget:",
                      forControlEvents:UIControlEventTouchUpInside)
    @search.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    self.view.addSubview @search
  end

  def showTarget(sender)
    alert = UIAlertView.new
    alert.message = @text_field.text
    alert.addButtonWithTitle 'OK'
    alert.show
  end
end
