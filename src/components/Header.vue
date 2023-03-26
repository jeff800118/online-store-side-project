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
            <img src="../assets/cart.svg" alt=""  id="cart" @click="checkUser()">
            <el-badge :value="value" style="bottom:30px;right:10px" v-if="this.value != 0"></el-badge>
        </el-button>
        </div>
        <!-- v-if="this.$store.state.uname"  -->
        <el-dialog 
        :modal-append-to-body="false" 
        title="我的購物車" 
        :visible.sync="dialogTableVisible" 
        v-if="this.$store.state.uname"
        :center="true"
        :fullscreen="false"
        >
          <el-table  
          @click="centerDialogVisible = true" 
          :data="data" 
          height="500"
          stripe
          show-summary
          style="width: 100%"
          :summary-method="getSummaries"
          type="index"
          :index="indexMethod"
          >
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
        <el-table-column label="商品名稱" show-overflow-tooltip property="cart_name" width="200px"></el-table-column>
        <el-table-column label="單價" property="cart_price" align="center"></el-table-column>
        <el-table-column label="" property="" align="center" width="50">
            <template slot-scope="{row}">
                <button @click="countMinus(row)" >-</button>
            </template>>
        </el-table-column>
        <el-table-column label="數量"  property="cart_count" align="center"  width="50"></el-table-column>
        <el-table-column label="" property="" align="center" width="50">
            <template slot-scope="{row}">
                <button @click="countPlus(row)" >+</button>
            </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
            <template slot-scope="{row}">
                <el-button type="danger" @click="removeFromCart(row)" size="small" >刪除</el-button>
            </template>
        </el-table-column>
        <el-table-column label="單項總價格" property="" align="center" >
            <template slot-scope="{row}">
                <div>{{ row.cart_price * row.cart_count }}</div>
            </template>
        </el-table-column>
          </el-table>
          <el-button slot="footer"  @click="centerDialogVisible = true">結帳</el-button>
         
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
                dialogTableVisible: false,
                centerDialogVisible: true,
                count:1,
                value:2,
                cartData:"",
                begin:1,
                input:"11111",
                options: [{
                  value: '1',
                  label: '1'
                }, {
                  value: '2',
                  label: '2'
                }, {
                  value: '3',
                  label: '3'
                }, {
                  value: '4',
                  label: '4'
                }, {
                  value: '5',
                  label: '5'
                }],
                    }
                },  
        methods:{
            removeFromCart(row){
                console.log(row)
                let url =`/del/${row.cart_num}`
                this.axios.get(url).then((res)=>{
                    console.log(res)
                })
                // row.splice(index,)
            },
            indexMethod(index){ 
                console.log(index)
                return index+1
            },
            // countPlus(row){
            //     let url = '/updateCart'
            //     let params = `cart_num=${row.cart_num}`

            //     this.axios.post(url,params).then((res)=>{
            //         console.log(res)
            //         res.data[goods_num].goods_count++
            //         if(res.data[goods_num].goods_count >= 10){
            //             alert('購買數量達上限')
            //             return;
            //         }else if(res.data[goods_num].goods_count > res.data[goods_num].goods_stock){
            //             alert('庫存不夠')
            //             return;
            //         }else{
            //             this.count++
            //             console.log(this.count)
            //         }
            //     })
            // },
            getSummaries(param) {
                const { columns, data } = param;
                const sums = [];
                columns.forEach((column, index) => {
                  if (index === 1 ) {
                    sums[index] = '總價 :';
                    return;
                  }
                  const values = data.map(item => Number(item[column.property]));
                  if (!values.every(value => isNaN(value)) && index == 2) {
                    sums[index] = values.reduce((prev, curr) => {
                      const value = Number(curr);
                      if (!isNaN(value)) {
                        return prev + curr;
                      } else {
                        return prev;
                      }
                    }, 0);
                    sums[index] += ' 元';
                  } 
                //   else if(index == 5 ){
                //     sums[index] = '';
                //   }
                });
                return sums;
            },
            countMinus(row){
                // console.log(row)
                if(row.cart_count >= 1 ){
                    let url = '/updateCart'
                    let params = `cart_num=${row.cart_num}&cart_count=${row.cart_count > 1 ? row.cart_count-- : 1}`
                    this.axios.post(url,params).then((res)=>{
                         return
                    })
                }
            },
            checkUser(){
                if(!this.$store.state.uname){
                    this.$router.push('/login')
                }
            },
            getUserData(){
                let url = '/queryUserCart'
                let params = `cart_uname=${this.$store.state.uname}`
                this.axios.post(url,params).then((res)=>{
                    console.log(res)
                    this.data = res.data
                    console.log(this.data.length)
                    this.value = this.data.length    
                })
            },
            // checkout(){
            //     let url = ''
            //     let params = `goods_stock`
            //     this.axios.post(url,params).then((res)=>{
            //         console.log(res)
            //     })
            // }
        },
        mounted(){
            this.getUserData()
        },
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

.cartTextCenter{
    text-align: center;
}

.bg-purple {
    background: #d3dce6;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    // border-radius: 4px;
    min-height: 36px;
  }


</style>