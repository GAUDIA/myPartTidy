<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer2{
       width: 1500px;
       height: 370px;
       margin: auto;
   }

   .mainImg{
       background: #587570;  
       width: 1200px;
       height: 330px;
       margin-top:60px;
   }
   .mainImg>span{
       width:30px;
   }
   span>a{
       width:40px;
       height:250px;
   }

   #carouselExampleIndicators{
       width: 100%;
       height: 100%;
   }

   .slideImg{
       display: inline-block;
       width:210px;
       height:320px;
       margin:5px;
       border: 1px solid black;
        }
    .d-block{
      width:210px;
      height:320px;
      object-fit:cover;
      object-position: center;
    }
    .star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
/**/
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label>i{
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label>i {
  -webkit-text-fill-color: gold;
}
 
.star-rating label>i:hover,
.star-rating label>i:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
.star{
  font-size: 20px;
}
</style>
</head>
<body style="background-color: #0e332c;">
	<%@ include file="topbar.jsp" %>
	<div class="outer2" align="center">

        <div class="mainImg">
            <div class="star-ratings">
                <div class="star-ratings-fill space-x-2 text-lg" :style="width: ratingToPercent();%"
                >
                  <span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>
                </div>
                <div class="star-ratings-base space-x-2 text-lg">
                  <span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span><span><i class="fas fa-star"></i></span>
                </div>
              </div>
              		  <input type="hidden" name="rate" id="rate" value="0">
              <div class="star-rating space-x-4 mx-auto">
                      <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                      <label for="5-stars" class="star pr-4"><i class="fas fa-star"></i></label>
                      <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                      <label for="4-stars" class="star"><i class="fas fa-star"></i></label>
                      <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                      <label for="3-stars" class="star"><i class="fas fa-star"></i></label>
                      <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                      <label for="2-stars" class="star"><i class="fas fa-star"></i></label>
                      <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                      <label for="1-star" class="star"><i class="fas fa-star"></i></label>
              </div>


      </div>

              

            
              <script>
                $(function(){ //????????????????????? ????????? ??????
			    			
                    ratingToPercent();
                  
			    		  })

                  function ratingToPercent() {
                    const score = +this.restaurant.averageScore * 20;
                    return score + 1.5;
                  } 
                
                function insertReview(){
	    			
	    			$.ajax({
	    				url:"rinsert.ga",
	    				data:{
	    					star:$(".star-rating").input.val()
	    				},
	    				type:"post",
	    				success:function(result){
	    					if(result > 0){//???????????? ?????? => ????????? ?????? ????????? ??????
	    						selectReviewList();
	    					    $("#reviewContent").val("");
	    					}
	    				},error:function(){
	    					console.log("??????????????? ajax ?????? ??????")
	    				}
	    			})
	    			
	    		}
                
                //????????? ?????? ????????? ?????? ?????? ????????? ?????????
                document.querySelector('textarea ????????????').addEventListener('keydown',function(){
                    //?????? 400??? ?????? ????????? ?????? ??????
                    let review = document.querySelector('textarea????????????');
                    let lengthCheckEx = /^.{400,}$/;
                    if(lengthCheckEx.test(review.value)){
                        //400??? ?????? ???
                        review.value = review.value.substr(0,400);
                    }
                });

                //?????? ????????? ?????? ?????? ????????? ?????????
                document.querySelector('?????????????????? ?????????').addEventListener('click', function(e){
                    //?????? ?????? ???????????? ????????? ??????
                    if(rating.rate == 0){
                        rating.showMessage('rate');
                        return false;
                    }
                    //?????? 5??? ???????????? ????????? ??????
                    if(document.querySelector('.review_textarea').value.length < 5){
                        rating.showMessage('review');
                        return false;
                    }
                    //??? ??????
                });
                
                
              </script>


            
        </div>




</body>
</html>