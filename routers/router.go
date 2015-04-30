package routers

import (
	"DSProject/UberErrands/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/register", &controllers.LoginController{}, "get:RegisterView;post:Register")
	beego.Router("/login", &controllers.LoginController{}, "get:LoginView;post:Login")
	beego.Router("/initiateRequest", &controllers.InitiateRequestController{})
	beego.Router("/initiateProvide", &controllers.InitiateProvideController{})
	beego.Router("submitRequest", &controllers.SubmitRequestController{})
	beego.Router("submitAdd", &controllers.AddRequestController{})
	beego.Router("myRequestor", &controllers.MyRequestorController{})
	beego.Router("/team", &controllers.MyTeamController{})
}
