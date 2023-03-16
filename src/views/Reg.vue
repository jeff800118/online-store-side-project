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
                <i style="display: inline;color:blue;font-weight: bolder;" v-if="checkUpwd == 1">帳號不得為空</i>
                <i style="display: inline;color:green;font-weight: bolder;" v-if="checkUpwd == 2" >格式正確</i>
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkUpwd == 3" >格式不正確</i>
            </div>
            <div class="regItem">
                確認密碼 : &nbsp;<input type="password" placeholder="請再次輸入密碼" @blur="$reUpwd" v-model="reUpwd">
                <i style="display: inline;color:blue;font-weight: bolder;" v-if="checkReUpwd == 1" >確認密碼不得為空</i>
                <i style="display: inline;color:green;font-weight: bolder;" v-if="checkReUpwd == 2" >格式正確</i>
                <i style="display: inline;color:red;font-weight: bolder;" v-if="checkReUpwd == 3" >格式不正確</i>
            </div>
            <div class="regItem">
                姓名 : &nbsp;<input type="text" placeholder="請輸入姓名" v-model="userName">
            </div>
            <div class="regItem">
                性別 :&nbsp;
                男  <input type="radio" name="gender" value="1" v-model="gender">
                女  <input type="radio" name="gender" value="0" v-model="gender">
            </div>
            <div class="regItem" @click="$email">
                手機 : &nbsp; <input type="text" placeholder="請輸入手機號碼" @blur="$phone" v-model="phone">
            </div>
            <div class="regItem">
                信箱 : &nbsp;<input type="email" placeholder="請輸入信箱" v-model="email">
            </div>
            <div class="regItem">
                地址 : &nbsp;<input type="text" placeholder="請輸入地址" v-model="address"><br>
            </div>
                <button @click="regData()" id="btn">註冊</button>  
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
                reUpwdBool:false,
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
                let regExp = /^[\d]{10,12}$/
                let url = `/queryUser?account_name=${this.uname}`
                this.axios.get(url).then((res)=>{
                if(this.phone == ""){
                    this.checkPhone = 1
                    return this.phoneBool = false
                }else if(res.data == 1){
                    this.checkPhone = 2
                    return this.phoneBool = false
                }else if(this.uname.match(regExp) && res.data == 0){
                    this.checkphone = 3
                    return this.phoneBool = true
                }else{
                    this.checkPhone = 4
                    return this.phoneBool = false
                    }
                })
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
            $reUpwd(){
                if(this.upwd == ""){
                    this.checkReUpwd = 1
                    return this.reUpwdBool = false
                }else if(this.upwd == this.reUpwd){
                    this.checkReUpwd = 2
                    return this.reUpwdBool = true
                }else{
                    this.checkReUpwd = 3
                    return this.reUpwdBool = false
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
            regAccount(){
                let url='/reg'
                let params = `account_name=${this.uname}&account_password=${this.$md5(this.upwd)}&account_permission=1`
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    if(res.data == 1 && unameBool == true && upwdBool == true && reUpwdBool == true){
                        alert('註冊成功')
                    }else if(res.data == 0){
                        alert('註冊失敗')
                    }
                })
            },
            regUser(){
                let url='/regdetail'
                let params = `user_name=${this.username}&user_sex=${this.gender}&user_mail=${this.email}&user_phone=${this.phone}&user_address=${this.address}`
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    if(res.data == 1 && unameBool == true && upwdBool == true && reUpwdBool == true){
                        
                    }else if(res.data == 0){
                        this.$toast('註冊失敗')
                    }
                })
            },
            regData(){
                this.regUser()
                this.regAccount()
                this.$router.push('/login')
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