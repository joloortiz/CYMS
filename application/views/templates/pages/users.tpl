{extends file="layouts/"|cat:$layout}
{block name=body}

		<h1>{$page_title}</h1>

		<div class="alert alert-success {if $opt == ''}hide{/if}">{if $opt != ''}{$msg}{/if}</div>

		<table id="tablesorter" class="table">
			<thead>
				<tr>
					<th>Username</th>
					<th>Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			{foreach from=$users item=v}
				<tr>
					<td>{$v['u_username']}</td>
					<td>{$v['u_lastname']}, {$v['u_firstname']} {$v['u_mi']}</td>
					<td><a><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;<a><span class="glyphicon glyphicon-trash"></a></span></td>
				</tr>
			{/foreach}
			</tbody>
		</table>
		<div>
			{$pagination}
		</div>
{/block}