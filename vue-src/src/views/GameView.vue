<template>
	<div>
		<div>Mot en cours : {{ wordsStore.steps[0] }}</div>
		<br />

		<div>
			<button @click="check('old')">Déjà-vu</button>
			<button @click="check('new')">Nouveau</button>
		</div>
	</div>
</template>

<script>
import useWords from '@/stores/words';

export default {
	setup: () => ({
		wordsStore: useWords()
	}),
	created() {
		this.wordsStore.startGame();
	},
	methods: {
		check(response) {
			this.wordsStore.check(response);
			this.wordsStore.nextStep();
		}
	},
	watch: {
		'wordsStore.steps'() {
			if (this.wordsStore.steps.length === 0) {
				alert(this.wordsStore.errors.length + ' erreurs !');
			}
		}
	}
};
</script>
