class TextViewController < UIViewController
  def viewDidLoad
    super
    @view = self.view

    @text_field                        = UITextField.alloc.initWithFrame [[0,0],[160,26]]
    # Text alignment is center
    @text_field.textAlignment          = UITextAlignmentCenter
    # Autocapitalization is not worked
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle            = UITextBorderStyleRoundedRect
    @text_field.center                 = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100)
    @view.addSubview @text_field

    @search = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @search.setTitle("Change Color!", forState:UIControlStateNormal)
    @search.sizeToFit

    # Add function
    @search.addTarget(self,
                      action:"changeBackgroungColor:",
                      forControlEvents:UIControlEventTouchUpInside)
    @search.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    @view.addSubview @search
  end

  def changeBackgroungColor(sender)
    @text_field.resignFirstResponder

    if validateHex(@text_field.text) == nil
      alert = UIAlertView.new
      alert.message = "#{@text_field.text} is not valid hex color!"
      alert.addButtonWithTitle 'OK'
      alert.show

      return
    end
    @color = colorWithHex(@text_field.text)
    self.view.backgroundColor = @color
  end

  def colorWithHex(hex)
    color = String.new(@text_field.text).to_color
  end

  def validateHex(hex)
    rp = Regexp.new("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$")
    return rp =~ hex
  end
end
