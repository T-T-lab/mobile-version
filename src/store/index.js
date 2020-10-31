import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';
import router from '../router';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //标识用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    username:localStorage.getItem('username') ? localStorage.getItem('username') : '',

    list:JSON.parse(localStorage.getItem("list"))||[]

  },
  mutations: {
    logined(state,payload){
      state.isLogined = 1;
      //                       对应发送请求的变量名  
      state.username = payload.uname;
      localStorage.setItem('username',payload.uname);
    },
    logout(state){
      state.isLogined = 0;
      state.username = '';
      localStorage.removeItem('isLogined');
    },

    add(state,pro)
    {
        var obj = {
            pid: pro.pid,
            title: pro.title,
            lunbo1: pro.lunbo1,
            price: pro.price,
            number: 1
        }
        var index = state.list.findIndex((v) => {
            return pro.pid == v.pid
        })
        if (index == -1) {
            state.list.push(obj)
            localStorage.setItem("list", JSON.stringify(state.list))
        }
        else {
            state.list[index].number++;
            localStorage.setItem("list", JSON.stringify(state.list))
        } 
    },
    jian(state,i)
    {
        state.list[i].number--;
        localStorage.setItem("list", JSON.stringify(state.list))
        if (state.list[i].number<=0)
        {
            if(confirm("是否移除购物车"))
            {
                state.list.splice(i,1)
                localStorage.setItem("list", JSON.stringify(state.list))
            }
            else
            {
                state.list[i].number=1
                localStorage.setItem("list", JSON.stringify(state.list))
            }
        }},
        jia(state, i) {
          state.list[i].number++;
          localStorage.setItem("list", JSON.stringify(state.list))
      },
      delete(state, i) {
          state.list.splice(i,1);
          localStorage.setItem("list", JSON.stringify(state.list))
      }

  },
  actions: {
    login(context,payload){
      //发送异步请求
      axios.get('/user/login',{params:payload}).then(res=>{
        //用户登录成功
        if(res.data.code == 1){
          //提交Mutations
          context.commit('logined',res.data.info);          
          localStorage.setItem('isLogined','1');
          router.push('/');
        }else {
          this.$messagebox("登录提示","用户名或密码错误");
        }
      });
    }
  },
  modules: {
  }
})
