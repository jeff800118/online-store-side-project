<template>
  <div>
    <div>
      <swiper 
        class="swiper" 
        :options="swiperOption"
        ref="swiper"
        @mouseover.native="stopSwiper"
        @mouseout.native="startSwiper"
        >
        <swiper-slide><img src="../assets/3C產品/3C1.jpg" alt=""></swiper-slide>
        <swiper-slide><img src="../assets/3C產品/3C2.png" alt=""></swiper-slide>
        <swiper-slide><img src="../assets/3C產品/3C3.jpg" alt=""></swiper-slide>
      </swiper>
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
                    delay:1500,
                    disableOnInteraction:false
                },
                effect:'auto',
                pagination:{
                    el: '.swiper-pagination',
                    // dynamicBullets: true,
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

</style>