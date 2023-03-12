<template>
  <div id="container">
    <div id="swiper">
      <swiper 
        class="swiper" 
        :options="swiperOption"
        ref="swiper"
        @mouseover.native="stopSwiper"
        @mouseout.native="startSwiper"
        >
          <swiper-slide clas="swiperSlide"><img src="../assets/3C產品/3C1.jpg" alt=""></swiper-slide>
          <swiper-slide clas="swiperSlide"><img src="../assets/3C產品/3C2.png" alt=""></swiper-slide>
          <swiper-slide clas="swiperSlide"><img src="../assets/3C產品/3C3.jpg" alt=""></swiper-slide>
          <div class="swiper-pagination" slot="pagination"></div>
          <div class="swiper-button-prev" slot="button-prev"></div>
          <div class="swiper-button-next" slot="button-next"></div>
      </swiper>
    </div>

    <div id="itemBox"  >
      <div class="itemList">
        <!-- <router-link to="/productlist/1" @click="goGoods(goods_pid)" :class="{cur:$route.params.type==1}"> -->
        <router-link to="/productlist/1">
          <img src="../assets/3C產品/3C家電表示圖.png" alt="">
          <span class="cur">3C用品</span>
        </router-link>
      </div>
      <div class="itemList">
        <router-link to="/productlist/2">
          <img src="../assets/運動戶外/健身戶外表示圖.jpg" alt="">
          <span class="cur">運動戶外</span>
        </router-link>
      </div>
      <div class="itemList">
        <router-link to="/productlist/3">
          <img src="../assets/家具電器/家具表示圖.png" alt="">
          <span class="cur">家具電器</span>
        </router-link>
      </div>
      <div class="itemList">
        <router-link to="/productlist/4">
          <img src="../assets/生活用品/生活用品表示圖.png" alt="">
          <span class="cur">生活用品</span>
        </router-link>
      </div>

      <div class="itemList">
        <router-link to="/productlist/5">
          <img src="../assets/美妝保養/美妝保養表示圖.png" alt="">
          <span class="cur">美妝保養</span>
        </router-link>
      </div>
    </div>

    <!-- <div class="category">
      <div><router-link to="/#/1">{{this.data[0].goods_style}}</router-link></div>
      <div :class="{cur:$route.params.type == 1}">{{this.data[10].goods_style}}</div>
      <div>{{this.data[20].goods_style}}</div>
      <div>{{this.data[30].goods_style}}</div>
      <div>{{this.data[40].goods_style}}</div>
    </div> -->
    
    <!-- <div id="hotItemBox">
      <div class="hotItem" v-for="(item,index) in data" :key="index">
        <img :src="`{{ item.goods_img }}`" alt="" > -->
        <!-- <img src="../assets/3C產品/3C2.png" alt="" > -->
        <!-- <ul>
          <li>商品名稱 : {{item.goods_name}}</li>
          <li>商品價格 : {{item.goods_price}}</li>
          <li>商品庫存 : {{item.goods_stock}}</li>
          <li @click="goGoods">商品類型 : {{item.goods_pid}}</li>
        </ul>
      </div>
    </div> -->

    <div id="comment">
      <table>
        <tr>
          <th>主題</th>
          <th>回復/瀏覽</th>
          <th>作者</th>
          <th>時間</th>
        </tr>
        <tr>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
        </tr>
        <tr>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
        </tr>
      </table>
    </div>
    <div id="cart">
      <h3>購物車</h3>
      <div id="cartBox">
        <span><input type="checkbox"> 全選</span>
        <span>商品信息</span>
        <span>單價</span>
        <span>數量</span>      
        <span>金額</span>
        <span>操作</span>
      </div>
      <!-- <ul> -->
        <!-- <h2 v-if="goods.lenght == 0">購物車中沒有任何商品!</h2> -->
        <!-- <li v-for="(item,index) in data" :key="index"> -->
          <!-- <a href=""></a> -->
          <!-- <a href="">{{ item.goods_name }}</a> -->
          <!-- <b href="">{{ item.goods_price }}</b> -->
          <!-- <div> -->
            <!-- <button @click="updatecount(index,count--)">-</button> -->
          
            <!-- <button @click="updatecount(index,count++)">+</button> -->
          <!-- </div> -->
          <!-- <span>總金額 : {{ this.price*this.count }}<strong></strong></span> -->
        <!-- </li> -->
      <!-- </ul> -->
      <!-- <div> -->


        <!-- <span>已選商品</span>
        
        <button>結算</button> -->
      <!-- </div> -->
    </div>
