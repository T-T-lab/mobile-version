<template>
  <div>
      <div>
      <mt-header>
        <!-- 左侧logo -->
        <div slot="left">
          <router-link to="/">
            <img src="/img/index/logo.png" class="img" />
          </router-link>
        </div>
        <!-- 右侧搜索 -->
        <div slot="right">
          <div class="g">
            <router-link to="/sea">
            <van-search v-model="value" placeholder="其实搜索很简单^_^ !" class="put" />
            </router-link>
          </div>
        </div>
      </mt-header>
      </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      value:""
    }
  }

}
</script>

<style>
.mint-header {
  background-color: #d2354c !important;
}
.mint-tabbar > .mint-tab-item.is-selected {
  color: #d2364c !important;
}
.mint-header-button.is-right{
  width: 250px !important;
}
.img {
  width: 100px;
}
.g {
  position: relative;
  height: 28px;
  margin-right: 50px;
  margin-top: 2px;
}
.put {
  border-radius: 4px;
  padding: 6px;
  width: 190px;
  height: 28px;
}
.span {
  position: absolute;
  right: 8px;
  bottom: 3px;
  z-index: 10;
  line-height: 22px;
}
/* .i {
  width: 20px;
} */
.van-search__content{
  background-color: transparent;
}
.van-field__left-icon {
    margin-right: 16px;
}
</style>