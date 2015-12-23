<!DOCTYPE html>
<html>

<head>
    <include file="Base/head" />
</head>

<body>
	<block name="wrapper">
	    <div id="wrapper">

	    	{$YZ_TEMPLATE_NAV}
	    	<include file="Base/body" />
		<div style="clear:both;display:block">footer</div>
	    </div>
	    <!--/#wrapper-->
	    <block name="footer">
			<p>
	            <span style="text-align:left;float:left">&copy; 2014 <a href="http://www.mengyunzhi.com" alt="Bootstrap_Metro_Dashboard">梦云智</a></span>
	        </p>
        </block>
		<include file="Base/footer" />
</body>

</html>
