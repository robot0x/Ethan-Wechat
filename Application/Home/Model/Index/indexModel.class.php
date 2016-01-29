<?php
/**
 * 首页indexAction 模型 
 * panjie
 * update:2016-01-24
 */
namespace Home\Model\Index;
use Jssdk\Logic\JssdkLogic;		//jssdk
use Order\Logic\OrderLogic;		//订单
use Room\Logic\RoomLogic;		//房型
use Config\Logic\ConfigLogic;	//系统配置
use Activity\Logic\ActivityLogic;//活动
use SlideShow\Logic\SlideShowLogic;	//幻灯片

class indexModel
{
	public $openId 		= "";		//用户openid
	public $signPackage = array();	//JSSDK签名
	public $orderInfo 	= array();	//订单的附加信息
	public $activeties  = array();  //活动列表信息

	public function setOpenId($openId)
	{
		$this->openId = $openId;
	}
	//在构造函数中获取APPID与appSecret
	public function __construct()
	{
		$appId = C("APPID");
		$appSecret = C("APPSECRET");
		$jssdk = new JssdkLogic($appId, $appSecret);
		$this->signPackage = $jssdk->getSignPackage();
		$this->getOrderInfo();
		$this->getActivityLists();
		$this->home();
	}
	
	//获取JSSDK
	public function getJssdk()
	{
		return $this->signPackage;
	}
	
	/**
	 * 获取近90天的日历信息
	 * 历史日期不能点击。
	 * 最多可选择90天内的日期
	 * @return jsonArray 
	 */
	public function getCalendarAjax()
	{
		//取当前日期信息
		$year 		= date("Y");
		$month 		= date("m");
		$firstDay 	= date("d");
		$beginDay   = $firstDay;

		//取日期选择范围
		$minTime 	= time();
		$maxTime 	= $minTime + 90 * 24 * 60 * 60;

		//计算日期选择月份
		$minMonth 	= date("m", $minTime);
		$maxMonth 	= date("m", $maxTime);


		$isFirstMonth 	= true;	//是否为首月
		$isShow 		= true;	//是否显示
		$calendar 		= array("year" => $year, "month" => $month, "day" => $firstDay); //初始化日历
		$data 			= array();	//初始化日期
		$index 			= 0;		//当天的总序列，用来比较选择的日期与当前日期的大小

		//对要显示的月份进行赋值
		for($i = $minMonth; $i <= $maxMonth; $i++)
		{
			//取当前月的总天数（比如2月是28天，还是29天）
			$lastDay 	= get_last_day($year . "-" . $month);
			
			//判断是否为最后一月
			if ($i == $maxMonth)
			{
				$isLastMonth = true;
				$lastDay = date("d", $maxTime);
			}
			else
			{
				$isLastMonth = false;
			}

			//取第一天是周几
			$weekDay = date("w", strtotime($year . $month . "01"));
			$days 	= array();
			$weeks 	= array();

			//加入空数据
			for ($j = 0 ; $j < $weekDay; $j++, $index++)
			{
				$days[$j]["day"] 		= "";		//当前 日
				$days[$j]["isDisabled"] = true;		//是否可选
				$days[$j]["isChecked"] 	= false;	//是否选中
				$days[$j]["index"]		= $index;	//在整个日历中的序号
			}

			//加入空数据后的信息, 利用了上一组FOR的J值
			for( $k = 1; $k <= $lastDay; $j++, $k++, $index++)
			{
				$days[$j]["index"]	= $index;
				$days[$j]["day"] 	= $k;
				$days[$j]["date"] 	= $year . "-" . $month . '-' . $k;	//格式化前的日期如2016-01-01
				
				//如果小于开始值，则将状态至为 不能点击
				if ($k < $firstDay)
				{
					$days[$j]["isDisabled"] = true;
					$days[$j]["class"] 		= "stable";		//设置样式
				}
				else
				{
					$days[$j]["isDisabled"] = false;		//设置不可点击
				}

				//如果为周六，则将当前天信息加入 周 变量
				//将$j重新初始化的，是由于如果数组的起点不是 0 ，那么将被en_code为对象
				if ($j%7 == 6)
				{
					$weeks[] 	= $days;
					$days 		= array();
					$j 			= -1;
				}
			}

			//补完不到满周的
			for( ; $j%7 != 0; $j++, $index++)
			{
				$days[$j]["index"]	= $index;
				$days[$j]["day"] = "";
				$days[$j]["isDisabled"] = true;
				$days[$j]["isChecked"] = false;
			}

			//如果days非空数组，则将其添加到周数组
			if (count($days))
			{
				$weeks[] = $days;
			}

			$data[] = array(
				"month"			=> $month,			//月
				"year"			=> $year,			//年
				"isShow"		=> $isShow,			//是否为当前月
				"isFirstMonth" 	=> $isFirstMonth,	//是否为首月
				"isLastMonth"	=> $isLastMonth,	//是否为尾月
				"weeks"			=> $weeks,			//周数
				);

			$firstDay 		= "1";
			$isShow 		= false;
			$isFirstMonth 	= false;
			$month = get_next_month($year . "-" . $month);	//获取下月月份

			if ($nextMonth == "01")
			{
				$year += 1;
			}

		}

		$calendar["data"] = $data;
		return json_encode($calendar);
	}

