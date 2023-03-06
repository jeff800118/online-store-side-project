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
          <swiper-slide clas="swiper-slide"><img src="../assets/3C產品/3C1.jpg" alt=""></swiper-slide>
          <swiper-slide clas="swiper-slide"><img src="../assets/3C產品/3C2.png" alt=""></swiper-slide>
          <swiper-slide clas="swiper-slide"><img src="../assets/3C產品/3C3.jpg" alt=""></swiper-slide>
          <div class="swiper-pagination" slot="pagination"></div>
          <div class="swiper-button-prev" slot="button-prev"></div>
          <div class="swiper-button-next" slot="button-next"></div>
      </swiper>
    </div>

    <div id="itemBox">
      <div class="itemlist">
        <router-link to="`/productlist/${goods.goods_style}`">
          <img src="../assets/3C產品/3C家電表示圖.png" alt="">
          <span>3C用品</span>
        </router-link>
      </div>
      <div class="itemlist">
        <router-link to="/outfit/">
          <img src="../assets/健身戶外/健身戶外表示圖.jpg" alt="">
          <span>運動戶外</span>
        </router-link>
      </div>
      <div class="itemlist">
        <router-link to="/furniture">
          <img src="../assets/家具/家具表示圖.png" alt="">
          <span>家具電器</span>
        </router-link>
      </div>
      <div class="itemlist">
        <router-link to="/daily">
          <img src="../assets/生活用品/生活用品表示圖.png" alt="">
          <span>生活用品</span>
        </router-link>
      </div>

      <div class="itemlist">
        <router-link to="/cosmetic">
          <img src="../assets/美妝保養/美妝保養表示圖.png" alt="">
          <span>美妝保養</span>
        </router-link>
      </div>
    </div>

    <div id="hotItem">
      <div>
        <img src="../assets/indexImg.png" alt="">
      </div>
      <ul >
        <li>goods_name</li>
        <li>goods_price</li>
        <li>goods_stock</li>
        <li>goods_style</li>
      </ul>
    </div>

    <div id="comment">
      <table>
        <tr>
          <th>標題</th>
          <th>ㄎㄎㄎㄎ</th>
          <th>ㄎㄎㄎㄎ</th>
        </tr>
        <tr>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
        </tr>
        <tr>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
          <td>ㄎㄎㄎㄎ</td>
        </tr>
      </table>
    </div>
</div>
</template>

<script>
import {swiper,swiperSlide} from 'vue-awesome-swiper';
import 'swiper/dist/css/swiper.min.css';
  export default {
    data() {
        return {
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
    components:{
      swiper,
      swiperSlide
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
.swiper-slide{
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
.itemlist{
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
#hotItem{
  margin-top: 30px;
  display: flex;
  flex-direction:row ;
  align-items: center;
  // border:1px solid black;
  // background-color: #f1f1f1;
  & ul{
    list-style-type: none;
    line-height: 1.5;
  }
}

#comment{
  margin-top: 30px;
  // border:1px solid black;
  background-color: #f1f1f1;
}


table{
  background-color:white;
  // border-spacing: seperate;
  &,th,td{
    border: 1px solid black;
    border-collapse: collapse;
  }
}

</style>