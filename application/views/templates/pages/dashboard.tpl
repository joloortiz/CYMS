{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="container">
		<h1>DASHBOARD HERE!</h1>
	</div>
	<script>
		function print(frame) {
			frame.focus();
			frame.print();
		}
	</script>
{/block}