$(function(){
	//��Ʒ����
	$('.all-goods .item').hover(function(){
		$(this).addClass('active').find('s').hide();
		$(this).find('.product-wrap').show();
	},function(){
		$(this).removeClass('active').find('s').show();
		$(this).find('.product-wrap').hide();
	});
	});
$(document).ready(function () {
	  $(".note ul li").mouseenter(function(){$(this).addClass("selected").siblings().removeClass("selected")
   });
 $(".note ul li").mouseenter(function(){
var index=$(".note ul li").index(this);
 $("#msg>div").eq(index).css("display", "block")
                                 .siblings().css("display", "none"); })
        })
$(document).ready(function () {
	  $(".d-propose .t1 ul li").mouseenter(function(){$(this).addClass("selected").siblings().removeClass("selected")
   });
 $(".d-propose .t1 ul li").mouseenter(function(){
var index=$(".d-propose .t1 ul li").index(this);
 $("div.list").eq(index).css("display", "block")
                                 .siblings().css("display", "none"); })
        })
$(document).ready(function () {
	  $(".pic").mouseenter(function(e){ $(this).find("a").animate({
    top:'-30px',height:'140px'
  }); $(this).find("div").animate({
    top:'-30px',
  });
   });
    $(".pic").mouseleave(function(e){$(this).find("a").animate({
   top:'0px',height:'140px'
  });$(this).find("div").animate({top:'0px',});
  });
      })
 window.onload = function ()
        { //����˵�����ʾ����                                                                

var oDiv3 = document.getElementById('all-class');
            var oDiv4 = document.getElementById('all-goods');
            var timer2 = null;//���嶨ʱ������
            //�������div1��div2���Ѷ�ʱ���ر��ˣ���������ʧ
            oDiv3.onmouseover = oDiv4.onmouseover = function ()
            {
                oDiv4.style.display = 'block';
                clearTimeout(timer2);
            }
            //����Ƴ�div1��div2�����¿���ʱ����������ʱ��ʧ
            oDiv3.onmouseout = oDiv4.onmouseout = function ()
            {
                //����ʱ��
                timer2 = setTimeout(function () { 
                    oDiv4.style.display = 'none'; }, 200);
            }
//��Ա�˳���¼
var oDiv1 = document.getElementById('div1');
            var oDiv2 = document.getElementById('div2');
            var timer = null;//���嶨ʱ������
            //�������div1��div2���Ѷ�ʱ���ر��ˣ���������ʧ
            oDiv1.onmouseover = oDiv2.onmouseover = function ()
            {
                oDiv2.style.display = 'block';
                clearTimeout(timer);
            }
            //����Ƴ�div1��div2�����¿���ʱ����������ʱ��ʧ
            oDiv1.onmouseout = oDiv2.onmouseout = function ()
            {
                //����ʱ��
                timer = setTimeout(function () { 
                    oDiv2.style.display = 'none'; }, 200);
            }
           
        }
$(document).ready(function () {
	  $("h3.tab a").mouseenter(function(){$(this).addClass("selected").siblings().removeClass("selected")
   });
 $("h3.tab a").mouseenter(function(){
var index=$("h3.tab a").index(this);
 $(".tab_view>div").eq(index).css("display", "block")
                                 .siblings().css("display", "none"); })
        })
	$(document).ready(function(){
  $("a.search_btn").click(function(){
var words=$("input.search_input").val();
  if(words){document.Searchform.submit();
  }
  else{
  alert("�������ݲ���Ϊ��")
  }


  });
});