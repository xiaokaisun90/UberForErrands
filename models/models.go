package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type User struct {
	Id         int       `orm:"column(id);auto"`
	Username   string    `orm:"column(username);size(50)"`
	Email      string    `orm:"column(email);size(255)"`
	Password   string    `orm:"column(password);size(128)"`
	CreateTime time.Time `orm:"column(create_time);type(timestamp);auto_now_add"`
	Admin      bool      `orm:"column(admin)"`
	// Rands      string    `orm:"size(10)"`
}

type Provider struct {
        Id         int       `orm:"column(id);auto"`
        Username   string    `orm:"column(username);size(50)"`
        Service    string    `orm:"column(service);size(50)"`
        Lat	   float64   `orm:"column(lat);size(10)"`
        Long	   float64   `orm:"column(lng);size(10)"`
        Available  bool      `orm:"column(available)"`
	Requester  string    `orm:"column(requester);size(50)"`
        Rlat       float64   `orm:"column(rlat);size(10)"`
        Rlong      float64   `orm:"column(rlng);size(10)"`
}

func init() {
	orm.RegisterModel(new(User))
	orm.RegisterModel(new(Provider))
}
