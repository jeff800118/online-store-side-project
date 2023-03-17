<template>
    <div id="container">
        <div class="category">
            <div><router-link to ="#" :class="{cur:$route.params.type == 1}">{{$route.params.type == 1? "3C用品":""}}</router-link></div>
            <div><router-link to ="#" :class="{cur:$route.params.type == 2}">{{$route.params.type == 2? "運動戶外":""}}</router-link></div>
            <div><router-link to ="#" :class="{cur:$route.params.type == 3}">{{$route.params.type == 3? "家具電器":""}}</router-link></div>
            <div><router-link to ="#" :class="{cur:$route.params.type == 4}">{{$route.params.type == 4? "生活用品":""}}</router-link></div>
            <div><router-link to ="#" :class="{cur:$route.params.type == 5}">{{$route.params.type == 5? "美妝保養":""}}</router-link></div>
        </div>
        <!-- <hr> -->
        <div class="hotItemBox" >

            <div class="hotItem" v-for="(item,index) in dataShow" :key="index" v-show="$route.params.type == item.goods_pid">
                <div class="goodsDetail">
                    <img :src="require(`../assets/${item.goods_img}`)" alt="" >
                    <ul>
                        <li><b>商品名稱 :</b> {{item.goods_name}}</li>
                        <li><b>商品價格 :</b> {{item.goods_price}}</li>
                        <li><b>商品庫存 :</b> {{item.goods_stock}}</li>
                        <li><b>商品類型 :</b> {{item.goods_style}}</li>
                    </ul>
                </div>
                <div class="addToCartBtn">
                    <button @click="addAllToCart(item.goods_num)">加到購物車</button>
                </div>
            </div>
            <!-- 家道購物車按鈕 -->
            
        </div>
        <div id="pageList">
            <button @click="prevPage()">上一頁</button>
            <a :class="{pagination:currentPage == item - 1}" @click="page(index)" v-for="(item,index) in pageNum" :key="index" >{{ index+1 }}</a>
            <button  @click="nextPage()" >下一頁</button>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                data: "",
                totalPage:[],
                currentPage:0,
                pageSize:6,
                pageNum:1,
                dataShow:[],
                goodsList:"",
                cart_count:"",
                cart_img:"",
                cart_name:"",
                cart_pid:"",
                cart_price:"",
            }
        },
        methods:{
            getData(){
                let url = `/category?goods_pid=${this.$route.params.type}`
                // console.log(this.$route.params.type)
                this.axios.get(url).then((res)=>{
                    console.log(res)
                    this.data = res.data
                    this.pageNum = Math.ceil(this.data.length  / this.pageSize)

                    
                    for(let i = 0; i < this.pageNum ; i++){
                        this.totalPage[i] = this.data.slice(this.pageSize * i,this.pageSize * ( i + 1))
                    }
                    // console.log(this.totalPage[0])

                    this.dataShow = this.totalPage[this.currentPage]
                    // console.log(this.dataShow[0].goods_img)
                    this.picList = this.dataShow
                })
            },
            prevPage(){
                if(this.currentPage ==  0){
                    return ;
                }else{
                    this.dataShow = this.totalPage[--this.currentPage]
                }
            },
            nextPage(){
                if(this.currentPage == this.pageNum - 1){
                    return;
                }else{
                    this.dataShow = this.totalPage[++this.currentPage]
                }
            },
            page(index){
                    this.currentPage = index
                    this.dataShow = this.totalPage[index]
                    console.log(this.currentPage)
                    // console.log(item)
            },
            addToCart(goods_num){
                let url = '/addToCart/'+goods_num
                this.axios.get(url).then((res)=>{
                    // console.log(res.data[0].goods_num)
                    this.goodsList = res.data[0]
                    this.cart_count = res.data[0].goods_count
                    // console.log(this.goods_count)
                    this.cart_img = res.data[0].goods_img
                    // console.log(this.goods_img)
                    this.cart_name = res.data[0].goods_name
                    // console.log(this.goods_name)
                    this.cart_price = res.data[0].goods_price
                    // console.log(this.goods_price)
                    this.cart_pid = res.data[0].goods_num
                    // console.log(this.goods_pid)
                    this.$store.commit('addToCart',this.goodsList)
                    // console.log(this.$store.state.goods_num[0].goods_name)
                    alert('商品已放入購物車')
                })

                
            },
            addToUserCart(){
                let url1 = '/userCart'
                let params = `cart_uname=${this.$store.state.uname}&cart_name=${this.cart_name}&cart_price=${this.cart_price}&cart_count=1&cart_pid=${this.cart_pid}&cart_img=${this.cart_img}`
                this.axios.post(url1,params).then((res)=>{
                    console.log(res)
                })
            },
            addAllToCart(goods_num){
                this.addToCart(goods_num)
                setTimeout(()=>{
                    this.addToUserCart()
                },500)   
            }
        },
        mounted(){
            this.getData()
        }
    }
</script>

<style lang="scss" scoped>
// items項目名稱
#container{
    margin-top: 100px;
    display: flex;
    flex-direction: column;
    
}

.category{
    margin-top:20px;
}

.hotItemBox{
  display: flex;
  flex-direction:row ;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  background-color:#f9f2f4;
  margin-top: 40px;
  max-width:100%;
  & ul{
    list-style-type: none;
    line-height: 1.5;
  }
}


.hotItem{
  display: flex;
  flex-direction: column;
  align-items: center;
  flex:0 0 33% ;
  height:250px;
  flex-wrap: wrap;
  border: 1px solid #a1a1a1;
  justify-content: center;
  margin-top: 3px; 
  background-color:white ;
  & img{
    width: 100%;
    width: 150px;
    margin-left: 5px;
  }
  & button{
        background: orange;
        color:white;
        cursor: pointer;
        width: 100px;
        }
  & .goodsDetail{
    display: flex;
    flex-direction: row;
    align-items: center;
    word-break:break-all;
    background-color:white ;
    }
    & b{
        background-color:#f9f2f4;
    }
}

.cur {
    background: orange;
    color:white;
    margin-left: 5px;
    margin-right: 5px;
    font-size: 30px;
    text-decoration: none;
    border-radius:20px;
    padding: 5px;
}

#pageList{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px;
    & button ,& a{
        margin: 5px;
        border-radius:5px;
        padding: 5px;
        font-weight: 700;
        text-decoration: none;
        cursor: pointer;
    }
}

.pagination{
    cursor: pointer;
    background-color: orange;
    border: 1px solid black;
    margin: 5px;
    color:white;
    border-radius:5px;
    padding: 5px;
    font-weight: 700;
    text-decoration: none;
}

</style>