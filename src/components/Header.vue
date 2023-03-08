<template>
    <div id="container">
        <div id="indexImg">
            <router-link to="/">
                <img src="../assets/indexImg.png" alt="">
                <span>達內線上商城</span>
            </router-link>
        </div >
        <div id="topic">
            <router-link to="/">隨時最低價，好康都在這!</router-link> 
        </div>
        <div id="loginbar">
            <span v-show="$store.state.uname">{{$store.state.uname}}你好</span>
            <span v-show="$store.state.uname" @click="$store.commit('logout')"><a href="">退出</a> </span>
            <img src="../assets/cart.svg" alt="" @click="goCart()" id="cart">&nbsp;
            <router-link to="/login" v-show="!$store.state.uname" class="login" > &nbsp;登入 | 註冊&nbsp;</router-link>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                data: false
            }
        },
        methods:{
            goCart(){
                alert('請輸入數量')
            },
        }
    }
</script>

<style lang="scss" scoped>
#container{
    // fixed後的設定
    position:fixed;
    top:0;
    left:0;
    right:0;
    z-index:50;
    // 行高設定
    // line-height:1.5;
    // 背景顏色與陰影
    background-color: #fff;
    box-shadow: 0 0 15px #444;
    // 容器編排設定
    display:flex;
    flex-direction:row;
    justify-content: end;
    font-size: 1rem;
    font-weight: bolder;
    font-family:Arial, Helvetica, sans-serif;
    padding:10px 10px;
}

// 主題與圖片
#indexImg {
    flex-grow:1;
    & a{
        text-decoration: none;
    }
    
    & a img{
        height:50px;
        padding-top:5px;
        box-sizing: border-box;
    }
    & a span{
        vertical-align: super;
        color:black;
    }
}

#topic{
    flex-grow:1;
    font-weight: bolder;
    pading:10px;
    &>a{
        margin: 0;
        font-size:40px;
        font-family:'Times New Roman', Times, serif;
        text-decoration: none;
        color: black;
    }   
}


// 登入條與cart


#loginbar {
    & img{
        box-sizing: border-box;
        cursor: pointer;
        padding-top:5px;
    }
   & span{
        vertical-align:super;
   }
   & a{
    text-decoration: none;
    color: black;
    margin-left:5px ;
    border:1px solid black;
    border-radius:30px;
    padding: 3px;
   }
}

.login{
    border:1px solid black;
    border-radius:30px;
    text-decoration: none;
    vertical-align:super;
}

</style>