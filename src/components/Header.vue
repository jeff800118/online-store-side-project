<template>
    <div id="container">
        <div id="indexImg">
            <img src="../assets/家具/家具表示圖.png" alt="">
        </div >
        <div id="topic">
            <p>我是主題</p> 
        </div>
        <div id="loginbar">
            <span v-show="data">{{$store.state.uname}}你好</span>
            <img src="../assets/cart.svg" alt="" @click="goCart()" id="cart">
            <router-link to="/login" v-show="!data" class="login"> &nbsp;登入 | 註冊&nbsp;</router-link>
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
    &>img{
        height:50px;
    }
}

#topic{
    flex-direction: column;
    justify-content: center;
}


// 登入條與cart

#loginbar img{
    box-sizing: border-box;
    cursor: pointer;
}

#loginbar a{
    vertical-align:super;
}

// #cart{
//     cursor: pointer;
// }

.login{
    border:1px solid black;
    border-radius:30px;
    text-decoration: none;
}

</style>