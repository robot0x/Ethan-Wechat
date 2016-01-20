<extend name='Base:index' />
<block name="body">
     <div class="row-fluid">
            <div class="col-xs-12">
                    <div class="row">
                    <div class="col-xs-3">
						<form action="{:U('index?p=&keywords=', I('get.'))}" method="get">
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
						<div class="col-md-3">
							<a class="button btn btn-info"  href="{:U('add')}" ><i class="glyphicon glyphicon-plus"></i>添加活动</a>
						</div>
				
						<div class="panel-body">
                    	</div>
						<table class="table table-bordered table-striped table-hover">
							<thead>
							<tr>
								<th>序号</th>
								<th>活动名</th>
								<th>缩略图</th>
								<th>活动详情</th>
								<th>活动截止时间</th>
								<th>状态</th>	
								<th>操作</th>
							</tr>
							</thead>


							<tbody>
							<foreach name="activities" item="activity" key="k">
							<tr>
								<td>{$k+1}</td>
								<!-- <td>{$activity[id]}</td>&nbsp -->
								<td>{$activity["title"]}</td>
								<td class="col-xs-3"><img class="thumbnails"  src="{$activity['thumbnails_url']}"  /></td>
								<td>{$activity["detail"]}</td>
								<td>{$activity["end_time"] | date="Y-m-d", ###}</td>
								 <td><eq name="activity['status']" value="0">正常<else/><span class="badge">冻结</span></eq></td>
								<td>
								<a class="button btn btn-sm btn-primary" href="{:U('edit?id='.$activity['id'],I('get.'))}"><i class="fa fa-pencil"></i>&nbsp;编辑</a>&nbsp;&nbsp;
								<a class="button btn btn-sm btn-danger" href="{:U('delete?id='.$activity['id'],I('get.'))}"><i class="fa fa-trash-o "></i>&nbsp;删除</a></td>
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
	
}
</style>
</block>
