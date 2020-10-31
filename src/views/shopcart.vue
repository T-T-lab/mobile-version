<template>
  <div>

      <!-- 顶部开始 -->
      <search></search>
    <div class="container">
    <div class="check">
      <input type="checkbox" v-model="flag" @change="ch()" />全选/取消
    </div>
    <div v-for="(pro, i) in this.$store.state.list" :key="i" class="dis">
        
        <span>
          <input type="checkbox" :value="pro.pid" v-model="arr" />
        </span>

        <div class="pic"><img style="width: 50px;height:50px" :src="pro.lunbo1" alt="" /></div>
        <div class="product">{{ pro.title }}</div>
        <div class="pri">¥{{ pro.price }}</div>
        <div class="cl">
          <button @click="jian(i)">-</button>
          {{ pro.number }}
          <button @click="jia(i)">+</button>
        </div>
        <div class="avg">小计:{{ pro.number * pro.price }}</div>
          <div>
          <button @click="del(i)">移除购物车</button>
          </div>
        
    </div>
    <div class="count">
      <p>总价为：¥{{ count }}</p>
    </div>
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
            tabbar:'shopcart',

             flag: false,
            arr: []
        }
    },
    //监听底部选项卡
    watch:
    {
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
      },

      arr(val) {
      if (val.length == this.$store.state.list.length) {
        this.flag = true;
      } else {
        this.flag = false;
      }
      },

    },
    computed: {
    count() {
      var sum = 0;
      for (var i in this.arr) {
        for (var j in this.$store.state.list) {
          if (this.arr[i] == this.$store.state.list[j].pid) {
            sum +=
              this.$store.state.list[j].number *
              this.$store.state.list[j].price;
          }
        }
      }
      return sum;
    },
    },

    methods: {
    fh() {
      this.$router.go(-1);
    },
    jian(i) {
      this.$store.commit("jian", i);
    },
    jia(i) {
      this.$store.commit("jia", i);
    },
    del(i) {
      this.$store.commit("delete", i);
    },
    ch() {
      this.arr = [];
      if (this.flag) {
        this.$store.state.list.forEach((pro) => {
          this.arr.push(pro.pid);
          console.log(pro);
        });
      } else {
        this.arr = [];
      }
    },
  },

    }
</script>

<style>
  .product{
    text-overflow: ellipsis;
    display: block;
    overflow: hidden;
    white-space: nowrap;
    width: 800px;
    padding: 10px;
  }
  .dis{
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 10px;
    font-size: 10px;
  }
  .cl{
    display: flex;
    justify-content: center;
    align-items: center;
    padding:10px ;
  }
  .count{
    margin-top: 50px;
    font-size: 20px;
    color: red;
  }
  .check{
    padding: 10px;
  }
  .pic{
    margin-left: 10px;
  }
  .pri{
    margin: 5px;
  }
  .avg{
    padding:5px;
  }
  .container{
    width: 100%;
    box-sizing: border-box;
    margin: 0 auto;
  }
</style>