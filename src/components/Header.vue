<template>
    <div id="container">
        <div id="indexImg">
            <router-link to="/">
                <img src="../assets/indexImg.png" alt="">
                <span>達內線上商城</span>
            </router-link>
            <!-- <div class="searchBox">
                <input type="text" >
                <button>搜尋</button>
            </div> -->
        </div >
        <div id="topic">
            <router-link to="/">隨時最低價，好康都在這!</router-link> 
        </div>

        <!-- 右側cart & 登入/註冊 -->
        <div id="loginbar">
        <el-button type="text" @click="dialogTableVisible = true">
            <img src="../assets/cart.svg" alt=""  id="cart">&nbsp;
        </el-button>
        <el-dialog :modal-append-to-body="false" title="我的購物車" :visible.sync="dialogTableVisible">
          <el-table :data="data">
            <el-table-column property="goods_name" label="商品名稱" width="150"></el-table-column>
            <el-table-column property="goods_stock" label="商品數量" width="200"></el-table-column>
            <el-table-column property="goods_price" label="商品價格"></el-table-column>
          </el-table>
        </el-dialog>
        <div >
            <span v-show="$store.state.uname">{{$store.state.uname}}你好</span>
            <span v-show="$store.state.uname" @click="$store.commit('logout')"><a href="">退出</a> </span>
            <router-link to="/login" v-show="!$store.state.uname" class="login" > &nbsp;登入 | 註冊&nbsp;</router-link>
        </div>
        </div>
        

        
    </div>
</template>

<script>
    export default {
        data() {
            return {
                data: "",
                str:"",
                dialogTableVisible: false,
                dialogFormVisible: false,
            }
        },
        methods:{
            goCart(){
                alert('請輸入數量')
            },
            getCart(){
                this.str +=`
                    <div id="coverLayer" style="color:gray;width:100%;height:100%">
                        <div>
                            <div></div>
                        <div>
                    </div>
                `
                getEle
            },
            getData(){
                let url = '/goods'
                this.axios.get(url).then((res)=>{
                    this.data = res.data
                })
            }
        },
        mounted(){
            this.getData()
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
    display: flex;
    flex-direction: row;
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
    display: flex;
    flex-direction: row;
    align-items: center;
    // & img{
    //     box-sizing: border-box;
    //     cursor: pointer;
    //     padding-top:5px;
    // }
//    & span{
//         vertical-align:super;
//    }
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

// .searchBox{
//     padding-top:20px ;
//     flex-grow:1;
//     box-sizing: border-box;
//     height:25px;
//     & input{
//         vertical-align: middle;
//     }
//     & button{
//         vertical-align: middle;
//     } 
// }

</style>