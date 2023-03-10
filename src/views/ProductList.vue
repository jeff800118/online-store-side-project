<template>
    <div id="container">
        <div class="category">
            <div v-show="$route.params.type == 1"><router-link to ="#" :class="{cur:$route.params.type == 1}">{{$route.params.type == 1? "3C用品":""}}</router-link></div>
            <div v-show="$route.params.type == 2"><router-link to ="#" :class="{cur:$route.params.type == 2}">{{$route.params.type == 2? "運動戶外":""}}</router-link></div>
            <div v-show="$route.params.type == 3"><router-link to ="#" :class="{cur:$route.params.type == 3}">{{$route.params.type == 3? "家具電器":""}}</router-link></div>
            <div v-show="$route.params.type == 4"><router-link to ="#" :class="{cur:$route.params.type == 4}">{{$route.params.type == 4? "生活用品":""}}</router-link></div>
            <div v-show="$route.params.type == 5"><router-link to ="#" :class="{cur:$route.params.type == 5}">{{$route.params.type == 5? "美妝保養":""}}</router-link></div>
        </div>
        <!-- <hr> -->
        <div id="hotItemBox" >
            <div class="hotItem" v-for="(item,index) in dataShow" :key="index" v-show="$route.params.type == item.goods_pid">
                <!-- <img :src="item.goods_img" alt="" > -->
        <!-- <img src="../assets/3C產品/3C2.png" alt="" > -->
                    <ul>
                        <li>商品名稱 : {{item.goods_name}}</li>
                        <li>商品價格 : {{item.goods_price}}</li>
                        <li>商品庫存 : {{item.goods_stock}}</li>
                        <li>商品類型 : {{item.goods_pid}}</li>
                    </ul>
            </div>
        </div>
        <div id="pageList">
            <button @click="prevPage()">上一頁</button>
            <a @click="page(item)" v-for="(item,index) in pageNum" :key="index" >{{ item }}</a>
            <button @click="nextPage()" >下一頁</button>
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
                dataShow:[]
            }
        },
        methods:{
            getData(){
                let url = '/goods'
                this.axios.get(url).then((res)=>{
                    console.log(res)
                    this.data = res.data
                    // if(this.$route.params.type == 1){
                        this.pageNum = Math.ceil(this.data.length  / this.pageSize)
                    // }
                    
                    for(let i = 0; i < this.pageNum ; i++){
                        this.totalPage[i] = this.data.slice(this.pageSize * i,this.pageSize * ( i + 1))
                    }

                    this.dataShow = this.totalPage[this.currentPage]
                    console.log(this.dataShow)
                })
            },
            prevPage(){
                if(this.currentPage === 0){
                    return ;
                }else{
                    // this.currentPage--
                    this.dataShow = this.totalPage[--this.currentPage]
                }
            },
            nextPage(){
                if(this.currentPage === this.pageNum - 1){
                    return;
                }else{
                    // this.currentPage ++
                    this.dataShow = this.totalPage[++this.currentPage]
                }
            },
            page(item){
                    this.currentPage = item
                    this.dataShow = this.totalPage[item-1]
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
  align-items: center;
  overflow-y: scroll;
  // max-width:100%;
  flex-wrap: wrap;
  & ul{
    list-style-type: none;
    line-height: 1.5;
  }
}

.hotItem{
  word-break:break-all;
  width:25%;
}

.hotItem{
  display: flex;
  flex-direction: row;
  align-items: center;
  flex:0 0 33%;
  height:200px;
  border-top:1px solid #a1a1a1;
  justify-content: center;
  margin-top: 10px;
  & img{
    width: 25%;
    height:25%;
  }
}

.cur {
    background: #f39700;
    color:#fff;
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
    & a{
        border: 1px solid black;
        margin: 5px;
        // background-color: rgb(248, 203, 0);
        color:black;
        border-radius:5px;
        padding: 5px;
        // color:white;
        font-weight: 700;
        text-decoration: none;
    }
}

</style>