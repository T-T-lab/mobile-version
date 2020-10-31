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
            <van-search v-model="value" placeholder="其实搜索很简单^_^ !" class="put" @click="searchSubmit" />
            </router-link>
          </div>
        </div>
      </mt-header>
      </div>
       <span class="total"  v-show="isCount">共有：{{count}} &nbsp;个结果</span>
       <div class="searchList">
          <ul>
            <li v-for="(res,i) of searchRes" :key="i">
              <router-link :to="`/details/${res.pid}`">
                <img :src="res.img">
                <p v-text="res.title"></p>
                <p v-text="`¥  ${res.price}`"></p>
              </router-link>
            </li>
          </ul>
        </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      value:"",
      searchRes:[],
      count:0,
      isCount:false
    }
  },
  methods:{
    searchSubmit(){
      this.isCount=true
      let value=this.value.trim()
      this.axios.get('/pro/search?title='+value).then(result=>{
        let res=result.data
        if(res.code==1){
          this.searchRes=res.searchs
          this.count = res.searchs.length;
        //   console.log(res.searchs);
        }
      })
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
.total{
    font-size: 15px;
    display: block;
    margin-top: 15px;
    margin-left: 10px;
}
 .searchList img{
   width: 50%;   
 }
 .searchList>ul{
   display: flex;
   flex-wrap: wrap;
   margin-left:10px;
   margin-top: 15px; 
   box-sizing: border-box; 
 }
 .searchList li{
     width: 50%;
     text-align: center;
 }
 .searchList p{
    text-overflow: ellipsis;
    display: block;
    overflow: hidden;
    white-space: nowrap;
    width: 80px;
 }
 .searchList p+p{
     margin-top: 10px;
 }
 li p{
     margin: 0 auto;
 }
</style>