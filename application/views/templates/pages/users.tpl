{extends file="layouts/"|cat:$layout}
{block name=body}

		<h1>{$page_title}</h1>

		<div class="alert alert-success {if $opt == ''}hide{/if}">{if $opt != ''}{$msg}{/if}</div>

		<table class="table">
			<thead>
				<tr>
					<th>Username</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
			</tbody>
		</table>
{/block}