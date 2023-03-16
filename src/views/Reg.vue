<template>
    <div id="container">
        <div id="regbox">
            <p id="mainTopic">註冊頁面</p>
            <div class="regItem">
                帳號 :&nbsp;<input type="text" placeholder="請填入10-12位手機號碼" @blur="$uname()" v-model="uname">
                <i style="display: inline;color:blue;font-weight: bolder;" v-if="checkUname == 1">帳號不得為空</i>
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkUname == 2" >用戶名已被註冊</i>
                <i style="display: inline;color:green;font-weight: bolder;" v-if="checkUname == 3" >√用戶名可註冊</i>
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkUname == 4" >格式不正確</i>
            </div>
            <div class="regItem">
                密碼 : &nbsp;<input type="password" placeholder="請輸入6-10位英文或數字" @blur="$upwd" v-model="upwd">
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkUpwd == 1">帳號不得為空</i>
                <i style="display: inline;color:green;font-weight: bolder;" v-if="checkUpwd == 2" >格式正確</i>
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkUpwd == 3" >格式不正確</i>
            </div>
            <div class="regItem">
                確認密碼 : &nbsp;<input type="password" placeholder="請再次輸入密碼" @blur="$reupwd" v-model="reUpwd">
            </div>
            <div class="regItem">
                姓名 : &nbsp;<input type="text" placeholder="請輸入姓名" v-model="userName">
            </div>
            <div class="regItem">
                性別 :&nbsp;
                男  <input type="radio" name="gender" value="1">
                女  <input type="radio" name="gender" value="0">
            </div>
            <div class="regItem" @click="$email">
                信箱 : &nbsp; <input type="text" placeholder="請輸入手機號碼" @blur="$phone">
            </div>
            <div class="regItem">
                信箱 : &nbsp;<input type="email" placeholder="請輸入信箱" >
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
                reUpwd:"",
                userName:"",
                gender:0,
                email:"",
                phone:"",
                address:"",
                checkUname:1,
                unameBool:false,
                checkUpwd:1,
                upwdBool:false,
                checkReUpwd:1,
                reupwdBool:false,
                checkEmail:1,
                emailBool:false,
                checkPhone:1,
                phoneBool:false,
                state:false,
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
            },
            $phone(){
                if(this.phone.length == 0){
                    this.$phone = 2
                    return this.phoneBool = false
                }else if(this.phone.length >=8  && this.phone.length <= 10){
                    this.$phone = 3
                    return this.phoneBool = true
                }else{
                    this.$phone = 4
                    return this.phoneBool = false
                }
            },
            $email(){
                if(this.email.length == 0){
                    this.checkemail = 2
                    this.emailBool = false
                }else if(this.email.length >= 10 && this.email.length <= 50){
                    this.checkemail = 3
                    this.emailBool = true
                }else{
                    this.checkemail = 4
                    this.emailBool = false
                }
            },
            $uname(){
                let regExp = /^[\d]{10,12}$/
                let url = `/queryUser?account_name=${this.uname}`
                this.axios.get(url).then((res)=>{
                    // console.log(res)
                    if(this.uname == ""){
                        this.checkUname = 1
                        return this.unameBool = false
                    }else if(res.data == 1){
                        this.checkUname = 2
                        return this.unameBool = false
                    }else if(this.uname.match(regExp) && res.data == 0){
                        this.checkUname = 3
                        return this.unameBool = true
                    }else{
                        this.checkUname = 4
                        return this.unameBool = false
                    }
                })
            },
            $reupwd(){
                if(this.upwd == this.reUpwd ){
                    this.checkreupwd = 2
                    return this.reupwdBool = true
                }else{
                    this.checkreupwd = 3
                    return this.reupwdBool = false
                }
            },
            $upwd(){
                let regExp = /^[\w]{6,10}$/
                if(this.upwd == ""){
                    this.checkUpwd = 1
                    return this.upwdBool = false
                }else if(this.upwd.match(regExp)){
                    this.checkUpwd = 2
                    return this.upwdBool = true
                }else{
                    this.checkUpwd = 3
                    return this.upwdBool = false
                }
            },
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
    &::after{
        content:"";
        display:table;
    }
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