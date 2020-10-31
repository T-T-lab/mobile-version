<template>
  <div>
    <!-- 顶部开始 -->
    <search></search>
    <!-- 顶部结束 -->
    <!-- 轮播图 -->
    <div class="swipe">
      <mt-swipe :auto="4000">
        <mt-swipe-item>
          <img src="/img/index/cart1.jpg" alt />
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="/img/index/cart2.jpg" alt />
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 轮播图结束 -->
    <!-- 内容开始 -->
    <!-- 1楼 -->
    <div class="floorall">
      <div class="floor">
        <p class="floor-title">新鲜水果</p>
      </div>
    </div>
    <div class="agg">
      <div class="word">
        <router-link to="" class="outer">新鲜瓜果</router-link>
      </div>
      <div class="outer-con">
        <div class="describe">新鲜水果，应有尽有</div>
      </div>
    </div>
    <!-- 商品 -->
    <div class="list">
      <div class="goods-items" v-for="(t,i) of pro1" :key="i">
        <router-link :to="`/details/${t.pid}`" class="am-block">
          <img v-lazy="t.img"  class="image" />
        </router-link>
        <div class="outer-con">
          <div class="goods-title">
            <router-link to="">{{t.title}}</router-link>
          </div>
          <p class="price">¥{{t.price}}</p>
        </div>
      </div>
    </div>
    <!-- 2楼 -->
    <div class="floorall">
      <div class="floor">
        <p class="floor-title">热带新品</p>
      </div>
    </div>
    <div class="agg" style="background: url(/img/index/fruit2.jpg) 0% 0% / 100% no-repeat;">
      <div class="word">
        <router-link to="" class="outer">热带水果</router-link>
      </div>
      <div class="outer-con">
        <div class="describe">热带新品，应有尽有</div>
      </div>
    </div>
    <!-- 商品 -->
    <div class="list">
      <div class="goods-items" v-for="(t,i) of pro2" :key="i">
        <router-link :to="`/details/${t.pid}`" class="am-block">
          <img v-lazy="t.img" alt class="image" />
        </router-link>
        <div class="outer-con">
          <div class="goods-title">
            <router-link to="">{{t.title}}</router-link>
          </div>
          <p class="price">￥{{t.price}}</p>
        </div>
      </div>
    </div>
    <!-- 3楼 -->
    <div class="floorall">
      <div class="floor">
        <p class="floor-title">干果</p>
      </div>
    </div>
    <div class="agg" style="background: url(/img/index/fruit3.jpg) 0% 0% / 100% no-repeat;">
      <div class="word">
        <router-link to="" class="outer">干果</router-link>
      </div>
      <div class="outer-con">
        <div class="describe">干果新品，应有尽有</div>
      </div>
    </div>
    <!-- 商品 -->
    <div class="list">
      <div class="goods-items" v-for="(t,i) of pro3" :key="i">
        <router-link :to="`/details/${t.pid}`" class="am-block">
          <img v-lazy="t.img" alt class="image" />
        </router-link>
        <div class="outer-con">
          <div class="goods-title">
            <router-link to>{{t.title}}</router-link>
          </div>
          <p class="price">￥{{t.price}}</p>
        </div>
      </div>
    </div>
    <!-- 右侧导航栏 -->
    <div class="am-offcanvas" v-show="nav">
      <div class="am-offcanvas-bar">
        <ul class="am-list">
          <li>
            <a href="" slot="icon">
              <img src="/img/icon/" alt />
              个人中心
            </a>
          </li>
          <van-collapse v-model="activeNames">
          <li>
            <van-collapse-item name="1" title="业务管理">
            <!-- <a href="" slot="icon">
            <img src="/img/icon/" alt />
            </a> -->
            <ul class="user-sidebar-sub">
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              订单管理
            </a>
            </li>
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              订单售后
            </a>
            </li>
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              我的收藏
            </a>
            </li>
            </ul>
            </van-collapse-item>
          </li>
          <li>
            <van-collapse-item name="2" title="财产中心">
            <!-- <a href="" slot="icon">
            <img src="/img/icon/" alt />
            </a> -->
            <ul class="user-sidebar-sub">
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              我的积分
            </a>
            </li>
            </ul>
            </van-collapse-item>
          </li>
          <li>
            <van-collapse-item name="3" title="资料管理">
            <!-- <a href="" slot="icon">
            <img src="/img/icon/" alt />
            </a> -->
            <ul class="user-sidebar-sub">
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              个人资料
            </a>
            </li>
            <li>
              <a href="" slot="icon">
            <img src="/img/icon/" alt />
              我的地址
            </a>
            </li>
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              我的消息
            </a>
            </li>
            <li>
            <a href="" slot="icon">
            <img src="/img/icon/" alt />
              我的足迹
            </a>
            </li>
            <li>
              <a href="" slot="icon">
            <img src="/img/icon/" alt />
              问答/留言
            </a>
            </li>
            </ul>
            </van-collapse-item>
          </li>
          </van-collapse>
          <li class="am-active">
            <a href="">返回首页</a>
          </li>    
        </ul>
      </div>
    </div>
    <div class="user-menu am-icon-btn" @click="show()">
      <img src="/img/icon/menu.png" alt />
    </div>
    <!-- 底部选项卡开始 -->
    <div class="main">
      <mt-tabbar v-model="tabbar" fixed>
        <mt-tab-item id="index">
          首页
          <img src="/img/icon/index_enabled.png" alt slot="icon" v-if="tabbar=='index'" />
          <img src="/img/icon/index_disabled.png" alt slot="icon" v-else />
        </mt-tab-item>
        <mt-tab-item id="family">
          分类
          <img src="/img/icon/divide_enabled .png" alt slot="icon" v-if="tabbar=='family'" />
          <img src="/img/icon/divide_disabled.png" alt slot="icon" v-else />
        </mt-tab-item>
        <mt-tab-item id="shopcart">
          购物车
          <img src="/img/icon/shopcart_enabled .png" alt slot="icon" v-if="tabbar=='shopcart'" />
          <img src="/img/icon/shopcart_disabled.png" alt slot="icon" v-else />
        </mt-tab-item>
        <mt-tab-item id="me">
          我的
          <img src="/img/icon/me_enabled .png" alt slot="icon" v-if="tabbar=='me'" />
          <img src="/img/icon/me_disabled.png" alt slot="icon" v-else />
        </mt-tab-item>
      </mt-tabbar>
    </div>
    <!-- 底部选项卡结束 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      tabbar: "index",
      value: "",
      nav: false,
      pro1:{},
      pro2:{},
      pro3:{},
      activeNames: []
    };
  },
  //监听底部选项卡
  watch: {
    tabbar(value) {
      if (value == "index") {
        this.$router.push("/").catch(e => {});
      } else if (value == "family") {
        this.$router.push("/family").catch(e => {});
      } else if (value == "shopcart") {
        this.$router.push("/shopcart").catch(e => {});
      } else {
        this.$router.push("/me").catch(e => {});
      }
    }
  },
  methods: {
    show() {
      if (this.nav == false) {
        this.nav = true;
      } else {
        this.nav = false;
      }
    }
  },
  mounted(){
    this.axios.get('/pro/index').then(result=>{
      this.pro1=result.data.slice(0,8)
      this.pro2=result.data.slice(8,16)
      this.pro3=result.data.slice(16,20)
      // console.log(this.pro1)
    });
    // this.axios.get('/pro/index2').then(result=>{
    //   this.pro2=result.data
    //   // console.log(this.pro2)
    // });
    // this.axios.get('/pro/index3').then(result=>{
    //   this.pro3=result.data
    //   // console.log(this.pro3)
    // });
  }
}

