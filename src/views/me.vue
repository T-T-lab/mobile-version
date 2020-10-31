<template>
  <div>
      <!-- 顶部开始 -->
      <div class="user-content">
        <div class="user-base">
          <div class="user-base-left">
            <div class="user-avatar">
              <img src="/img/index/default-user-avatar.jpg" alt="" class="avatar">
              <div class="user-name" v-if="this.$store.state.isLogined == 0">
              <router-link to="/reg">注册</router-link>
              <router-link to="/login">登录</router-link>
              </div>
              <div class="user-name" v-else>
              欢迎!{{this.$store.state.username}},
              <mt-button  @click="logout" size="small">注销</mt-button>
              </div>
            </div>
            <div class="items">
              <router-link to="">修改头像</router-link>
              <router-link to="">修改资料</router-link>
              <router-link to="">我的地址</router-link>
            </div>
          </div>
          <div class="user-base-right">
            <img src="/img/index/view.png" alt="" slot="icon">
            <span class="vi">消息</span>
          </div>
          <ul class="user-base-icon">
            <li>
              <p>0</p>
              <p>订单总数</p>
            </li>
            <li>
              <p>1</p>
              <p>商品收藏</p>
            </li>
            <li>
              <p>12</p>
              <p>我的足迹</p>
            </li>
            <li>
              <p>0</p>
              <p>我的积分</p>
            </li>
          </ul>
        </div>
        <div class="order-nav">
                <router-link to="">
                    <span class="nav-name">
                        <i class="order-icon"></i>
                        我的订单
                    </span>
                    <span class="am-fr icon-tips">
                        查看全部订单 >
                        <i class="am-icon-angle-right"></i>
                    </span>
                </router-link>
        </div>
        <ul class="order-base">
          <li>
            <router-link to="">
              <i class="icon-1"></i>
              <p>待付款</p>
            </router-link>
          </li>
          <li>
            <router-link to="">
              <i class="icon-2"></i>
              <p>待发货</p>
            </router-link>
          </li>
          <li>
            <router-link to="">
              <i class="icon-3"></i>
              <p>待收货</p>
            </router-link>
          </li>
          <li>
            <router-link to="">
              <i class="icon-4"></i>
              <p>待评价</p>
            </router-link>
          </li>
          <li>
            <router-link to="">
              <i class="icon-5"></i>
              <p>退款/售后</p>
            </router-link>
          </li>
        </ul>
      </div>
      <!-- 顶部结束 -->
      <!-- 底部选项卡开始 -->
        <div class="main">
        <mt-tabbar v-model="tabbar" fixed>
          <mt-tab-item id="index">
            首页
            <img src="/img/icon/index_enabled.png" alt="" slot="icon" v-if="tabbar=='index'">
            <img src="/img/icon/index_disabled.png" alt="" slot="icon" v-else>
          </mt-tab-item>
          <mt-tab-item id="family">
            分类
            <img src="/img/icon/divide_enabled .png" alt="" slot="icon" v-if="tabbar=='family'">
            <img src="/img/icon/divide_disabled.png" alt="" slot="icon" v-else>
          </mt-tab-item>
          <mt-tab-item id="shopcart">
            购物车
            <img src="/img/icon/shopcart_enabled .png" alt="" slot="icon" v-if="tabbar=='shopcart'">
            <img src="/img/icon/shopcart_disabled.png" alt="" slot="icon" v-else>
          </mt-tab-item>
          <mt-tab-item id="me">
            我的
            <img src="/img/icon/me_enabled .png" alt="" slot="icon" v-if="tabbar=='me'">
            <img src="/img/icon/me_disabled.png" alt="" slot="icon" v-else>
          </mt-tab-item>
        </mt-tabbar>
        </div>
      <!-- 底部选项卡结束 -->
  </div>
</template>

<script>
export default {
    data(){
        return {
            tabbar:'me'
        }
    },
    methods:{
      logout(){
        this.$store.commit('logout');
      }
    },
    //监听底部选项卡
    watch:{
      tabbar(value){
      if(value=='index'){
        this.$router.push('/').catch(e=>{})
      }else if(value=='family'){
        this.$router.push('/family').catch(e=>{})
      }else if(value=='shopcart'){
        this.$router.push('/shopcart').catch(e=>{})
      }else{
        this.$router.push('/me').catch(e=>{})
      }
    }
    }
}
</script>

<style>
   .user-content{
     padding: 0;
   }
   .user-base {
    text-align: center;
    height: 210px;
    background-color: #ED5564;
    background-image: url(/img/index/user-member_top_bg.png);
    background-size: cover;
    width: 100%;
    position: relative;
    padding: 20px 10px;
    overflow: hidden;
  }
  .user-avatar{
    margin-bottom: 10px;
    text-align: center;
  }
  .user-avatar img.avatar {
    width: 80px;
    height: 80px;
    border-radius: 100%;
  }
  .user-avatar .user-name {
    margin-top: 5px;
    font-weight: 500;
  }
  .items{
    display: flex;
    justify-content: space-around !important;
  }
  .user-name a{
    color: #fff;
    margin: 0 auto;
  }
  .user-name a+a{
    margin-left: 10px;
  }
  .user-base a{
    color: #fff;
  }
  .user-base-left .items a:not(:last-child) {
    margin-right: -125px;
  }
  .user-base-right {
    position: absolute;
    right: 10px;
    top: 10px;
    display: flex;
    align-items: center;
  }
  .vi{
    color: #fff;
    margin-left: 3px;
  }
  .mint-button--small {
    font-size: 5px !important;
    height: 20px !important;
    padding: 0px 5px !important;
  }
  ul.user-base-icon {
    left: 0;
    bottom: 0;
    width: 100%;
    padding: 18px 0;
    background: rgba(0,0,0,0.1);
    position: absolute;
    display: flex;
    justify-content: space-around;
    color: #fff;
  }
  .order-nav {
    padding: 10px 5px;
    border-bottom: 1px solid #f1f1f1;
  }
  .order-nav .nav-name i.order-icon {
    background-image: url(/img/index/user-index-nav-order-icon.png);
  }
  .order-nav i {
    width: 20px;
    height: 20px;
    background-repeat: no-repeat;
    background-position: center bottom;
    background-size: 70%;
    display: inline-block;
    vertical-align: bottom;
  }
  .order-nav .icon-tips{
    color: #888;
  }
.am-fr {
    float: right;
  }
  ul.order-base {
    margin-bottom: 10px;
    border-bottom: 1px solid #f1f1f1;
    padding: 13px 0 5px 0;
    overflow: hidden;
    display: flex;
  }
  ul.order-base li {
    width: 20%;
    text-align: center;
    position: relative;
  }
  .order-base a {
    color: #888;
  }
  ul.order-base i.icon-1 {
    background-image: url(/img/index/user-index-nav-order-icon-1.png);
  }
  ul.order-base i.icon-2 {
    background-image: url(/img/index/user-index-nav-order-icon-2.png);
  }
  ul.order-base i.icon-3 {
    background-image: url(/img/index/user-index-nav-order-icon-3.png);
  }
  ul.order-base i.icon-4 {
    background-image: url(/img/index/user-index-nav-order-icon-100.png);
  }
  ul.order-base i.icon-5 {
    background-image: url(/img/index/user-index-nav-order-icon-101.png);
  }
  ul.order-base li i {
    width: 20px;
    height: 20px;
    background-repeat: no-repeat;
    display: inline-block;
    vertical-align: bottom;
    opacity: 0.5;
    background-size: cover;
    margin-bottom: 2px;
  }
</style>