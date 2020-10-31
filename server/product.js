//引入express 
    const express = require('express') 
//引入数据连接池 
    const pool = require('./pool.js') 
 //创建后端路由接口对象 
    const router = express.Router()
//商品路由
//主页1楼
router.get('/index',(req,res)=>{
    let sql='select pid,fid,img,title,price from fruit_index1'
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})
// //主页2楼
// router.get('/index2',(req,res)=>{
//     let sql='select pid,fid,img,title,price from fruit_index2'
//     pool.query(sql,(err,result)=>{
//         if(err)throw err
//         res.send(result)
//     })
// })
// //主页3楼
// router.get('/index3',(req,res)=>{
//     let sql='select pid,fid,img,title,price from fruit_index3'
//     pool.query(sql,(err,result)=>{
//         if(err)throw err
//         res.send(result)
//     })
// })   
//分类
router.get('/list',(req,res)=>{ 
        let sql = 'select fimg,fid,fruit from fruit_family' 
         pool.query(sql,(err, result)=>{ 
            if(err) throw err
            // console.log(result) 
            res.send(result) 
         }) 
})
//根据id获取对应商品信息
router.get('/details',(req,res)=>{
    let pid=req.query.pid
    let sql='select * from fruit_details where pid=?'
    pool.query(sql,[pid],(err,result)=>{
        if(err)throw err
        // console.log(result)
        res.send(result)
        
    })
})
//关键词搜索
router.get('/search',(req,res)=>{
    let title = req.query.title;
    let sql="SELECT * FROM fruit_index1 WHERE title LIKE '%"+title+"%'";
    pool.query(sql,[title],(err,result)=>{
      if(err) throw err;
      console.log(result);
      if(result.length>0){
        res.send({message:'查询到结果',code:1,searchs:result});
      }else{
        res.send({message:'查询失败',code:0});
      }
    })
  })
module.exports = router    