import { defineStore } from 'pinia';
import words_list from '@/assets/liste_francais.txt?raw';

export default defineStore('words', {
	state: () => ({
		newWords: [],
		oldWords: [],
		steps: [],
		errors: 0
	}),
	getters: {
		current() {
			return this.steps[0];
		}
	},
	actions: {
		startGame() {
			const words = words_list.split('\r\n');

			for (let i = 0; i < 10; i++) {
				const index = Math.floor(Math.random() * words.length);

				this.newWords.push(words[index]);

				words.splice(index, 1);
			}

			console.log(this.newWords);

			this.steps = [];

			for (let i = 0; i < 50; i++) {
				const index = Math.floor(Math.random() * this.newWords.length);

				this.steps.push(this.newWords[index]);
			}
		},
		nextStep() {
			if (!this.oldWords.includes(this.steps[0])) {
				this.oldWords.push(this.steps[0]);
				this.newWords = this.newWords.filter(w => w !== this.steps[0]);
			}

			this.steps.splice(0, 1);
		},
		check(response) {
			if ((response === 'new' && this.oldWords.includes(this.steps[0])) || (response === 'old' && this.newWords.includes(this.steps[0]))) {
				this.errors++;
			}
		}
	}
});
