<template>
  <div>
    <Header></Header>
    <Router-view ></Router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from './components/Header.vue';
import Footer from './components/Footer.vue'
  export default {
    components:{Header,Footer},
  }
</script>

<style lang="scss" scoped>

</style>