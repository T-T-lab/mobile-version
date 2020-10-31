<template>
    <div>
        <!-- 轮播图 -->
        <div class="swip">
            <mt-swipe>
              <mt-swipe-item>
                <img v-lazy="pro.lunbo1" alt />
              </mt-swipe-item>
              <mt-swipe-item>
                <img v-lazy="pro.lunbo2" alt />
              </mt-swipe-item>
              <mt-swipe-item>
                <img v-lazy="pro.lunbo3" alt />
              </mt-swipe-item>
            </mt-swipe>
        </div>
        <div>
            <h1 class="title">
                {{pro.title}}
            <p class="detail">{{pro.details}}</p>
            </h1>
            <div class="lis">
                <div class="jg">
                    <span class="yj">原价</span>
                    <span><b class="a">¥80.00</b></span>
                </div>
                <div class="xs">
                    <span class="xss">销售价</span>
                    <span class="xsss"><b>¥{{pro.price}}</b></span>
                </div>
            </div>
            <div class="tm">
                <div>累计销量<span class="co">0</span></div>
                <div>浏览次数<span class="co">180</span></div>
                <div>累计评论<span class="co">0</span></div>
            </div>
            <div class="items">
            <div class="but">
                数量
                <button class="but1">-</button>
                <input type="text" value="1" class="box">
                <button class="but2">+</button>
            </div>
            <div class="cart">
                <button @click="add(pro)">加入购物车</button>
            </div>
            <div class="index">
            <router-link to="/">返回首页</router-link>
            </div>
            </div>
        </div>
        <div class="xj">
            <span class="line"></span>
            <span class="text-wrapper">商品细节</span>
        </div>
        <div class="content">
            <img v-lazy="pro.imag1" alt="">
            <img v-lazy="pro.imag2" alt="">
            <img v-lazy="pro.imag3" alt="">
        </div>
    </div>
</template>
<script>
import {Toast} from 'vant';
    export default{
        props:["pid"],
        data(){
            return{
                pro:{}
            }
        },
        mounted(){
            this.axios.get("/pro/details",{params:{pid:this.pid}}).then(res=>{
                this.pro=res.data[0]
                // console.log(this.pro)
            })
        },
        methods:{
            add(pro)
       {
           Toast.success('加入成功');
           setTimeout(()=>{
               this.$router.push("/shopcart")
           },1500)
           this.$store.commit("add",pro)
       }
        }
    }
</script>
<style>
    .swip img{
        width: 100%;
        height: 100%;
    }
    .swip{
        height: 375px;
        width: 375px;
    }
    .title{
        font-size: 14px;
        padding: 0px 5px;
        margin-bottom: 0.5rem;
        margin-top: 15px;
    }
    .detail{
        padding: 0px 0px;
        color: #f00;
        margin-bottom: 0.5rem;
        margin-top: 10px;
        font-size: 12px;
    }
    .lis{
        padding: 10px 5px;
        background: #fcf1e3 url(/img/details/goods-meta-bg.png);
        background-size: cover;
        background-repeat: no-repeat;
        height: auto;
        text-align: left;
        position: relative;
    }
    .jg{
        display: block;
        margin: 5px 0;
    }
    .jg .yj{
        margin-right: 10px;
        text-align: left;
        white-space: nowrap;
        color: #666;
        font-weight: 400;
    }
    .a{
        /* display: inline-block; */
        text-decoration: line-through;
        font-size: 14px;
    }
    .xs{
        display: block;
        margin: 5px 0;
        padding-top: 10px;
    }
     .xss {
        margin-right: 10px;
        float: left;
        text-align: left;
        white-space: nowrap;
        color: #666;
        font-weight: 400;
    }
   .xsss {
        color: #c00;
    }
    .xsss b{
        font-size: 24px;
        font-weight: bold;
        line-height: 16px;
    }
    .tm{
        display: flex;
        justify-content: space-between;
    }
    .co{
        line-height: 16px;
        height: 16px;
        color: #C40000;
        font-weight: 700;
        margin-left: 3px;
    }
    .but{
        margin-top: 20px;
    }
    .but1,.but2{
        width: 35px;
        height: 25px;
        outline: none;
        line-height: 23px;
        padding: 0;
        cursor: pointer;
        font-size: 12px;
        font-weight: normal;
        color: #555555;
        text-align: center;
        background-color: #eeeeee;
        border: 1px solid #ccc;
        border-radius: 0;
        white-space: nowrap;
        vertical-align: middle;
    }
    .box{
        width: 60px;
        height: 25px;
        text-align: center;
        font-size: 12px;
    }
    .items{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .cart{
        margin-top: 20px;
        margin-right: 20px;
    }
    .cart button{
        border-radius: 0%;
        padding: 8px;
        outline: 0;
        background-color: #d2364c;
        color: #FFF;
    }
    input{
        outline: 0;
        border: 0;
    }
    .xj{
        position: relative;
    color: #d2364c;
    text-align: center;
    background-color: #ffffff;
    height: 35px;
    line-height: 35px;
    margin: 20px 0;
    }
    .line {
    display: inline-block;
    width: 50%;
    height: 1px;
    background: #d2364c;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    }
    .text-wrapper {
    position: relative;
    display: inline-block;
    padding: 0 8px;
    background-color: #ffffff;
    font-size: 16px;
    font-weight: bold;
    }
    .content img{
        width: 100%;
    }
    .index{
        margin-right: 10px;
        margin-top: 10px;
    }
</style>