<template>
  <div>
    <!-- 顶部开始 -->
    <search></search>
    <van-tree-select
  :items="items"
  :active-id.sync="activeId"
  :main-active-index.sync="activeIndex"
    />
    <!-- 顶部结束 -->
    <!-- 底部选项卡开始 -->
    <div class="main">
      <mt-tabbar v-model="tabbar" fixed>
        <mt-tab-item id="index">
          首页
          <img
            src="/img/icon/index_enabled.png"
            alt=""
            slot="icon"
            v-if="tabbar == 'index'"
          />
          <img src="/img/icon/index_disabled.png" alt="" slot="icon" v-else />
        </mt-tab-item>
        <mt-tab-item id="family">
          分类
          <img
            src="/img/icon/divide_enabled .png"
            alt=""
            slot="icon"
            v-if="tabbar == 'family'"
          />
          <img src="/img/icon/divide_disabled.png" alt="" slot="icon" v-else />
        </mt-tab-item>
        <mt-tab-item id="shopcart">
          购物车
          <img
            src="/img/icon/shopcart_enabled .png"
            alt=""
            slot="icon"
            v-if="tabbar == 'shopcart'"
          />
          <img
            src="/img/icon/shopcart_disabled.png"
            alt=""
            slot="icon"
            v-else
          />
        </mt-tab-item>
        <mt-tab-item id="me">
          我的
          <img
            src="/img/icon/me_enabled .png"
            alt=""
            slot="icon"
            v-if="tabbar == 'me'"
          />
          <img src="/img/icon/me_disabled.png" alt="" slot="icon" v-else />
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
      tabbar: "family",
      items:[
        {text:"新鲜水果",children:[{text:"新鲜瓜果",id:1},{text:"瓜果桃梨",id:2}]},
        {text:"热带水果",children:[{text:"热带水果",id:1}]},
        {text:"干果",children:[{text:"干果",id:1},{text:"各类干果",id:2}]}
      ],
      activeId: 1,
      activeIndex: 0,
    };
  },
  //监听底部选项卡
  watch: {
    tabbar(value) {
      if (value == "index") {
        this.$router.push("/").catch((e) => {});
      } else if (value == "family") {
        this.$router.push("/family").catch((e) => {});
      } else if (value == "shopcart") {
        this.$router.push("/shopcart").catch((e) => {});
      } else {
        this.$router.push("/me").catch((e) => {});
      }
    },
  },
};
</script>

<style>
</style>