	/**
	 * 获取近三个月的订单信息
	 * @return [type] [description]
	 */
	public function getOrders()
	{
		$OrderL = new OrderLogic();
		$orders = $OrderL->getListsByCustomerId(session("openId"));
		foreach ($orders as $key => $value)
		{
			$orders["$key"]['begin_time_str'] = date("Y-m-d",$value["begin_time"]);
			$orders["$key"]['end_time_str'] = date("Y-m-d",$value["end_time"]);
		}
		return json_encode($orders) ;
	}

	/**
	 *获取所有房型信息，供用户预订
	 * @return json 
	 */
	public function getRooms()
	{
		$beginDate = date("Y-m-d");
		$endDate = date("Y-m-d", time()+ 60*24*60);

		//实例化
		$RoomL = new RoomLogic();
		$rooms = $RoomL->getAllListsWithTimeRange($beginDate, $endDate);

		return json_encode($rooms);
	}

	public function getOrderInfo()
	{
		$data = array("customerName"=>"", 	//客户姓名
			"customerPhone"=>"",			//客户电话
			"notice"=>"", 					//住店需知
			"prompt"=>"", 					//温馨提示
			"credit"=>"100");				//积分兑换
		$openId = session("openId");
		// $openId = "oha4Tt4g9_IZ047Q_WxrR4FWQsYA";

		//取最后一条订单信息
		$OrderL = new OrderLogic();
		if ($order = $OrderL->getLastListByOpenId($openId))
		{
			$data['customer_name'] = $order['customer_name'];
			$data['customer_phone'] = $order['customer_phone'];
		}

		//取配置信息
		$ConfigL = new ConfigLogic();
		if ($notice = $ConfigL->getValueByName("notice"))
		{
			$data['notice'] = $notice['value'];
		}

		if ($prompt = $ConfigL->getValueByName("prompt"))
		{
			$data['prompt'] = $prompt['value'];
		}

		if ($credit = $ConfigL->getValueByName("credit"))
		{
			$data['credit'] = $credit['value'];
		}

		$this->orderInfo = $data;
		return $data;
	}

	/**
	 * 取活动信息列表
	 * xulinjie
	 * @return lists
	 */
	public function getActivityLists()
	{
		$ActivityL = new ActivityLogic();

		//设置查询条件
		$maps = array("status"=>"0");
		$ActivityL->setMaps($maps);

		//设置取回字段
		$fields = array("id","end_time","title","thumbnails_url");
		$ActivityL->setBackFields($fields);

		//取LISTS
		$activeties = $ActivityL->getLists(); 

		//返回值
		return json_encode($activeties) ;
	}
	/**
	 * 取幻灯片
	 * xulinjie
	 * @return 
	 */
	public function home()
	{
		//实例化幻灯片
		$SlideShowL = new SlideShowLogic();
		$slideshows = $SlideShowL->getNormalLists();

		//抓取出：存在URL值而且不是首页地图信息的信息，并返回
		foreach($slideshows as $key => $value)
		{
			if ($value['url'] !== '' && $value['is_map'] == '0')
			{
				$datas['slideUrls'][] = $value['url'];
			}
			if ($value['url'] !== '' && $value['is_map'] == '1')
			{
				$datas['slideMapUrl'] = $value['url'];
				break;
			}
		}
		return json_encode($datas) ;
	}
}