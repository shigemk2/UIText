# -*- coding: utf-8 -*-
describe TextViewController do
  tests TextViewController

  before do
    @text_view_controller = TextViewController.new
  end

  it "default color" do
    controller.instance_variable_get("@view").backgroundColor.should.be.nil
  end

  it "tap chenge color" do
    controller.instance_variable_get("@text_field").text = '#ff0000'
    tap "Change Color!"
    controller.instance_variable_get("@view").backgroundColor.should.not.be.nil
  end

  it "input invalidate hex" do
    controller.instance_variable_get("@text_field").text = '#hoge'
    tap "Change Color!"
    controller.instance_variable_get("@view").backgroundColor.should.be.nil
  end
end
