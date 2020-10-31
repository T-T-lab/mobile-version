// 服务器
const express=require('express');
//引入中间件
const bodyParser=require('body-parser');
//引入cors
const cors=require('cors')
// 引入路由接口
const user=require('./server/user.js')
const pro=require('./server/product.js')
//创建服务器
const app=express()
//设置端口号
app.listen(3000,()=>{
    console.log('服务器已开启')
})
app.use(express.static('public'))
app.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}))
//解析post请求
app.use(bodyParser.urlencoded({
    extended:false
}))
//挂载路由
app.use('/user',user)
app.use('/pro',pro)