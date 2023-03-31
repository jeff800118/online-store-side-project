<template>
    <div id="container">
        <div id="loginbox">
            <!-- <img src="../assets/loginIMG.jpg" alt=""> -->
            帳號 : <input type="text" placeholder="請輸入手機號碼" v-model="uname">
            密碼 : <input type="password" placeholder="請輸入密碼" v-model="upwd"><br>
            <button id="btn" @click="getData()">登入</button>
            <router-link to="/">忘記密碼?</router-link>
            <p>還不是會員嗎?<a href="/Reg">立即註冊</a></p>
        </div>
    </div>
</template>

<script>
// import Footer from '../components/Footer.vue'
    export default {
        // components:{Footer},
        data() {
            return {
                data: "",
                uname:"",
                upwd:"",
                reupwd:"",
                // isRouterAlive:true,
            }
        },
        methods:{
            getData(){
                let url = '/login'
                let params = `account_name=${this.uname}&account_password=${this.$md5(this.upwd)}`
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    if(res.data == 1 ){
                        alert('登入成功')
                        this.$store.commit('getuname',this.uname)
                        this.$router.push('/')
                        this.$router.go(0)
                    }else if(res.data == 0){
                        alert('登入失敗')
                    }
                    
                })
            }
        }
    }
</script>

<style lang="scss" scoped>
#container{
    height:50rem;
    background-image: url(../assets/loginIMG.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment:fixed;
    // margin-top:80px
    position: relative;
    &::before{
        content:"";
        display:table;
    }
}

#loginbox{
    border:1px solid black;
    border-radius: 20px;
    width: 200px ;
    padding:20px;
    // position: relative;
    margin-top:12%;
    margin-left:40%;
    display:flex;
    flex-direction: column;
    text-align: center;
    line-height: 2;
    font-weight:700;
    background-color: white;
    & input{
        border-radius:20px;
    }
}

#btn{
    border-radius:20px;
    cursor: pointer;
}

#footer{
    background-color:#f8f8f8;
    min-height:170px;
    padding-top:10px;
    bottom:0
}

</style>