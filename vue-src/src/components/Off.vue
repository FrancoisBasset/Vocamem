<template>
	<div>
		<button v-if="!isFullScreen" @click="setFullScreen">Plein écran</button>
		<button v-else @click="exitFullScreen">Quitter plein écran</button>
		<button @click="Neutralino.app.killProcess()">Quitter l'application</button>

		<button v-if="!isCenter" @click="center">Centrer</button>
	</div>
</template>

<script>
import Neutralino from '@neutralinojs/lib';

export default {
	data: () => ({
		isFullScreen: false,
		isCenter: true
	}),
	setup: () => ({
		Neutralino: Neutralino
	}),
	created() {
		this.center();

		setInterval(() => {
			this.checkCenter().then(isCenter => {
				this.isCenter = isCenter;
			});
		}, 500);
	},
	methods: {
		setFullScreen() {
			Neutralino.window.setFullScreen();
			this.isFullScreen = true;
		},
		exitFullScreen() {
			Neutralino.window.exitFullScreen();
			this.isFullScreen = false;
		},
		center() {
			Neutralino.window.center();
			this.isCenter = true;
		},
		async checkCenter() {
			const tolerance = 5;

			const windowSize = await Neutralino.window.getSize();
			const windowPos = await Neutralino.window.getPosition();

			const expectedX = Math.round((screen.width - windowSize.width) / 2);
			const expectedY = Math.round((screen.height - windowSize.height) / 2);

			const isCenteredX = Math.abs(windowPos.x - expectedX) <= tolerance;
			const isCenteredY = Math.abs(windowPos.y - expectedY) <= tolerance;

			return isCenteredX || isCenteredY;
		}
	}
};
</script>
