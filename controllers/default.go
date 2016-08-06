package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

func (o *MainController) Post() {
	inputs := map[string]string{
		"A": o.Input().Get("A"),
		"B": o.Input().Get("B"),
		"C": o.Input().Get("C"),
		"D": o.Input().Get("D"),
		"E": o.Input().Get("E"),
	}

	o.Data["json"] = "Hey"
	o.ServeJSON()
}
