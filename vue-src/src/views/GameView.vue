<template>
	<div class="flex flex-col gap-4">
		<MenuButton />

		<div class="flex flex-col items-center">
			<label class="text-3xl">{{ wordsStore.steps[0] }}</label>

			<div class="flex gap-4">
				<button @click="check('old')" class="bg-blue-300 p-5">Déjà-vu</button>
				<button @click="check('new')" class="bg-teal-300 p-5">Nouveau</button>
			</div>
		</div>
	</div>
</template>

<script>
import MenuButton from '@/components/MenuButton.vue';
import useWords from '@/stores/words';

export default {
	components: { MenuButton },
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
