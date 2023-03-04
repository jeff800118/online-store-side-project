<template>
    <div>
        <div id="container">
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
    position:fixed;
    top:0;
    left:0;
    right:0;
    line-height:2;
    z-index:50;
    background-color: #fff;
    box-shadow: 0 0 15px #444;
    display:flex;
    flex-direction:row;
    justify-content: end;
    font-size: 1rem;
    font-weight: bolder;
    font-family:Arial, Helvetica, sans-serif;
    padding:10px 10px
}

.login{
    border:1px solid black;
    border-radius:30px;
    text-decoration: none;
}

*, ::after, ::before {
    box-sizing: border-box;
}
#cart{
    cursor: pointer;
}

</style>