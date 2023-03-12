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
        <div id="hotItemBox">
            
            <div class="hotItem" v-for="(item,index) in dataShow" :key="index" v-show="$route.params.type == item.goods_pid">
                <div>
                    <img :v-html="item.goods_img" alt="" >
                
        <!-- <img src="../assets/3C產品/3C2.png" alt="" > -->
                    <ul>
                        <li><b>商品名稱 :</b> {{item.goods_name}}</li>
                        <li><b>商品價格 :</b> {{item.goods_price}}</li>
                        <li><b>商品庫存 :</b> {{item.goods_stock}}</li>
                        <li><b>商品類型 :</b> {{item.goods_pid}}</li>
                    </ul>
                </div>
                <div>
                    <button @click="addToCart(item.goods_num)">加到購物車</button>
                </div>
            </div>
            
        </div>
        <div id="pageList">
            <button @click="prevPage()">上一頁</button>
            <a :class="{pagination:currentPage == item - 1}" @click="page(item)" v-for="(item,index) in pageNum" :key="index" >{{ item }}</a>
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
                picList:this
            }
        },
        methods:{
            getData(){
                let url = `/category?goods_pid=${this.$route.params.type}`
                console.log(this.$route.params.type)
                this.axios.get(url).then((res)=>{
                    console.log(res)
                    this.data = res.data
                    this.pageNum = Math.ceil(this.data.length  / this.pageSize)

                    
                    for(let i = 0; i < this.pageNum ; i++){
                        this.totalPage[i] = this.data.slice(this.pageSize * i,this.pageSize * ( i + 1))
                    }
                    // console.log(this.totalPage[0])

                    this.dataShow = this.totalPage[this.currentPage]
                    console.log(this.dataShow[0].goods_img)
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
            page(item){
                    this.currentPage = item
                    this.dataShow = this.totalPage[item-1]
                    console.log(this.currentPage)
                    // console.log(item)
            },
            addToCart(goods_num){
                let url = '/addtocart/'+goods_num
                this.axios.get(url).then((res)=>{
                    console.log(res)
                    this.$store.commit('addToCart',goods_num)
                    console.log(this.$store.state.goods_num)
                })
            }
        },
        mounted(){
            this.getData(1)
        }
    }
</script>

<style lang="scss" scoped>
// items項目名稱
#container{
    margin-top: 100px;
}

#hotItemBox{
  display: flex;
  flex-direction:row ;
  justify-content: space-between;
  align-content: space-between;
  margin-top: 20px;
//   background-color:#a1a1a1;
//   border-bottom: 1px solid #a1a1a1; ;
//   overflow-y: scroll;
  max-width:100%;
  flex-wrap: wrap;
  & ul{
    list-style-type: none;
    line-height: 1.5;
  }
}


.hotItem{
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-wrap: wrap;
  flex:0 0 33%;
  height:200px;
//   border-top:1px solid #a1a1a1;
//   border-right:1px solid #a1a1a1;
//   border-left:1px solid #a1a1a1;
  border: 1px solid #a1a1a1;
  justify-content: center;
  margin-top: 3px;
  word-break:break-all;
  width:25%;
  & div{
    display: flex;
    flex-direction: row;
    align-items: center;
    & img{
        width: 25%;
        height: 25%;
    }
    & button{
        background: orange;
        color:white;
        cursor: pointer;
    }
    & b{
        background-color:#f9f2f4;

    }
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
    justify-content: center;
    margin: 20px;
    & button ,& a{
        // background-color: orange;
        // border: 1px solid black;
        margin: 5px;
        // color:black;
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