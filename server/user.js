//引入express 
    const express = require('express') 
//引入数据连接池 
    const pool = require('./pool.js') 
 //创建后端路由接口对象 
    const router = express.Router() 
 //用户登录接口 
 router.get('/login',(req,res)=>{
	let uname=req.query.username
	let upwd=req.query.upwd
	let sql='select * from fruit_user where uname=? and upwd=?'
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err)throw err
		console.log(result)
		if(result.length==1){
			res.send({message:'登录成功',code:1,info:result[0]})
		}else{
			res.send({message:'登录失败',code:0})
		}
	})
})
//用户注册接口
router.get('/reg',(req,res)=>{
    let obj=req.query
    let uname=req.query.username
    let sql='select uname from fruit_user where uname=?'
    pool.query(sql,[uname],(err,result)=>{
        if(err)throw err
        //用户名已存在
        if(result.length>0){
            res.send({code:0,msg:'fail'})
        }else{
            let sql='insert into fruit_user set ?'
            pool.query(sql,[obj],(err,result)=>{
                if(err)throw err
                if(result.affectedRows>0){
                    res.send({code:1,msg:'success'})
                }else{
                    res.send({code:0,msg:'fail'})
                }
            })
        }
    })
})
module.exports = router