package controllers

import (
	"DSProject/UberErrands/models"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/validation"
	_ "github.com/go-sql-driver/mysql" // import your used driver
	"strconv"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplNames = "index.tpl"
}

//InitiateRequestController
type InitiateRequestController struct {
	beego.Controller
}

func (c *InitiateRequestController) Get() {
	c.TplNames = "InitialRequestor.tpl"
}

//InitiateProvideController
type InitiateProvideController struct {
	beego.Controller
}

func (c *InitiateProvideController) Get() {
	c.TplNames = "InitialProvider.tpl"
}

//SubmitRequestController
type SubmitRequestController struct {
	beego.Controller
}

func (c *SubmitRequestController) Post() {
	c.Data["Requester"] = c.GetString("Requester")
	c.Data["Service"] = c.GetString("Service")
	c.Data["Latitude"] = c.Input().Get("Latitude")
	c.Data["Longitude"] = c.Input().Get("Longitude")

	service := c.Data["Service"].(string)
	latitudestr := c.Data["Latitude"].(string)
	latitude, err := strconv.ParseFloat(latitudestr, 64)
	longitudestr := c.Data["Longitude"].(string)
	longitude, err := strconv.ParseFloat(longitudestr, 64)
	req := c.Data["Requester"].(string)

	o := orm.NewOrm()
	var user string
	var nearlat float64
	var nearlng float64
	err = o.Raw("select username,lat,lng from (select username, lat, lng, SQRT(POW(69.1*(lat - ?), 2) + POW(69.1 * ( ? -lng) * COS(lat / 57.3), 2)) AS distance FROM provider where service=? and available=true HAVING distance < 25 ORDER BY distance) as t", latitude, longitude, service).QueryRow(&user, &nearlat, &nearlng)
	res, err1 := o.Raw("UPDATE provider SET available=false, requester=?, rlat=?, rlng=? where username=?", req, latitude, longitude, user).Exec()
	fmt.Println("user: ", user, nearlng, nearlat, err, res, err1)

	if nearlat != 0 {

		c.Data["Provider"] = user
		c.Data["LatitudeP"] = nearlat
		c.Data["LongitudeP"] = nearlng
		c.Data["At"] = "at ("
		c.Data["Comma"] = ","
		c.Data["Sentence"] = ") is coming to help you."

	} else {

		c.Data["Sentence"] = "Sorry! No one is available right now. Please try again later."

	}
	c.TplNames = "RequestSubmitted.tpl"
}

//AddRequestController
type AddRequestController struct {
	beego.Controller
}

func (c *AddRequestController) Post() {
	c.Data["Username"] = c.GetString("Username")
	c.Data["Service"] = c.GetString("Service")
	c.Data["Latitude"] = c.Input().Get("Latitude")
	c.Data["Longitude"] = c.Input().Get("Longitude")
	c.Data["Available"] = true

	username := c.Data["Username"].(string)
	service := c.Data["Service"].(string)
	latitudestr := c.Data["Latitude"].(string)
	latitude, err := strconv.ParseFloat(latitudestr, 64)
	longitudestr := c.Data["Longitude"].(string)
	longitude, err := strconv.ParseFloat(longitudestr, 64)
	avail := c.Data["Available"].(bool)

	fmt.Println(username)
	test := models.Provider{Username: username, Service: service, Lat: latitude, Long: longitude, Available: avail}

	valid := validation.Validation{}
	b, err := valid.Valid(&test)
	if err != nil {
	}
	if !b {
		for _, err := range valid.Errors {
			fmt.Println(err.Key, err.Message)
		}
	} else {

		o := orm.NewOrm()
		o.Using("default")
		provider := models.Provider{Username: username, Service: service, Lat: latitude, Long: longitude, Available: avail}
		fmt.Printf(provider.Username)
		//id, err := o.Insert(&provider)
		// fmt.Printf("ID: %d, ERR: %v\n", id, err)
		// this.Redirect("/", 302)
		o.Insert(&provider)

	}

	c.TplNames = "AddSubmitted.tpl"
}

type MyRequestorController struct {
	beego.Controller
}

func (c *MyRequestorController) Get() {
	var available bool
	username := c.GetString("Username")
	c.Data["Username"] = username

	//Check ORM to find if you've been selected

	o := orm.NewOrm()

	var req string
	var lat float64
	var lng float64
	err := o.Raw("select available from provider where username=?", username).QueryRow(&available)

	if !available {
		err := o.Raw("select requester, rlat, rlng from provider where username=?", username).QueryRow(&req, &lat, &lng)
		c.Data["Requestor"] = req
		c.Data["LatitudeR"] = lat
		c.Data["LongitudeR"] = lng
		fmt.Println(available, err)
		c.TplNames = "selected.tpl"
	} else {
		c.TplNames = "NotSelectedyet.tpl"
		fmt.Println(username)
	}
	fmt.Println(username, err)
}

type MyTeamController struct {
	beego.Controller
}

func (c *MyTeamController) Get() {
	c.TplNames = "Team.tpl"
}
