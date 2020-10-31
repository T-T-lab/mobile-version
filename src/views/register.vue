<template>
    <div>
        <!-- 顶部导航开始 -->
        <mt-header>
            <router-link to="/" slot="left">
            <mt-button icon="back" ></mt-button>
            </router-link>
            <router-link to="/login" slot="right" class="shortcut">
                登录
            </router-link>
        </mt-header>
        <!-- 顶部导航结束 -->
        <div>
            <mt-field label="用户名" placeholder="请输入用户名" :attr="{maxlength:15}" type="text" v-model="username" @blur.native.capture="checkusername" :state="userState"></mt-field>

            <mt-field label="密码" placeholder="请输入密码" :attr="{maxlength:20,autocomplete:'off'}" type="password" v-model="password" @blur.native.capture="checkpassword" :state="upwdState"></mt-field>

            <mt-field label="确认密码" placeholder="请再次输入密码" :attr="{maxlength:20,autocomplete:'off'}" type="password" v-model="conpassword" @blur.native.capture="checkconpassword" :state="conupwdState"></mt-field>

            <mt-button size="large" type="primary" @click="handle">免费注册</mt-button>
        </div>
        <!-- 表单区域结束 -->
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
            password:'',
            //确认密码
            conpassword:'',
            userState:'',
            upwdState:'',
            conupwdState:'',
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
            checkpassword(){
                let passwordReg=/^[0-9A-Za-z]{6,20}$/
                if(passwordReg.test(this.password)){
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
            checkconpassword(){
                if(this.password!=this.conpassword){
                    this.conupwdState='error'
                    this.$toast({
                        message:"两次密码不一致",
                        position:"top",
                        duration:"2000"
                    })
                    return false
                }else{
                    this.conupwdState='success'
                    return true
                }
            },
            handle(){
                if(this.checkpassword()&this.checkusername()&this.checkconpassword()){
                    // console.log("可以注册")
                    let obj={
                      username:this.username,
                      password:this.password 
                  }
                    console.log(obj)
                    this.axios.get('/user/reg',{params:obj}).then(res=>{
                        if(res.data.code==1){
                            this.$router.push('/')
                        }else{
                            this.$messagebox('注册提示','用户名已占用')
                        }
                    })
                }
            }
        }
    }
</script>