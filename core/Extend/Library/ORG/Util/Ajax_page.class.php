<?php

// +----------------------------------------------------------------------
// |ajax分页类
// +----------------------------------------------------------------------
class Page{
		// 要替换的dom id
    public $dom='ajax_page';
	// 起始行数
    public $firstRow;
    // 列表每页显示行数
    public $listRows;
    // 分页总页面数
    protected $totalPages;
	    // 页数跳转时要带的参数
    public $parameter  ;
    // 总行数
    protected $totalRows;
    // 当前页数
    protected $nowPage;
	// 分页的栏的总页数
    protected $coolPages;
	// 分页栏每页显示的页数
    protected $rollPage;
	//是否显示linkpage
	protected $isShowLinkPage = FALSE;
	//是否显示输入页数跳转
	public $isJumpPage = FALSE;
	//是否使用Ajax,默认不使用
	public $AjaxType = FALSE;
	//JavaScript中使用的获取数据方法名
	public $function_name = 'pages';
	    // 默认分页变量名
    protected $varPage;
	// 分页显示定制
    protected $config = array('header'=>'条记录','prev'=>'上一页','next'=>'下一页','first'=>'首页','last'=>'末页','theme'=>' %totalRow% %header% %nowPage%/%totalPage% 页 %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end% %jump%');
	/**
     +----------------------------------------------------------
     * 
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array $totalRows  总的记录数
     * @param array $listRows  每页显示记录数
     * @param array $rollpage  是否显示linkpage条数
     +----------------------------------------------------------
     */
	public function __construct($totalRows,$listRows,$rollpage){
            $this->totalRows = $totalRows;
            $this->listRows = $listRows;
            $this->rollPage = $rollpage;
            $this->varPage = C('VAR_PAGE') ? C('VAR_PAGE') : 'p' ;
            $this->listRows = !empty($listRows)?$listRows:10;
            $this->isShowLinkPage = empty($rollpage)?false:true;
            $this->totalPages = ceil($this->totalRows/$this->listRows);     //总页数
            $this->coolPages  = ceil($this->totalPages/$this->rollPage);
            $this->nowPage  = !empty($_REQUEST['p'])?$_REQUEST['p']:1;
            if(!empty($this->totalPages) && $this->nowPage>$this->totalPages) {
                $this->nowPage = $this->totalPages;
            }
            $this->firstRow = $this->listRows*($this->nowPage-1);
	}
	/**
     +----------------------------------------------------------
     * 设置显示样式
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
	public function setConfig($name,$value) {
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }
	/**
     +----------------------------------------------------------
     * 分页显示输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function show() {
        
        if(0 == $this->totalRows) return '';
		$p = $this->varPage;
		$dom=$this->dom;
		$nowCoolPage      = ceil($this->nowPage/$this->rollPage);
        $url  =  $_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'],'?')?'':"?").$this->parameter;
        $parse = parse_url($url);
        if(isset($parse['query'])) {
            parse_str($parse['query'],$params);
            unset($params[$p]);
            unset($params['dom']);
            $http_query=http_build_query($params);
            if($http_query){
                     $url   =  $parse['path'].'?'.$http_query;
            }else{
                     $url   =  $parse['path'];
            }
        }

        //上下翻页字符串
        $upRow   = $this->nowPage-1;
        $downRow = $this->nowPage+1;
        if ($upRow>0){         
			if($this->AjaxType)
				$upPage="<a href=javascript:".$this->function_name."('$url','$dom','$upRow');>".$this->config['prev'].'</a>';//ajax方式
			else
				$upPage="<a href='$url&$p=$upRow'>".$this->config['prev'].'</a>';
        }else{
            $upPage='';
        }
     
        if ($downRow <= $this->totalPages){
			if($this->AjaxType)
				$downPage="<a href=javascript:".$this->function_name."('$url','$dom','$downRow');>".$this->config['next'].'</a>';//ajax方式
			else
				$downPage="<a href='$url&$p=$downRow'>".$this->config['next'].'</a>';
        }else{
            $downPage='';
        }
        // << < > >>
       
        if($this->nowPage == 1){
            
            $theFirst = '';
            $prePage = '<a href=javascript:;>'.$this->config['prev'].'</a>';//ajax方式
        }else{
            $preRow =  $this->nowPage-$this->rollPage;
			if($this->AjaxType){
				$theFirst = "<a href=javascript:".$this->function_name."('$url','$dom',1);>".$this->config['first'].'</a>';//ajax方式
				$prePage = "<a href=javascript:".$this->function_name."('$url','$dom',1);>".$this->config['prev'].'</a>';//ajax方式
			}else{
            	$theFirst = '<a href=\''.$url.'&'.$p.'=1\' >'.$this->config['first'].'</a>';
            	$prePage = '<a href=\''.$url.'&'.$p.'=1\' >'.$this->config['pre'].'</a>';
			}
        }
        
        if($this->nowPage == $this->totalPages){
            $nextPage = '<a href=javascript:;>'.$this->config['next'].'</a>';//ajax方式
            $theEnd='';
        }else{
            $nextRow = $this->nowPage+$this->rollPage;
            $theEndRow = $this->totalPages;

			if($this->AjaxType){
				$theEnd = '<a href=javascript:'.$this->function_name.'(\''.$url.'\','.$dom.',\''.$theEndRow.'\');>'.$this->config['last'].'</a>';//ajax方式
				$nextPage = '<a href=javascript:'.$this->function_name.'(\''.$url.'\','.$dom.',\''.$nextRow.'\');>'.$this->config['next'].'</a>';//ajax方式
			}else{
            	$theEnd = '<a href=\''.$url.'&'.$p.'='.$theEndRow.'\' >'.$this->config['last'].'</a>';
            	$nextPage = '<a href=\''.$url.'&'.$p.'='.$nextRow.'\' >'.$this->config['next'].'</a>';
			}
        }
        
        // 1 2 3 4 5
		if($this->isShowLinkPage){
			$linkPage = '';
        	for($i=1;$i<=$this->rollPage;$i++){
            $page=($nowCoolPage-1)*$this->rollPage+$i;
            //保证linkpage保持当前页不是最后一个
            if((($this->nowPage)%($this->rollPage)) ==0 ){
            	$page = ($nowCoolPage-1)*$this->rollPage+$i+$this->rollPage-1;
            }
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
					if($this->AjaxType)
						$linkPage .= "&nbsp;<a href=javascript:".$this->function_name."('$url','$dom','$page');>$page</a>";//ajax方式
					else
                    	$linkPage .= "&nbsp;<a href='$url&$p=$page>'$page</a>";
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= '&nbsp;<span class=\'currentpage\'>'.$page.'</span>';
                }
            }
       	  }
		}
		//jump page
		if($this->isJumpPage){
			$jump = '<input type=\'text\' id=\'jumppage\' value = \''.$this->nowPage.'\'>';
			$jump .='<input type=\'button\' id=\'jumppagebutton\' value=\'GO\' onclick=\'go_page('.$this->nowPage.')\'>';
			$jump .='<script>function go_page(page){var jumptopage = document.getElementById(\'jumppage\').value;var topage;';
			$jump .='if(jumptopage==page||isNaN(jumptopage)){return false;}else{ ';
			$jump .='if(jumptopage>'.$this->totalPages.'){topage = '.$this->totalPages.'}';
			$jump .='else if(jumptopage<1){topage = 1;}else{topage = jumptopage;}';
			if($this->AjaxType){
				$jump .= $this->function_name."('$url','$dom',',topage');";
			}else{
				$jump .='window.location.href = \''.$url.'&'.$p.'=\'+topage;';
			}
			$jump .='}}</script>';
		}
        $pageStr=str_replace(
        array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%','%jump%'),
        array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd,$jump),$this->config['theme']);
        return $pageStr;
    }
	
}
?>