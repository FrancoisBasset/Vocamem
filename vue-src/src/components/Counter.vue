<template>
	<div style="display: flex; flex-direction: row; padding: 3px">
		<button @click="counter++">+ 1</button>
		<button @click="counter += 2">+ 2</button>
		<button @click="counter += 5">+ 5</button>
		<button @click="counter += 10">+ 10</button>
		{{ counter }}
	</div>
</template>

<script>
export default {
	data: () => ({
		counter: 0
	})
};
</script>
