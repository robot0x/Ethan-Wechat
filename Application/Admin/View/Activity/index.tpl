<extend name='Base:index' />
<block name="body">
     <div class="row-fluid">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive">
						<div class="panel-body">
							<a class="button btn btn-info"  href="{:U('add')}" >添加</a>
						</div>

						<form action="{:U('index?p=',I('get.'))}" method="get">
							<div class="panel-body">
								<input type="text" placeholder="search" name="keywords" value ="{:I('get.keywords')}">
								</input>
								<button id="search" type="submit">搜索</button>
						    </div>
						</form>

						<!-- <form action="{:U('index')}" method="get"> -->
						<table class="table table-bordered table-striped table-hover">
							<thead>
							<tr>
								<th>序号</th>&nbsp
								<?php $order = I('get.order') ?>
								<th><a href="<eq name='order' value="desc"> {:U('index?by=id&order=asc', I('get.'))}  
								<else/> {:U('index?by=id&order=desc', I('get.'))} </eq>">活动编号</a></th>
								<th>缩略图</th>&nbsp
								<th>活动名</th>&nbsp
								<th>活动结束时间</th>&nbsp
								<th>活动详情</th>&nbsp
								<th>状态</th>&nbsp	
								<th>操作</th>
							</tr>
							</thead>


							<tbody>
							<foreach name="activities" item="activity" key="k">
							<tr>
								<td>{$k+1}</td>&nbsp
								<td>{$activity[id]}</td>&nbsp
								<td><img class="thumbnail" src="{$activity[thumbnails_url]}" /></td>&nbsp
								<td>{$activity[title]}</td>&nbsp
								<td>{$activity[end_time]}</td>&nbsp
								<td>{$activity[detail]}</td>&nbsp
								<td>{$activity[status]?'正常':'冻结'}</td>&nbsp
								<td><a class="button btn btn-sm btn-success" href="{:U('detail?id='.$activity['id'])}">查看</a>&nbsp;&nbsp;
								<a class="button btn btn-sm btn-success" href="{:U('edit?id='.$activity['id'])}">编辑</a>&nbsp;&nbsp;
								<a class="button btn btn-sm btn-success" href="{:U('delete?id='.$activity['id'])}">删除</a></td>
							</tr>
							</foreach>
							</tbody>
						</table>
					</div>
                    <nav>
<!-- </form> -->
					<Yunzhi:page />
                	</nav>
                </div>
            </div>
       </div>
<style type="text/css">
.thumbnail{
	width: 10px;
}
</style>
</block>
