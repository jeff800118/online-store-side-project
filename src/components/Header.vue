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
        <div id="loginbar" >
        <el-button type="text" @click="dialogTableVisible = true" >
            <img src="../assets/cart.svg" alt=""  id="cart">
            <el-badge :value="value" style="bottom:30px;right:10px"></el-badge>
        </el-button>
        </div>

        <el-dialog :modal-append-to-body="false" title="我的購物車" :visible.sync="dialogTableVisible">
          <el-table :data="this.$store.state.goods_num" >
            <el-table-column property="" label="商品圖片" width="150"><img src="../assets/美妝保養/cosmetic1.jpg" alt="" id="cartImg"></el-table-column>
            <el-table-column property="goods_name" label="商品名稱" width="300" center="true"></el-table-column>
            <el-table-column label="" width="60"><button  @click="countMinus">-</button></el-table-column>
            <el-table-column label="數量" width="50" >{{count}}</el-table-column>
            <el-table-column label="" width="80"><button  @click="countPlus">+</button></el-table-column>
            <el-table-column property="goods_price" label="商品單價"></el-table-column>
            <el-table-column  label="商品總價">{{ this.$store.state.goods_num[0].goods_price * this.count }}</el-table-column>
          </el-table>
        </el-dialog>
        
        <div>
            <span v-show="$store.state.uname">{{$store.state.uname}}你好</span>
            <span v-show="$store.state.uname" @click="$store.commit('logout')"><a href="">退出</a> </span>
            <router-link to="/login" v-show="!$store.state.uname" class="login" > &nbsp;登入 | 註冊&nbsp;</router-link>
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
                count:1,
                value:2,
                imgList:[
                    {pid:1,src:require('../assets/3C產品/3C1.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C2.png')},
                    {pid:1,src:require('../assets/3C產品/3C3.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C4.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C5.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C6.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C7.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C8.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C9.jpg')},
                    {pid:1,src:require('../assets/3C產品/3C10.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit1.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit2.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit3.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit4.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit5.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit6.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit7.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit8.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit9.jpg')},
                    {pid:2,src:require('../assets/運動戶外/outfit10.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture1.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture2.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture3.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture4.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture5.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture6.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture7.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture8.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture9.jpg')},
                    {pid:3,src:require('../assets/家具電器/furniture10.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily1.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily2.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily3.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily4.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily5.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily6.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily7.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily8.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily9.jpg')},
                    {pid:4,src:require('../assets/生活用品/daily10.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic1.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic2.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic3.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic4.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic5.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic6.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic7.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic8.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic9.jpg')},
                    {pid:5,src:require('../assets/美妝保養/cosmetic10.jpg')}
                ],
            }
        },
        methods:{
            countPlus(){
                if(this.count >= 10){
                    alert('購買數量達上限')
                    return;
                }else if(this.count > this.$store.state.goods_num.goods_stock){
                    alert('庫存不夠')
                    return;
                }else{
                    this.count++
                    console.log(this.count)
                }
                // if(this.$store.state.goods_num.goods_count > 10){
                //     alert('購買數量達上限')
                //     return;
                // }else if(this.$store.state.goods_num.goods_count > this.$store.state.goods_num.goods_stock){
                //     alert('庫存不夠')
                //     return;
                // }else{
                //     this.$store.state.goods_num.goods_count++
                //     console.log(this.$store.state.goods_nu.goods_count++)
                // }
            },
            countMinus(){
                if(this.count == 0 ){
                    alert('數量不可低於0')
                    return;
                }else{
                    this.count--
                    console.log(this.count)
                    //     if(this.$store.state.goods_num.goods_count == 0 ){
                    //         alert('數量不可低於0')
                    //         return;
                    //     }else{
                    //         this.$store.state.goods_num.goods_count--
                    //         console.log(this.$store.state.goods_num.goods_count--)
                    //     }
                    // },
                }
            },
        },
        computed:{
            totalPrice(){
                return this.$store.getter.totalPrice
            }
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
    align-items: center;
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

}

.login{
    border:1px solid black;
    border-radius:30px;
    text-decoration: none;
    color: black;
    margin-left:5px ;
    padding: 3px;
    }

#cartImg{
    width:60%;
    height:60%;
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