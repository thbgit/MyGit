//数量加减
$(function(){
	
	var $plus = $('.plus'),
		$reduce = $('.reduce'),
		$subtotal = $('.subtotal');
	$plus.click(function() {
		
		var $inputVal = $(this).prev('input'), //prev() 获得匹配元素集合中每个元素紧邻的前一个同胞元素，通过选择器进行筛选是可选的。
			$count = parseInt($inputVal.val()) + 1,
			$obj = $(this).parents('.amount_box').find('.reduce');
		
		$priceTotalObj = $(this).parents('.order_lists').parents('.order_content').next('.only').find('.subtotal'),
			$price = $(this).parents('.order_lists').find('.price').html(),
			$priceTotal = $count * parseInt($price.substring(1));
		
		$inputVal.val($count);
		//      $priceTotalObj.html('￥'+$priceTotal);
		if($inputVal.val() > 1 && $obj.hasClass('reSty')) {
			$obj.removeClass('reSty');
		}
	});

	$reduce.click(function() {

		var $inputVal = $(this).next('input'),
			$count = parseInt($inputVal.val()) - 1,
			$priceTotalObj = $(this).parents('.order_lists').parents('.order_content').next('.only').find('.subtotal'),
			$price = $(this).parents('.order_lists').find('.price').html(),
			$priceTotal = $count * parseInt($price.substring(1));
		if($inputVal.val() > 1) {
			$inputVal.val($count);
			//          $priceTotalObj.html('￥'+$priceTotal);
		}
		if($inputVal.val() == 1 && !$(this).hasClass('reSty')) {
			$(this).addClass('reSty');
		}
		
		
		
	});
});









