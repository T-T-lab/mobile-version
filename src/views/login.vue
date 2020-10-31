<template>
  <div>
      <mt-header>
          <router-link to="/" slot="left">
          <mt-button icon="back" ></mt-button>
          </router-link>
          <router-link to="/reg" slot="right" class="shortcut">
              注册
          </router-link>
      </mt-header>
      <div>
      <mt-field label="用户名" placeholder="请输入用户名" :attr="{maxlength:20}" type="text" v-model="username" :state="userState" @blur.native.capture="checkusername"></mt-field>
      <mt-field label="密码" placeholder="请输入密码名" :attr="{maxlength:16}" type="password" v-model="upwd" :state="upwdState" @blur.native.capture="checkupwd"></mt-field>
      <mt-button size="large" type="primary" @click="handle">立刻登录</mt-button>
      </div>
  </div>
</template>
<style scoped>
  .shortcut{
      text-decoration: none;
  }
</style>
<script>
  export default{
      data(){
         return{
          //用户名
          username:'',
          //密码
          upwd:'',
          //确认密码
          userState:'',
          upwdState:''
        }   
      },
      methods:{
          checkusername(){
              //校验用户名
              let userReg=/^[0-9a-zA-Z_]{6,20}$/;
              if(userReg.test(this.username)){
                  console.log("用户名可用")
                  this.userState='success'
                  return true
              }else{
                  this.userState='error'
                  // alert("用户名不符合规范")
                  // this.$toast("用户名为必填项")
                  this.$toast({
                      message:"用户名为必填项",
                      position:"top",
                      duration:"2000"
                  })
                  return false
              }
          },
          checkupwd(){
              let upwdReg=/^[0-9A-Za-z]{6,20}$/
              if(upwdReg.test(this.upwd)){
                  console.log("密码正确√")
                  this.upwdState='success'
                  return true
              }else{
                  this.upwdState='error'
                  this.$toast({
                      message:"密码格式不正确,请重试",
                      position:"top",
                      duration:"2000"
                  }) 
                  return false
              }
          },
          handle(){
              if(this.checkupwd()&this.checkusername()){
                  console.log("可以登录")
                  let obj={
                      username:this.username,
                      upwd:this.upwd 
                 }
                //   console.log(obj)
                  //分发action
                  this.$store.dispatch('login',obj)
                  
                //   this.axios.get('/user/login',{params:obj}).then(res=>{
                //       if(res.data.code==1){
                //           this.$router.push('/')
                //       }else{
                //           this.$messagebox('登录提示','用户名或密码错误')
                //       }
                //   })
              }
          }
      }
  }
</script>
