<template>
    <div id="container">
        <div id="loginbox">
            <!-- <img src="../assets/loginIMG.jpg" alt=""> -->
            手機號碼 : <input type="text" placeholder="請輸入手機號碼">
            密碼 : <input type="password" placeholder>
            確認密碼 : <input type="password"><br>
            姓名 : <input type="password"><br>
            性別 : <input type="password"><br>
            信箱 : <input type="password"><br>
            地址 : <input type="password"><br>
            <button id="btn">登入</button>
            <p>忘記密碼</p>
            <button @click="getData()" id="btn">註冊</button>
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
                username:"",
                gender:1,
                email:"",
                address:"",
                upwdBool:false,
                reupwdBool:false,
                unameBool:false,
                emailBool:false,
            }
        },
        methods:{
            getData(){
                let url = '/reg'
                let params = `account_name=${this.uname}&account_upwd=${this.upwd}&user_sex=${this.gender}&user_phone=${this.uname}&user_mail=${this.email}&user_address=${this.address}`
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    if(res.data == 1){
                        alert('註冊成功')
                        this.$route.go('/login')
                    }else if(res.data == 0){
                        alert('註冊失敗')
                    }
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

#btn{
    border-radius: 10px;
    line-height: 30px;
}
</style>