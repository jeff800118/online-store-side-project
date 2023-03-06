<template>
    <div id="container">
        <div id="loginbox">
            <!-- <img src="../assets/loginIMG.jpg" alt=""> -->
            手機號碼 : <input type="text" placeholder="請輸入手機號碼">
            密碼 : <input type="password" placeholder>
            確認密碼 : <input type="password"><br>
            <button id="btn">登入</button>
            <p>忘記密碼</p>
            <p>還不是會員嗎?<a href="/Reg">立即註冊</a></p>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                data: "",
                uname:"",
                upwd:"",
                reupwd:"",
            }
        },
        methods:{
            // let url = '/login'
            // let params = `account_name=${this.uname}&account_password=${this.upwd}`
            getData(){
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    this.$store.commit('getuname',this.uname)
                })
            }
        }
    }
</script>

<style lang="scss" scoped>
#container{
    height:700px;
    background-image: url(../assets/loginIMG.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment:fixed;
    margin-top:80px
}

#loginbox{
    border:1px solid black;
    border-radius: 20px;
    width: 200px ;
    padding:20px;
    position: absolute;
    margin-top:8%;
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
</style>