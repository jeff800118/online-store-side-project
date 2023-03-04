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
        <img src="../assets/3C產品/3C家電表示圖.png" alt="">
        <span>3C用品</span>
      </div>
      <div class="itemlist">
        <img src="../assets/健身戶外/健身戶外表示圖.jpg" alt="">
        <span>運動戶外</span>
      </div>
      <div class="itemlist">
        <img src="../assets/家具/家具表示圖.png" alt="">
        <span>家具電器</span>
      </div>
      <div class="itemlist">
        <img src="../assets/生活用品/生活用品表示圖.png" alt="">
        <span>生活用品</span>
      </div>
      <div class="itemlist">
        <img src="../assets/美妝保養/美妝保養表示圖.png" alt="">
        <span>美妝保養</span>
      </div>
      
      
      
    </div>

    <div id="hotItem">
      <table style="display:flex;flex-direction: row;">
        <ul >
          <li>好冷喔</li>
          <li>好冷喔</li>
          <li>好冷喔</li>
          <li>好冷喔</li>
        </ul>
        <ul>
          <li>好冷喔</li>
          <li>好冷喔</li>
          <li>好冷喔</li>
          <li>好冷喔</li>
        </ul>
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
.swiper img{
  background-size: cover;
  margin-top:4%;
}
.swiper-slide{
  display: flex;
  flex-direction: row;
  justify-content: center;
}

#itemBox{
  margin-left: 20%;
  margin-top: 5%;
  width: 60%;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}

.itemlist{
  display:flex;
  flex-direction: column;
  align-items: center;
  & span{
    // border: 1px solid black;
    border-radius: 30px;
    margin-top:5px;
    background-color: #f1f1f1;
    padding: 3px 5px;
  }
}

#hotItem{
  margin-top: 30px;
  // border:1px solid black;
  background-color: #f1f1f1;
}



</style>