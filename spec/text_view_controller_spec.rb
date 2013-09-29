# -*- coding: utf-8 -*-
describe TextViewController do
  tests TextViewController

  before do
    @text_view_controller = TextViewController.new
  end

  it "tap chenge color" do
    controller.instance_variable_get("@text_field").text = '#ff0000'
    p controller.instance_variable_get("@view")
    tap "Change Color!"
    controller.instance_variable_get("@view").backgroundColor.should.not.be.nil
  end
end
