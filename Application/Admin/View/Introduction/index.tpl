<extend name="Base:index" />
<block name="body">
        <div class="row-fluid">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive">
                        <div class="panel-body">
                        	<a class="button btn btn-info"  href="{:U('add')}" >添加</a>
                        </div>
                    <form action="{:U('index?p=', I('get.'))}" method="get">
                        <div class="panel-body">
				    	   <input type="text" placeholder="search" name="keywords" value ="{:I('get.keywords')}">
				    	   </input>
				    	   <button id="search" type="submit">搜索</button>
    					</div>
    				</form>
                        <!-- Table -->
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>电话</th>
                                    <th>描述</th>	
			                        <th>缩略图</th> 
			                        <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
        <foreach name="introduction" item="introduction" key="k">
			<tr>
				<td>{$k+1}</td>
				<td>{$introduction['hotel_phone']}</td>
				<td>{$introduction['description']}</td>
				<td><img class="suoluetu" src="{$introduction['url']}" /></td>
				<td><a class="btn btn-sm btn-success" href="{:U('detail?id='.$introduction['id'].'&p='.I('get.p'))}">查看</a>&nbsp;&nbsp;
				<a class="btn btn-sm btn-success" href="{:U('edit?id='.$introduction['id'].'&p='.I('get.p'))}">编辑</a>&nbsp;&nbsp;
				<a class="btn btn-sm btn-success" href="{:U('delete?id='.$introduction['id'].'&p='.I('get.p'))}">删除</a></td>
			</tr>
		</foreach>	
                            </tbody>
                        </table>

                    </div>
                    <nav>
                        <Yunzhi:page />
	
                    </nav>
                </div>
            </div>
        </div>
	<style type="text/css">
	.suoluetu{
		height: 50px;
	}

</block>




<label>电话:{$introduction[hotel_phone]}</br></label>
<label>描述:{$introduction[description]}</br></label>
<label>URL</label><img class="suoluetu" src="{$introduction[url]}" /></br>

<a class="button" href="{:U('edit?id='.$introduction['id'])}">编辑</a>&nbsp;&nbsp;
	<style type="text/css">
	.suoluetu{
		height: 50px;
	}
</block>