</div>
</template>

<script>
import {swiper,swiperSlide} from 'vue-awesome-swiper';
import 'swiper/dist/css/swiper.min.css';
  export default {
    data() {
        return {
          data() {
            return {
              data: "",
              avatar:Math.floor(Math.random()*10),
              goods:"",
              a:1,
              imgList:[],
              category:"",
              }
            },
            swiperOption: {
                autoplay:{
                    delay:4000,
                    disableOnInteraction:false
                },
                effect:'auto',
                pagination:{
                    el: '.swiper-pagination',
                    dynamicBullets: true,
                    clickable:true
                }
            }
        }
    },
    beforeRouteUpdate(from,to,next){
      next()
    },
    components:{
      swiper,
      swiperSlide
    },
    methods:{
      getData(){
        let url = '/goods'
        this.axios.get(url).then((res)=>{
          this.data = res.data
        })
      },
      goGoods(goods_pid){
        // console.log(goods_pid)
        let url = `/category/${goods_pid}`
        this.axios.get(url).then((res)=>{
        })
      },
      style(){
        let url = '/discountpercent'
        this.axios.get(url).then((res)=>{
          this.category = res.data
          // console.log(this.category)
        })
      },
      startSwiper(){
            this.$refs.swiper.swiper.autoplay.start()
        },
      stopSwiper(){
            this.$refs.swiper.swiper.autoplay.stop()
        }
    },
    mounted(){
      // this.goGoods()
      this.style()
    }
  }
</script>

<style lang="scss" scoped>
.swiper{
  width: 30%;
  margin-top: 80px;
}

.swiper img{
  background-size: cover;
  margin-top:4%;
}
.swiperSlide{
  display: flex;
  flex-direction: row;
  justify-content: center;
}


// items容器
#itemBox{
  margin-left: 20%;
  margin-top: 5%;
  width: 60%;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}

// items列表
.itemList{
  display:flex;
  flex-direction: column;
  align-items: center;
  text-decoration: none;
  & span{
    // border: 1px solid black;
    border-radius: 30px;
    margin-top:5px;
    background-color: #f1f1f1;
    padding: 3px 5px;
  }
}

// item跳轉
a{
  text-decoration: none;
  display:flex;
  flex-direction: column;
  text-align: center;
  color:black
}

// items項目名稱

  #hotItemBox{
  margin-top: 30px;
  display: flex;
  flex-direction:row ;
  align-items: center;
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
  & img{
    width: 25%;
    height:25%;
  }
}

// 文章回覆
#comment{
  margin-top: 30px;
  // border:1px solid black;
  background-color: #f1f1f1;
  display: flex;
  flex-direction: column;
  text-align: center;
  & table{
    background-color:white;
  // border-spacing: seperate;
    & td{
    border-bottom: 1px solid #e1e1e1;
    border-collapse: collapse;
    text-decoration: none;
  }
  & th{
    border-bottom: 2px solid #a1a1a1;
    border-collapse: collapse;
  }
  }
}

.cur:active {
    background: #f39700;
    color:#fff;
    margin-left: 5px;
    margin-right: 5px;
}

.category{
  display: flex;
  flex-direction: column;
  & a{
    text-align: left!important;
  }
}

</style>