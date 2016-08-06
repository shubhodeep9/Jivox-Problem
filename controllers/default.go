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

func inArray(i string, a []string) bool {
	for j := range a {
		if a[j] == i {
			return true
		}
	}
	return false
}

/*
This post controller has the algorithm for the problem
*/

func (o *MainController) Post() {
	inputs := map[string]string{
		"A": o.Input().Get("A"),
		"B": o.Input().Get("B"),
		"C": o.Input().Get("C"),
		"D": o.Input().Get("D"),
		"E": o.Input().Get("E"),
	}
	result := map[string][]string{
		"A": []string{},
		"B": []string{},
		"C": []string{},
		"D": []string{},
		"E": []string{},
	}
	for i := range inputs {
		key := i
		for j := 0; j <= 3; j++ {
			if inputs[key] != i {
				if !inArray(inputs[key], result[i]) {
					result[i] = append(result[i], inputs[key])
					key = inputs[key]
				}
			}
		}
	}
	o.Data["json"] = result
	o.ServeJSON()
}
