<extend name='Base:index' />
<block name="body">
     <div class="row-fluid">
            <div class="col-xs-12">
                    <div class="box-body table-responsive">
						<div class="panel-body">
							<a class="button btn btn-info"  href="{:U('add')}" ><i class="glyphicon glyphicon-plus"></i>&nbsp添加活动</a>
						</div>
						<div class="col-xs-3">
						<form action="{:U('index?p=',I('get.'))}" method="get">
						   <div class="input-group custom-search-form">
                            <input class="form-control" name="keywords" placeholder="Search..." type="text" value="{:I('get.keywords')}" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        	</div>
						</form>
						</div>

						<table class="table table-bordered table-striped table-hover">
							<thead>
							<tr>
								<th>序号</th>&nbsp
								<?php $order = I('get.order') ?>
								<th><a href="<eq name='order' value="desc"> {:U('index?by=id&order=asc', I('get.'))}  
								<else/> {:U('index?by=id&order=desc', I('get.'))} </eq>">活动编号</a></th>
								<th>活动名</th>&nbsp
								<th>缩略图</th>&nbsp
								<th>活动详情</th>&nbsp
								<th>活动截止时间</th>&nbsp
								<th>状态</th>&nbsp	
								<th>操作</th>
							</tr>
							</thead>


							<tbody>
							<foreach name="activities" item="activity" key="k">
							<tr>
								<td>{$k+1}</td>&nbsp
								<td>{$activity[id]}</td>&nbsp
								<td>{$activity[title]}</td>&nbsp
								<td class="col-xs-3"><img class="thumbnails"  src="{$activity[thumbnails_url][0]}"  /></td>&nbsp
								<td>{$activity[detail]}</td>&nbsp
								<td>{$activity[end_time]}</td>&nbsp
								 <td><eq name="activity.status" value="0">正常<else/><span class="badge">冻结</span></eq></td>
								<td><a class="button btn btn-xs btn-success" href="{:U('detail?id='.$activity['id'])}"><i class="fa fa-search"></i>&nbsp查看</a>&nbsp;&nbsp;
								<a class="button btn btn-xs btn-primary" href="{:U('edit?id='.$activity['id'],I('get.'))}"><i class="fa fa-pencil"></i>&nbsp编辑</a>&nbsp;&nbsp;
								<a class="button btn btn-xs btn-danger" href="{:U('delete?id='.$activity['id'],I('get.'))}"><i class="fa fa-trash-o "></i>&nbsp删除</a></td>
							</tr>
							</foreach>
							</tbody>
						</table>
					</div>
                    <nav>

					<Html:page />
                	</nav>
                </div>
            
       </div>
<style type="text/css">
.thumbnails{
	height: 110px;
	width: 56px;
}
</style>
</block>
