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
			<?php $order = I('get.order') ?>
			<th><a href="<eq name='order' value="desc"> {:U('index?by=title&order=asc', I('get.'))}  
			<else/> {:U('index?by=title&order=desc', I('get.'))} </eq>">标题</a></th>	
			<th>缩略图</th>
			<th><a href="<eq name='order' value="desc"> {:U('index?by=weight&order=asc', I('get.'))}  
			<else/> {:U('index?by=weight&order=desc', I('get.'))} </eq>">权重</a></th>	
			<th>状态</th>
			<th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                               <foreach name="slideshows" item="slideshow" key="k">
			<tr>
				<td>{$k+1}</td>
				<td>{$slideshow[title]}</td>
				<td><img class="suoluetu" src="{$slideshow[url]}" /></td>
				<td>{$slideshow[weight]}</td>
				<td>{$slideshow[status]?'正常':'冻结'}</td>
				<td><a class="btn btn-sm btn-success" href="{:U('detail?id='.$slideshow['id'].'&p='.I('get.p'))}">查看</a>&nbsp;&nbsp;
				<a class="btn btn-sm btn-success" href="{:U('edit?id='.$slideshow['id'].'&p='.I('get.p'))}">编辑</a>&nbsp;&nbsp;
				<a class="btn btn-sm btn-success" href="{:U('delete?id='.$slideshow['id'].'&p='.I('get.p'))}">删除</a></td>
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

