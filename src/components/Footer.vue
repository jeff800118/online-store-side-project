<template>
    <div id="container">
        <div id="box1">
            <div class="footerBox">
                <h3>關於達內商城</h3>
                <ul>
                    <li><a href="/login">關於我們</a></li>
                    <li><a href="/login">人才招募</a></li>
                </ul>
            </div>
            <div class="footerBox">
                <h3>店家服務</h3>
                <ul>
                    <li><a href="/login">招商專區</a></li>
                </ul>
            </div>
            <div class="footerBox">
                <h3>會員服務</h3>
                <ul>
                    <li><a href="/login">使用者規範</a></li>
                    <li><a href="/login">隱私權政策</a></li>
                    <li><a href="/login">常見問題</a></li>
                    <li><a href="/login">退貨流程</a></li>
                </ul>
            </div>
            <div class="footerBox">
                <h3>追蹤我們</h3>
                <ul>
                    <li><a href="/login">Facebook</a></li>
                    <li><a href="/login">Instagram</a></li>
                </ul>
            </div>
        </div>
        
        <div class="copyright">
            <i>Ⓒ2023 達內購物商城股份有限公司. All Rights Reserved</i>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                key: ""
            }
        },
    }
</script>

<style lang="scss" scoped>
#container{
    height:200px;
    width: 100%;
    display:inline-block;
    line-height: 1.5;
    width:100%;
    padding:15px 0 0;
    background-color: #f8f8f8;
    position:relative;
    word-wrap:break-word;
    bottom:0;
    display:flex;
    flex-direction: column;
    list-style-type: none;
}

.footerBox{
    text-align: center;
    display: flex;
    flex-direction: column;
    & ul{
        list-style-type: none;
        display: flex;
        flex-direction: column;
        padding: 0;
    }
    & h3{
        margin: 0;
    }
    & a{
        text-decoration: none;
        color: blue;
    }
}

#box1{
    display:flex;
    flex-direction: row;
    justify-content: space-evenly;
}
.copyright{
    border-top: 1px solid #ccc;

}
</style>