</script>

<style>
.swipe {
  height: 135px;
}
.swipe img {
  width: 100%;
}
.floor-title {
  font-size: 14px;
  margin: 20px 0px;
  line-height: 1px;
  border-left: 60px solid #d2364c;
  border-right: 60px solid #d2364c;
  text-align: center;
}
.floor {
  padding: 0 10%;
  border-bottom: 2px solid #ff0000;
  text-align: center;
  overflow: hidden;
  background: #eee;
}
.floorall {
  margin: 0 auto;
  padding-left: 0px;
  padding-right: 0px;
  width: 100%;
}
.agg {
  background: url(/img/index/fruit1.jpg) 0% 0% / 100% no-repeat;
  height: 106px;
  overflow: hidden;
  text-align: center;
}
.word {
  padding: 10px;
  overflow: hidden;
}
.outer {
  margin: 5px;
  height: 32px;
  line-height: 32px;
  text-align: center;
  color: #fff;
  background-color: rgba(0, 0, 0, 0.03);
  border-radius: 3px;
  display: inline-block;
  border: 1px solid #fff;
  text-decoration: none;
  overflow: hidden;
  width: 118px;
}
.outer-con {
  padding: 10px;
  text-align: center;
}
.describe {
  color: #fff;
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
}
.list {
  display: flex;
  flex-wrap: wrap;
}
.goods-items {
  width: 50%;
  padding: 10px;
  border-bottom: 1px solid #eee;
  border-right: 1px solid #eee;
  background-color: #fff;
  position: relative;
  overflow: hidden;
}
.am-block {
  display: block !important;
}
.image {
  max-width: 100%;
  padding: 10px;
}
img {
  box-sizing: border-box;
  vertical-align: middle;
}
.goods-title {
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 18px;
  height: 39px;
  margin-bottom: 0.5rem;
}
.price {
  color: #c00;
  font-weight: bold;
  text-overflow: ellipsis;
  overflow: hidden;
  text-align: left;
}
.main {
  margin-bottom: 80px;
}
.user-menu {
  position: fixed;
  z-index: 200;
  bottom: 60px;
  right: 18px;
}
.am-offcanvas {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 120;
  background: rgba(0, 0, 0, 0.15);
}
.am-offcanvas-bar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  width: 270px;
  transition: transform 0.3s ease-in-out;
  transform: translateX(0);
  overflow-y: auto;
  background: #f3f3f3;
}
.am-list {
    margin-bottom: 1.6rem;
    padding-left: 0;
}
.am-list > li {
    position: relative;
    display: block;
    margin-bottom: -1px;
    background-color: #fff;
}
.am-list>li+li{
  border-top:1px solid #ffe8ef;
}
.am-list li a {
    color: #323233;
    padding-left: 10px;
    padding: 0.8rem;
    display: block;
    font-size: 14px;
}
/* .am-list li:first-child {border-top:none;} */
/* .am-offcanvas-bar .am-list  li {
    border: 1px solid #ffe8ef;
} */
.user-sidebar-sub{
  margin-top: 0;
  margin-bottom: 0;
}
.user-sidebar-sub li{
  border-left: 0!important; 
  border-right: 0!important;
}
.user-sidebar-sub li a {
    padding-left: 35px;
}
.am-active a{
  background: #fff1f5;
  text-decoration: none;
  color: #d2364c;
}
.am-icon-btn {
  box-sizing: border-box;
  width: 48px;
  height: 48px;
  font-size: 24px;
  line-height: 48px;
  border-radius: 50%;
  background-color: #eee;
  color: #555555;
  text-align: center;
}
.am-icon-btn > img {
  width: 48px;
  padding-bottom: 20px;
}
</style>