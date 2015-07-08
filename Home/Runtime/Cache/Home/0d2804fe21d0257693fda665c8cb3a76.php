<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li class="face" onmouseover="this.className='facehover'" onmouseout="this.className='face'">
        <a href="<?php echo U('Article/detail?id='.$list['id']);?>" class="list-img"><?php echo ($list["goods_name"]); ?> </a>
        <p> <a href="<?php echo U('Article/detail?id='.$list['id']);?>" class="t2"></a></p>

    </li><?php endforeach; endif; else: echo "暂时没有数据" ;endif; ?>
</body>
</html>