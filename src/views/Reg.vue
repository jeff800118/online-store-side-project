<template>
    <div id="container">
        <div id="regbox">
            <p id="mainTopic">註冊頁面</p>
            <div class="regItem">
                帳號 :&nbsp;<input type="text" placeholder="請輸入手機號碼">
            </div>
            <div class="regItem">
                密碼 : &nbsp;<input type="password" placeholder="請輸入密碼">
            </div>
            <div class="regItem">
                確認密碼 : &nbsp;<input type="password" placeholder="請再次輸入密碼">
            </div>
            <div class="regItem">
                姓名 : &nbsp;<input type="text" placeholder="請輸入姓名">
            </div>
            <div class="regItem">
                性別 :&nbsp;
                男  <input type="radio">
                女  <input type="radio">
            </div>
            <div class="regItem">
                信箱 : &nbsp; <input type="text" placeholder="請輸入手機號碼">
            </div>
            <div class="regItem">
                信箱 : &nbsp;<input type="email" placeholder="請輸入信箱">
            </div>
            <div class="regItem">
                地址 : &nbsp;<input type="text" placeholder="請輸入地址"><br>
            </div>
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
                phone:"",
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
                let params = `account_name=${this.uname}&account_password=${this.$md5(this.upwd)}&user_name=${this.username}&user_sex=${this.gender}&user_phone=${this.phone}&user_mail=${this.email}&user_address=${this.address}`
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
    height:50rem;
    background-image: url(../assets/loginIMG.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment:fixed;
    margin-top:80px;
    &::before{
        content:"";
        display:table;
    }
}

#regbox{
    border:1px solid black;
    border-radius: 20px;
    width: 25% ;
    padding:20px;
    margin-top:5%;
    margin-left:40%;
    display:flex;
    flex-direction: column;
    font-weight:700;
    background-color: white;
}

#btn{
    border-radius:20px;
    cursor: pointer;
    font-weight: 700;
    font-size:24px;
    background-color:#f0f0f0;
    margin: 20px;
    border-top:2px solid black;
}


.regItem{
    border-top:1px solid #e1e1e1;
    line-height: 3;
    text-align: center;
    & input{
        align-self: center;
    }
}

#mainTopic{
    font-size:28px;
    border-bottom:2px solid black;
    text-align: center;
    line-height: 3;
    margin:0
}

</style>